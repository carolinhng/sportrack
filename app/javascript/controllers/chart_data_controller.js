import { Controller } from "@hotwired/stimulus"
import { Chart } from 'chart.js/auto';

Chart.defaults.font.family = "Outfit"
Chart.defaults.font.size = 14;
Chart.defaults.color = '#262E35';


// Connects to data-controller="chart-data"
export default class extends Controller {
  static targets = ["chart"]

  connect() {

    this.chartTargets.forEach(char => {
      const serializedData = char.dataset.chartDataTrainingExerciceMetricsValue
      const data = JSON.parse(serializedData)
      const labels = data.map((metric) => metric.x)
      const dataset = data.map((metric) => metric.y)
      dataset.unshift("0")

      const gradient = char.getContext('2d').createLinearGradient(0, 0, 0, char.height);
      gradient.addColorStop(0, '#D0B3E1');
      gradient.addColorStop(1, 'rgba(208, 179, 225, 0.00)');

      new Chart(char, {
        type: 'line',
        data: {
          labels: labels,
          datasets: [{
            label: char.dataset.chartDataTrainingExerciceNameValue,
            data: dataset,
            backgroundColor : gradient,
            borderColor: 'rgba(13, 19, 33, 1)',
            borderWidth: true,
            fill: true,
            tension: .5
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
              text: char.dataset.chartDataTrainingExerciceNameValue,
            }
        },
          scales: {
              y: {
                beginAtZero: true,
                title: {
                  display: true,
                  text: 'X-Axis Label'
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

          },
      }
      });
    });
  }
  inject(event) {
    // this.containerTarget.innerHTML = event.currentTarget.parentElement
    // console.log(this.containerTarget)
    // const dataToStore = { key: event.currentTarget.parentElement };
    // sessionStorage.setItem('maCle', JSON.stringify(dataToStore));
    const divToInject = event.currentTarget.parentElement;
    // Stocker la div dans localStorage
    localStorage.setItem('divToInject', divToInject.outerHTML);
  }
}
