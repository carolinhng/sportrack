import { Controller } from "@hotwired/stimulus"
import { Chart } from 'chart.js/auto';

Chart.defaults.font.family = "Outfit"
Chart.defaults.font.size = 16;
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
      console.log(dataset)
      new Chart(char, {
        type: 'line',
        data: {
          labels: labels,
          datasets: [{
            label: char.dataset.chartDataTrainingExerciceNameValue,
            data: dataset,

            backgroundColor : 'rgba(38, 46, 53, .5)',
            borderColor: 'rgba(38, 46, 53, 1)',
            borderWidth: true,
            fill: true,
            tension: 0.1
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
    });
  }
}
