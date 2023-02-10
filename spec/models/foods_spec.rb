require 'rails_helper'

RSpec.describe Food, type: :model do
  @user = User.create(name: 'Rick Ash', email: 'rcick@mail.com', password: 'password',
                      password_confirmation: 'password')

  subject do
    Food.new(user: @user, name: 'Pizza', measurement_unit: 'ounce', price: 100.00, quantity: 3)
  end

  before { subject.save }

  describe 'validations' do
    it 'should not have name present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not have price present' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'should have price present' do
      expect(subject.price).to eql(100.00)
    end

    it 'should not have quantity present' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'should have quantity as an integer' do
      subject.quantity = '23'
      expect(subject).to_not be_valid
    end
  end
end
