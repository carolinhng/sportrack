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
          borderWidth: 1,
          borderColor: 'rgb(183, 195, 243)',
          backgroundColor: 'rgb(183, 195, 243)',
        }]
      },
      options: {
        plugins: {
          legend: {
            display: false,
          },
          subtitle: {
            margin: 1,
            display: true,
          }
        },
        scales: {
          y: {
            title: {
              display: false,
            },
            ticks: {
              font: {
                size: 10,
              }
            },
            grid: {
              color: 'rgba(245, 245, 246, 1)'
            }
          },
          x: {
            grid: {
              display: false,
            },

            ticks: {
              font: {
                size: 10,
              }
            }
          },
        }
      }
    });
  }
}
