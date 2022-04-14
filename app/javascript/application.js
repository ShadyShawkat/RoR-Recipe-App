// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
const foodFormGroup = document.getElementById("food-form-group");
document.getElementById("food_food_id").addEventListener('change', (e) => {
  if(e.target.value === 'Add new food') {
    foodFormGroup.classList.add('d-block')
    foodFormGroup.classList.remove('d-none')
  } else {
    foodFormGroup.classList.remove('d-block')
    foodFormGroup.classList.add('d-none')
  }
})
