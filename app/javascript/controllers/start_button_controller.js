import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="start-button"
export default class extends Controller {
  static targets = ["tips", "question"]

  connect() {
    console.log("Hello from stimulus");
  }


  display() {
    const deck_1 = {
      "questions": [
        {
          "content": "Quel est la somme de 1 et 1?",
          "answers": [
            {"id": 1, "content": "3", "right_answer": false},
            {"id": 2, "content": "1", "right_answer": false},
            {"id": 3, "content": "2", "right_answer": true},
            {"id": 4, "content": "4", "right_answer": false}
          ]
        },
        {
          "content": "Quel est la somme de 1 et 1?",
          "answers": [
            {"id": 1, "content": "3", "right_answer": false},
            {"id": 2, "content": "1", "right_answer": false},
            {"id": 3, "content": "2", "right_answer": true},
            {"id": 4, "content": "4", "right_answer": false}
          ]
        }
      ]
    }

    // Maybe we'll need the answers id? Or maybe their index? To be determ[0]

    this.tipsTarget.classList.add("d-none");
    this.questionTarget.classList.remove("d-none");

    fetch(questions, {
      method: "PATCH",
      headers: { "Accept": "text/plain" }
      })
      .then(response => response.JSON())
      .then((data) => {
        console.log(data)
      })
      data.questions.forEach((question) => {
        const output = Mustache.render(template, question);
      })
      .then((data) => {
        this.questionTarget.outerHTML = data
      })
  }
}

// 1.Hide the tips div and display questions div
// 2.Checkout mustache/template lecture -> Insert (innerText) in <h5>The content of the first question</h5>
// 3.Insert into the DOM the 4 answers
