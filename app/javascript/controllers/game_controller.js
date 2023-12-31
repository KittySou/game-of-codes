import { Controller } from "@hotwired/stimulus"
import Mustache from "mustache"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="game"
export default class extends Controller {
  static targets = [
    "tips",
    "startButton",
    "questionContainer",
    "questionTemplate",
    "form",
    "answerConfirmation",
    "nextButton",
    "gameArea",
    "answerInput",
    "progressBar",
    "congratulationsTemplate",
    "loserTemplate",
    "winnerTemplate",
    "tipsHeader",
    "deckHeader",
    "stopwatch",
    "opponentProgressBar",
    "countdown"
  ]

  static outlets = [ "tips-button" ]

  static values = {
    deckId: Number,
    racetrackId: Number,
    playerId: Number,
    opponentId: Number,
    playerTwoId: Number,
    playerOneId: Number,
  }

  connect() {
    // INFO (Fred): This is a list of the instance variables used for the game's logic.
    // While we absolutely do not need to declare them as null here, it is nevertheless helpful
    // to know what they are.

    // Contains all of the questions and answers.
    this.deck = null

    // Contains the question that is currently displayed to the user.
    this.currentQuestion = null

    // Contains a boolean that indicates whether the deck is empty or not.
    this.isDeckCompleted = null

    // Contains the initial number of questions in the deck. Considering that we are
    // removing corrently answered questions from the deck, having the initial number
    // will be useful for display purposes (ie. show the completion %)
    this.totalNumberOfQuestions = null

    // Contains whether a game is single player or multiplayer.
    // By default, the games are single player.
    this.isMultiplayer = false
    this.#checkIfMultiplayer()

    this.numberOfCorrectAnswers = 0

    this.startDate = null
    this.timer = null
    if (this.isMultiplayer) {
      this.#subscribeToRacetrack()
      if (this.playerIdValue !== this.playerTwoIdValue) {
        this.opponentProgressBarTarget.classList.add("away")
        this.startButtonTarget.innerText = "Waiting on opponent..."
        this.startButtonTarget.disabled = true
      }
    }

    this.countdown = null;
  }

  disconnect() {
    if (this.isMultiplayer) { this.channel.unsubscribe() }
  }

  start() {
    if (this.isMultiplayer && this.playerIdValue === this.playerOneIdValue) {
      this.channel.perform("start_game", { playerId: this.playerIdValue })
    }
    document.querySelector('.tips-btn').classList.remove('d-none')
    this.tipsTarget.classList.add("d-none")
    this.startButtonTarget.classList.add("d-none")
    this.#fetchDeckQuestions()
    this.#timeStart()
  }

  #getCurrentTime() {
    const dateTimer = new Date(new Date().valueOf() - this.startDate.valueOf());

    return ('0'+dateTimer.getUTCMinutes()).slice(-2) + ':' +
      ('0'+dateTimer.getUTCSeconds()).slice(-2);
  }

  #timeStart() {
    this.startDate = new Date();
    this.timer = setInterval(() => {
      this.stopwatchTarget.innerHTML = this.#getCurrentTime()
    }, 100);
  }

  #timeStop() {
    clearInterval(this.timer);
  }

  #endGame(template) {
    const output = Mustache.render(template, { time: this.#getCurrentTime() })
    this.gameAreaTarget.innerHTML = output
    this.#timeStop()
    if (this.isMultiplayer) { this.#broadcastProgress() }
    this.stopwatchTarget.innerText = "DONE"
  }

  send() {
    // TODO (Fred): Check if we can do the line below with Stimulus...
    const userAnswerInput = document.querySelector("input[name=answer]:checked")
    const userAnswer = userAnswerInput.value
    const userGuessedRight = this.currentQuestion.answers.find(answer => answer.id === userAnswer).rightAnswer

    const label = userAnswerInput.nextElementSibling
    if (userGuessedRight) {
      label.classList.add('correct-answer')
    } else {
      label.classList.add('incorrect-answer')
    }

    if (userGuessedRight) {
      this.#removeCurrentQuestionFromDeck()
      this.numberOfCorrectAnswers++
      this.#updateProgressBar( this.progressBarTarget, this.numberOfCorrectAnswers)
    }
    if (this.isDeckCompleted) {
      const token = document.getElementsByName(
        "csrf-token"
      )[0].content;
      const headers = {
        "Accept": "application/json",
        "X-CSRF-Token": token,
        "Content-Type": "application/json"
      }

      if (this.isMultiplayer) {
        const body = {
          winning_player_id: this.playerIdValue
        }
        const url = `/racetracks/${this.racetrackIdValue}`
        fetch(url, {
          headers: headers,
          method: "PATCH",
          body: JSON.stringify(body)
        })
        this.#endGame(this.winnerTemplateTarget.innerHTML)
        return
      } else {
        const url = `/decks/${this.deckIdValue}/completed`
        fetch(url, {
          headers: headers,
          method: "POST"
        })
        this.#endGame(this.congratulationsTemplateTarget.innerHTML)
        return

      }

    }

    if (userGuessedRight) {
      if (this.isMultiplayer) { this.#broadcastProgress() }
      this.answerConfirmationTarget.innerHTML = "<h3>You guessed right!</h3>"
      // make question disappear from array of questions
      // move on to the next question
    } else {
      this.answerConfirmationTarget.innerHTML = "<h3>Oops wrong answer!</h3>"
    }
    this.nextButtonTarget.classList.remove("d-none")
    // this.answerInputTarget.disabled = true (disables only the first answer)
    // 👇 querySelectorAll on radio buttons .foreach -> disabled = true
    const answersInput = document.querySelectorAll("input[name=answer]");
    answersInput.forEach(input => {
      input.disabled = true
    });

  //   const answerLabels = document.querySelectorAll(".btn.btn-success");
  // answerLabels.forEach(label => {
  //   const isCorrect = label.classList.contains("correct");
  //   if (isCorrect) {
  //     label.classList.add("btn-correct");
  //   } else {
  //     label.classList.add("btn-incorrect");
  //   }
  // });
  }


  #updateProgressBar(progressBar, numberOfCorrectAnswers) {
    const percentage = numberOfCorrectAnswers / this.totalNumberOfQuestions * 100
    // 1. update the progress bar width
    progressBar.querySelector('.green-bar').style.width = `${percentage}%`
    // 2. update the text
    progressBar.querySelector('.percentage').innerText = `${percentage}%`
  }

  nextQuestion() {
    this.answerConfirmationTarget.innerHTML = ""
    this.#setNewQuestion()
  }

  #setNewQuestion() {
    const template = this.questionTemplateTarget.innerHTML
    this.currentQuestion = this.#getRandomElementFromArray(this.deck)
    const output = Mustache.render(template, this.currentQuestion)
    this.questionContainerTarget.innerHTML = output
    this.questionContainerTarget.querySelectorAll('input[type=radio]').forEach((input) => {
      input.addEventListener('change', () => {
        this.send()
      })
    })
  }

  #getRandomElementFromArray(array) {
    return array[Math.floor(Math.random() * array.length)]
  }

  #removeCurrentQuestionFromDeck() {
    // Get index of the current question in the deck
    const index = this.deck.indexOf(this.currentQuestion)
    // Remove the current question by splicing the array,
    // starting at the index of the current question and removing one element there
    this.deck.splice(index, 1)
    // After removing the current question from the deck, check if there's any questions left.
    // If there's none, it means that the deck is completed.
    this.isDeckCompleted = this.deck.length === 0
  }

  async #fetchDeckQuestions() {
    // INFO: this is for development purposes only
    // this.deck = [{
    //   "content": "Quel est la somme de 1 et 1?",
    //   "answers": [
    //     {"id": "1", "content": "3", "rightAnswer": false},
    //     {"id": "2", "content": "1", "rightAnswer": false},
    //     {"id": "3", "content": "2", "rightAnswer": true},
    //     {"id": "4", "content": "4", "rightAnswer": false}
    //   ]
    // }]
    // this.totalNumberOfQuestions = this.deck.length
    // this.#setNewQuestion()
    // this.setHeader()

    // INFO: this is the NEEDED code to make the game work
    const url = `/decks/${this.deckIdValue}/questions`
    await fetch(url, {headers: { "Accept": "application/json" }})
    .then(response => response.json())
    .then((data) => {
      this.deck = data
      this.totalNumberOfQuestions = this.deck.length

      if (this.isMultiplayer) {
        this.countdown = 3
        this.#updateCountdown()
        const interval = setInterval(() => {
          this.countdown--
          if (this.countdown === 0) {
            clearInterval(interval)
            this.#setNewQuestion()
            this.setHeader()
          }
          this.#updateCountdown()
        }, 1000)
      } else {
        this.#setNewQuestion()
        this.setHeader()
      }
    })
  }

  #updateCountdown() {
    const div = this.countdownTarget
    if (this.countdown <= 0) {
      div.classList.add('d-none')
    } else {
      div.firstElementChild.innerHTML = this.countdown
      div.classList.remove('d-none')
    }
  }

  setHeader() {
    this.tipsHeaderTarget.classList.add('d-none')
    this.deckHeaderTarget.classList.remove('d-none')
  }

  #checkIfMultiplayer() {
    this.isMultiplayer = this.racetrackIdValue > 0
  }

  #subscribeToRacetrack() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "RacetrackChannel", id: this.racetrackIdValue, playerId: this.playerIdValue },
      {
        received: (data) => {
        if (data.playerId === this.opponentIdValue && data.action === "progress") {
          this.#updateProgressBar(this.opponentProgressBarTarget, data.numberOfCorrectAnswers)
          if (data.isDeckCompleted) {
            this.#endGame(this.loserTemplateTarget.innerHTML)
          }
        } else if (data.action === "appear" && data.playerId === this.playerTwoIdValue) {
          this.opponentProgressBarTarget.classList.remove('away');
          this.startButtonTarget.disabled = false;
          this.startButtonTarget.innerText = "Start";
        } else if (data.action === "start_game" && data.playerId !== this.playerIdValue) {
          this.start()
        }
      }}
    )
  }

  #broadcastProgress() {
    const body = {
      numberOfCorrectAnswers: this.numberOfCorrectAnswers,
      isDeckCompleted: this.isDeckCompleted,
      playerId: this.playerIdValue
    }

    this.channel.perform("progress", body)
  }
}
