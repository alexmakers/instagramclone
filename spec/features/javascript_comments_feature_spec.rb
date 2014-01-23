require 'spec_helper'

describe 'loading comments' do
  before do
    post = create(:post)
    create(:comment, post: post)
  end

  it 'should load comments with AJAX when I click show comments', js: true do
    visit '/posts'
    click_link 'Show comments'
    expect(page).to have_content 'My comment'
  end
end