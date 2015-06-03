require 'rails_helper'

RSpec.describe "the signing process", :type => feature do
	before :each do
		User.create(:email => 'user@example.com', :password => 'password')
	end

	it "Signs me in and creates new restaurant & new dish, signs out & checks if 
		record are successfully added" do
		visit '/users/sign_in'

		fill_in 'user[email]', with: 'user@example.com'
		fill_in 'user[password]', with: 'password'
		click_button 'Log in'

		click_link 'New Restaurant'

		fill_in 'restaurant[name]', with: 'PizzaHut'
		fill_in 'restaurant[address]', with: 'ul. Pileckiego 104'
		click_button 'Create Restaurant'

		fill_in 'pizza[name]', with: 'Extravaganza'
		fill_in 'pizza[price]', with: '100$'
		fill_in 'pizza[description]', with: 'Some ingredients'
		click_button 'Create Pizza'

		expect(page).to have_text('PizzaHut')
		expect(page).to have_text('ul. Pileckiego 104')
		expect(page).to have_text('Extravaganza')
		expect(page).to have_text('100$')
		expect(page).to have_text('Some ingredients')

		click_link 'PizzaNetwork'

		click_link 'Log Out'
		expect(page).to have_text('PizzaHut')
		#save_and_open_page
	end	

end