feature 'Messages' do
  scenario 'User can send a message' do
    send_message
    expect(page).to have_content 'Hello, world'
  end
  
  scenario 'User can edit a message' do
    send_message
    click_link 'Hello, world'
    click_button 'Edit Message'
    fill_in :edit, with: "Something"
    click_button 'Submit'
    expect(page.current_path).to eq "/"
    expect(page).to have_content "Something"
  end
  
  scenario 'User can delete a message' do
    send_message
    click_link 'Hello, world'
    click_button 'Delete Message'
    expect(page.current_path).to eq "/"
    expect(page).not_to have_content 'Hello, world'
  end
end
