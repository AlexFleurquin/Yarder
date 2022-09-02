import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets=["form1", "form2", "form3", "form4", "form5"]

  nextPage2() {
    this.form1Target.classList.add("d-none")
    this.form2Target.classList.remove("d-none")
  }
  nextPage3() {
    this.form2Target.classList.add("d-none")
    this.form3Target.classList.remove("d-none")
  }
  nextPage4() {
    this.form3Target.classList.add("d-none")
    this.form4Target.classList.remove("d-none")
  }
  nextPage5() {
    this.form4Target.classList.add("d-none")
    this.form5Target.classList.remove("d-none")
  }

  previousPage1() {
    this.form1Target.classList.remove("d-none")
    this.form2Target.classList.add("d-none")
  }
  previousPage2() {
    this.form2Target.classList.remove("d-none")
    this.form3Target.classList.add("d-none")
  }
  previousPage3() {
    this.form3Target.classList.remove("d-none")
    this.form4Target.classList.add("d-none")
  }
  previousPage4() {
    this.form4Target.classList.remove("d-none")
    this.form5Target.classList.add("d-none")
  }
}
