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
      const serializeSeanceDate = char.dataset.chartDataSeanceDateValue
      const serializeExerciceName = char.dataset.chartDataTrainingExerciceNameValue
      console.log(serializeExerciceName)
      const data = JSON.parse(serializedData)
      const labels = JSON.parse(serializeSeanceDate)


      const gradient = char.getContext('2d').createLinearGradient(0, 0, 0, char.height);
      gradient.addColorStop(0, '#D0B3E1');  // You can replace this color as well if needed
      gradient.addColorStop(1, 'rgba(183, 195, 243, 00.00)');

        const data2 = {
          labels: labels,
          datasets: [{
            label: serializeExerciceName,
            data: data.data,
            borderColor: '#D0B3E1',
            backgroundColor: gradient,
            borderWidth: true,
            fill: true,
            tension: 0.5
          }]
        };

        const stackedLine = new Chart(char, {
          type: 'line',
          data: data2,
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
                    text: data.label,
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




    });
  }
  inject(event) {
    const divToInject = event.currentTarget.parentElement;
    // Stocker la div dans localStorage
    localStorage.setItem('divToInject', divToInject.outerHTML);
  }
}
