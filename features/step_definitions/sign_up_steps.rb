module SignUpSh
  def register_new_user(email: )
    visit new_user_registration_path
    fill_in('user_email', with: email)
    fill_in('user_password', with: '0'*8)
    fill_in('user_password_confirmation', with: '0'*8)
    click_on('Register')
  end

  def email_should_be_in_header(email: )
    expect(page).to have_css('.navbar-text strong', text: email)
  end

end

World SignUpSh

When 'I register' do
  @new_ser_email = Faker::Internet.email
  register_new_user(email: @new_ser_email)
end

Then 'I should see my email in header' do
  email_should_be_in_header(email: @new_ser_email)
end
