
feature 'Messages' do
  scenario 'User can send a message' do
    send_message
    expect(page).to have_content "Hello, world"
  end

  scenario 'Has a fun gif of a bouncy ball' do
    visit '/'
    expect(page).to have_xpath("//img[@src='https://media.giphy.com/media/LpALgGQNZLzdm/giphy.gif']")
  end

  scenario 'Shows history of all messages sent this session' do
    send_message
    fill_in :content, with: "Hello, again!"
    click_button 'Send'
    expect(page).to have_content "Hello, world"
    expect(page).to have_content "Hello, again!"
  end

  scenario 'Shows time of all messages sent this session' do
    send_message
    expect(page).to have_content Time.new.strftime('%d-%m-%Y %H:%M:%S')
  end

  scenario 'Expect messages to be no more than 20 chars' do
    visit '/'
    fill_in :content, with: "Purposefully reallyy long message"
    click_button 'Send'
    expect(page).to have_content "Purposefully reallyy"
    expect(page).not_to have_content "Purposefully really long message"
  end

  scenario 'Expect messages to be clickable' do
    visit '/'
    fill_in :content, with: "Purposefully quitely long message"
    click_button 'Send'
    click_link 'Purposefully quitely'
    expect(page).to have_content 'Purposefully quitely long message'
  end
end
