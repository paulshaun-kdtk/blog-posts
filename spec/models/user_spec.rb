 require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Charles', photo: 'https://google.photos.com', bio: 'Educator in Australia', posts_counter: 2) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'photo should be present' do
    subject.photo = nil
    expect(subject).not_to be_valid
  end

  it 'bio should be present' do
    subject.bio = nil
    expect(subject).not_to be_valid
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 'five'
    expect(subject).not_to be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    subject.posts_counter = -2
    expect(subject).not_to be_valid
  end
end
