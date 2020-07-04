require 'rails_helper'

RSpec.describe Buyer, type: :model do
  context 'validation tests' do
    it 'ensures email presence' do
      buyer = Buyer.new(name: 'Clinton', address: 'worldwide', password: 'foobar', password_confirmation: 'foobar').save

      expect(buyer).to eq(false)
    end

    it 'ensures name presence' do
      buyer = Buyer.new(email: 'clinton@gmail.com', address: 'worldwide', password: 'foobar', password_confirmation: 'foobar').save

      expect(buyer).to eq(false)
    end

    it 'ensures address presence' do
      buyer = Buyer.new(email: 'clinton@gmail.com', password: 'foobar', password_confirmation: 'foobar').save

      expect(buyer).to eq(false)
    end

    it 'should save successfully' do
      buyer = Buyer.new(name: 'Clinton', email: 'clinton@gmail.com', address: 'worldwide', password: 'foobar', password_confirmation: 'foobar').save

      expect(buyer).to eq(true)
    end

    it 'ensures balance default to zero on inintialization' do
      buyer = Buyer.new(name: 'Clinton', email: 'clinton@gmail.com', address: 'worldwide', password: 'foobar', password_confirmation: 'foobar')

      expect(buyer.balance).to eq(0)
    end

    it 'ensures balance is 50 on creation' do
      buyer = Buyer.create(name: 'Clinton', email: 'clinton@gmail.com', address: 'worldwide', password: 'foobar', password_confirmation: 'foobar')

      expect(buyer.balance).to eq(50)
    end
  end
end
