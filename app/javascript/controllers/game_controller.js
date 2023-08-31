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
    "nextButton"
  ]

  connect() {
  }

  display() {
    // will become fetch so that we can use seeds
    this.questions =
      [
        {
          "content": "Quel est la somme de 1 et 1?",
          "answers": [
            {"id": 1, "content": "3", "rightAnswer": false},
            {"id": 2, "content": "1", "rightAnswer": false},
            {"id": 3, "content": "2", "rightAnswer": true},
            {"id": 4, "content": "4", "rightAnswer": false}
          ]
        },
        {
          "content": "J'ai quel age?",
          "answers": [
            {"id": 5, "content": "31", "rightAnswer": false},
            {"id": 6, "content": "15", "rightAnswer": false},
            {"id": 7, "content": "20", "rightAnswer": true},
            {"id": 8, "content": "je ne sais pas", "rightAnswer": false}
          ]
        },
        {
          "content": "Quelle heure est-il?",
          "answers": [
            {"id": 9, "content": "midi", "rightAnswer": false},
            {"id": 10, "content": "minuit", "rightAnswer": false},
            {"id": 11, "content": "matin", "rightAnswer": true},
            {"id": 12, "content": "happy hour!!!!", "rightAnswer": false}
          ]
        },
        {
          "content": "Les gateaux aux ________ sont les gateaux preferes de Kitty.",
          "answers": [
            {"id": 13, "content": "chocolat", "rightAnswer": false},
            {"id": 14, "content": "vanille", "rightAnswer": false},
            {"id": 15, "content": "red velvet", "rightAnswer": true},
            {"id": 16, "content": "carotte", "rightAnswer": false}
          ]
        }
      ]

    // Maybe we'll need the answers id? Or maybe their index? To be determ[0]

    const template = this.questionTemplateTarget.innerHTML
    this.currentQuestion = this.questions[Math.floor(Math.random() * this.questions.length)]
    const output = Mustache.render(template, this.currentQuestion)
    this.questionContainerTarget.innerHTML = output

    this.tipsTarget.classList.add("d-none")
    this.startButtonTarget.classList.add("d-none")

  }

  send(event) {
    event.preventDefault()
    // TODO (Fred): Check if we can do the line below with Stimulus...
    const userAnswer = Number.parseInt(document.querySelector("input[name=answer]:checked").value, 10)
    const userGuessedRight = this.currentQuestion.answers.find(answer => answer.id === userAnswer).rightAnswer
    // answers.find(answer => answer.id === userAnswer).rightAnswer
    if (userGuessedRight) {
      this.answerConfirmationTarget.innerHTML = "<h3>You guessed right!</h3>"
      // make question disappear and move on to the next question
    } else {
      this.answerConfirmationTarget.innerHTML = "<h3>Oops wrong answer!</h3>"
      // move on to next question and put back in the deck
    }
    this.checkButtonTarget.classList.add("d-none")
    this.nextButtonTarget.classList.remove("d-none")
  }

  nextQuestion() {
    this.answerConfirmationTarget.innerHTML = ""
    const template = this.questionTemplateTarget.innerHTML
    this.currentQuestion = this.questions[Math.floor(Math.random() * this.questions.length)]
    const output = Mustache.render(template, this.currentQuestion)
    this.questionContainerTarget.innerHTML = output
  }
}
