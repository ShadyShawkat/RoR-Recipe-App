require 'rails_helper'

RSpec.describe 'Food page', type: :feature do
  before :each do
    @user = User.new(name: 'Chris', email: 'chris@gmail.com', password: 'asdasd')
    @user.save
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'
    visit root_path
  end

  it 'should be able to see Foods' do
    expect(page).to have_content('Foods')
  end

  it 'should be able to redirect to add food route' do
    click_link 'New food'
    expect(page).to have_current_path(new_food_path)
  end

  it 'should be able to see save food' do
    click_link 'New food'
    fill_in 'Name', with: 'Cherries'
    fill_in 'Measurement unit', with: 'g'
    fill_in 'Price', with: '40'
    click_button 'Create'
    expect(page).to have_content('Cherries')
  end
end
