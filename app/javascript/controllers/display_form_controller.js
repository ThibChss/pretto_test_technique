import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-form"
export default class extends Controller {
  static targets = ['buttonHome', 'formDiv']

  connect() {
    console.log('Connected');
  }

  display_form(event) {
    event.preventDefault()
    this.buttonHomeTarget.classList.add('d-none')
    this.formDivTarget.classList.remove('d-none')
  }
}
