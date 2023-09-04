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
    "checkButton",
    "nextButton",
    "gameArea",
    "answerInput",
    "congratulationsTemplate"
  ]

  static values = { deckId: Number }

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
  }

  start() {
    this.tipsTarget.classList.add("d-none")
    this.startButtonTarget.classList.add("d-none")
    this.#fetchDeckQuestions()
  }

  send(event) {
    event.preventDefault()
    // TODO (Fred): Check if we can do the line below with Stimulus...
    const userAnswer = document.querySelector("input[name=answer]:checked").value
    const userGuessedRight = this.currentQuestion.answers.find(answer => answer.id === userAnswer).rightAnswer
    if (userGuessedRight) {
      this.#removeCurrentQuestionFromDeck()
    }
    if (this.isDeckCompleted) {
      const url = `/decks/${this.deckIdValue}/completed`
      fetch(url, {
        headers: { "Accept": "application/json" }
      })
      const template = this.congratulationsTemplateTarget.innerHTML
      const output = Mustache.render(template)
      this.gameAreaTarget.innerHTML = output
      return
    }

    if (userGuessedRight) {
      this.answerConfirmationTarget.innerHTML = "<h3>You guessed right!</h3>"
      // make question disappear from array of questions
      // move on to the next question
    } else {
      this.answerConfirmationTarget.innerHTML = "<h3>Oops wrong answer!</h3>"
    }
    this.nextButtonTarget.classList.remove("d-none")
    this.checkButtonTarget.classList.add("d-none")
    //TODO: querySelectorAll on radio buttons .foreach -> disable = true
    this.answerInputTarget.disabled = true
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
    //         {"id": "1", "content": "3", "rightAnswer": true},
    //         {"id": "2", "content": "1", "rightAnswer": false},
    //         {"id": "3", "content": "2", "rightAnswer": false},
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
      })
  }
}
