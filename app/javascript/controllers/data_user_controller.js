import { Controller } from "@hotwired/stimulus"
import { Chart } from 'chart.js/auto';

Chart.defaults.font.family = "Outfit"
Chart.defaults.font.size = 16;
Chart.defaults.color = '#262E35';

// Connects to data-controller="data-user"
export default class extends Controller {
  static targets = ["chart"]
  static values = {
    seance: Object
  }

  connect() {
    new Chart(this.chartTarget, {
      type: 'bar',
      data: {
        labels: this.seanceValue.x,
        datasets: [{
          label: "Nombre de séances par jour",
          data: this.seanceValue.y,
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }
}
