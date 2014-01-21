require 'spec_helper'

describe 'creating a new post' do

  before do
    login
  end

  it 'is created from a form, providing Title and Content' do

    visit '/posts/new'
    fill_in 'Title', with: 'Hello world'
    fill_in 'Content', with: 'Hello from our Capybara test'
    fill_in 'Tags', with: 'yolo, swag'
    click_button 'Create Post'

    expect(page).to have_content 'Hello world'
    expect(page).to have_content 'Hello from our Capybara test'
    expect(page).to have_content '#yolo #swag'
    expect(current_path).to eq '/posts'
    
  end
end