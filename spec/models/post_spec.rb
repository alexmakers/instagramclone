require 'spec_helper'

describe Post do
  it 'can be given comma-separated tags' do
    post = create(:post, tag_names: 'yolo, swag')
    expect(post.tags.count).to eq 2
  end

  it 'reuses tags if they already exist' do
    post = create(:post, tag_names: 'yolo, swag')
    second_post = create(:post, tag_names: 'yolo, tbt')

    expect(Tag.count).to eq 3
  end

  specify 'spaces between commas are optional' do
    post = create(:post, tag_names: 'yolo,swag')
    expect(post.tags.count).to eq 2
  end

  it 'formats the tag name to remove special chars, and make lowercase' do
    post = create(:post, tag_names: '#YoLo!')
    expect(post.tags.first.name).to eq 'yolo'
  end
end
