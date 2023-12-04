import { Controller } from "@hotwired/stimulus"
import { Chart } from 'chart.js/auto';

// Connects to data-controller="chart-data"
export default class extends Controller {
  static targets = ["chart"]

  connect() {
    const labels = ["December"];

    this.chartTargets.forEach(char => {
      const serializedData = char.dataset.chartDataTrainingExerciceMetricsValue
      const data = JSON.parse(serializedData)
      new Chart(char, {
        type: 'line',
        data: {
          labels: labels,
          datasets: [{
            label: char.dataset.chartDataTrainingExerciceNameValue,
            data: data.map((metric) => metric.y),
            fill: false,
            borderColor: 'rgb(75, 192, 192)',
            tension: 0.1
          }]
        },
      });
    });
  }
}
