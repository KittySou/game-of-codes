import { Controller } from "@hotwired/stimulus"
import Mustache from "mustache"

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
    "tipsHeader",
    "deckHeader",
    "stopwatch",
    "opponentProgressBar"
  ]

  static values = {
    deckId: Number,
    racetrackId: Number,
    playerId: Number,
    opponentId: Number
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

    this.numberOfCorrectAnswers = 0

    this.startDate = null
    this.timer = null
  }

  start() {
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
    const userAnswer = document.querySelector("input[name=answer]:checked").value
    const userGuessedRight = this.currentQuestion.answers.find(answer => answer.id === userAnswer).rightAnswer
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
      } else {
        const url = `/decks/${this.deckIdValue}/completed`
        fetch(url, {
          headers: headers,
          method: "POST"
        })
      }

      this.#endGame(this.congratulationsTemplateTarget.innerHTML)
      return
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
    //👇 querySelectorAll on radio buttons .foreach -> disabled = true
    const answersInput = document.querySelectorAll("input[name=answer]");
    answersInput.forEach(input => {
      input.disabled = true
    });
  }

  #updateProgressBar(progressBar, numberOfCorrectAnswers) {
    const percentage = numberOfCorrectAnswers / this.totalNumberOfQuestions * 100
    // 1. update the progress bar width
    progressBar.querySelector('.green-bar').style.width = `${percentage}%`
    // 2. update the text
    progressBar.querySelector('.completed-text').innerText = `DECK ${percentage}% COMPLETED!`
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
    //     "content": "Quel est la somme de 1 et 1?",
    //     "answers": [
    //         {"id": "1", "content": "3", "rightAnswer": false},
    //         {"id": "2", "content": "1", "rightAnswer": false},
    //         {"id": "3", "content": "2", "rightAnswer": true},
    //         {"id": "4", "content": "4", "rightAnswer": false}
    //       ]
    //     }]
    //         this.totalNumberOfQuestions = this.deck.length
    //         this.#setNewQuestion()

    // INFO: this is the NEEDED code to make the game work
    const url = `/decks/${this.deckIdValue}/questions`
    await fetch(url, {headers: { "Accept": "application/json" }})
    .then(response => response.json())
    .then((data) => {
      this.deck = data
      this.totalNumberOfQuestions = this.deck.length
      this.#setNewQuestion()
      this.setHeader()
      })
  }

  setHeader() {
    this.headerTarget.innerText = "Question"
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
      { channel: "RacetrackChannel", id: this.racetrackIdValue },
      { received: (data) => {
        if (data.playerId === this.opponentIdValue) {
          this.#updateProgressBar(this.opponentProgressBarTarget, data.numberOfCorrectAnswers)
          if (data.isDeckCompleted) {
            this.#endGame('<h3>Oh no, you lost :(<h3>')
              // need new LOST template
              // stop clock for loser
          }
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

    this.channel.send(body)
  }
}
