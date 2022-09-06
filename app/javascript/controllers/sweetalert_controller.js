import { Controller } from "@hotwired/stimulus";
import swal from 'sweetalert';

// Connects to data-controller="sweetalert"
export default class extends Controller {
  static values = { path: String, redirection: String }

  connect() {
    console.log(this.redirectionValue)
    this.csrf = document.querySelector("[name='csrf-token']").content

    this.options = {
      method: "DELETE",
      headers: { "Accept": "application/json", "X-CSRF-TOKEN": this.csrf },
    }
  }

  open(event) {
    event.stopPropagation();
    event.preventDefault();

    swal({
      title: "Etes vous sur ?",
      text: "Cette action est définitive",
      icon: "warning",
      button: "Supprimer",
      dangerMode: true
      }).then((value) => {
      if (value) {
        swal("La pièce a bien été supprimée !", {
          icon: "success",
        });

        fetch(this.pathValue, this.options)
            .then(response => response.json())
            .then((data) => {
              document.getElementById(data.dom_id).remove()
            })
      }
    });
  }

  projectDelete(event) {
    event.stopPropagation();
    event.preventDefault();

    swal({
      title: "Etes vous sur ?",
      text: "Cette action est définitive",
      icon: "warning",
      button: "Supprimer",
      dangerMode: true
      }).then((value) => {
      if (value) {
        swal("Le projet a bien été supprimé !", {
          icon: "success",
        });

        fetch(this.pathValue, this.options)
            .then(response => response.json())
            .then((data) => {
              setTimeout(() => {
                window.location.pathname = "/dashboard"
              }, 2500);
            })
      }
    });
  }


  roomDelete(event) {
    event.stopPropagation();
    event.preventDefault();

    swal({
      title: "Etes vous sur ?",
      text: "Cette action est définitive",
      icon: "warning",
      button: "Supprimer",
      dangerMode: true
      }).then((value) => {
      if (value) {
        swal("La pièce a bien été supprimée !", {
          icon: "success",
        });

        fetch(this.pathValue, this.options)
            .then(response => response.json())
            .then((data) => {
              setTimeout(() => {
                window.location.pathname = `/${this.redirectionValue}`
              }, 2500);
            })
      }
    });
  }
}
