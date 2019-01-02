# frozen_string_literal: true

feature 'Messages' do
  scenario 'User can send a message' do
    send_message
    expect(page).to have_content 'Hello, world'
  end
end
