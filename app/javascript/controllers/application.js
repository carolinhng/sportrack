import { Application } from "@hotwired/stimulus"
import Chart from 'stimulus-chartjs'
import Sortable from 'stimulus-sortable'

const application = Application.start()
application.register('chart', Chart)
application.register('sortable', Sortable)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
