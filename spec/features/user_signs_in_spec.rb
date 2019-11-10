require 'rails_helper'

feature 'user signs in' do

  scenario 'with valid email and password' do
    sign_in

    expect(page).to have_content('Logout')
  end

end
