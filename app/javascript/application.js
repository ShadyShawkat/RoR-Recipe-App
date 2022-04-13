// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.getElementById("food_food_id").addEventListener('click', (e) => {
  if(e.target.value === 'Add new food') {
    document.getElementById("food-form-group").classList.add('d-block')
  } else {
    document.getElementById("food-form-group").classList.remove('d-block')
  }
})
