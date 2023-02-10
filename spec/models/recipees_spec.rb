require 'rails_helper'

RSpec.describe Food, type: :model do
  @user = User.create(name: 'Rick Ash', email: 'rcick@mail.com', password: 'password',
                      password_confirmation: 'password')

  subject do
    Recipee.new(user: @user, name: 'Recipe', preparation_time: '2 hours',
                cooking_time: '30 minutes', public: true, description: 'Description here')
  end

  before { subject.save }

  describe 'validations' do
    it 'should not have name present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not have public present' do
      expect(subject.public).to eql true
    end

    it 'should have description text' do
      expect(subject.description).to eql('Description here')
    end

    it 'should not have quantity present' do
      subject.cooking_time = nil
      expect(subject).to_not be_valid
    end
  end
end
