require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      email:  'test@test.com',
      password: 'password',
      password_confirmation:  'password',
      first_name: 'John',
      last_name:  'Doe'
    )
    expect(user).to be_valid
  end

  it 'is not valid without matching password and password_confirmation' do
    user = User.new(
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'differentpassword',
      first_name: 'John',
      last_name: 'Doe'
    )
    expect(user).not_to be_valid
  end

  it 'is not valid without a password' do
    user = User.new(
      email: 'test@test.com',
      password_confirmation: 'differentpassword',
      first_name: 'John',
      last_name: 'Doe'
    )
    expect(user).not_to be_valid
  end

  it 'is not valid without a password confirmation' do
    user = User.new(
      email: 'test@test.com',
      password: 'password',
      first_name: 'John',
      last_name: 'Doe'
    )
    expect(user).not_to be_valid
  end

  it 'is not valid with a non-unique email (case-insensitive)' do
    User.create(
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'John',
        last_name: 'Doe'
      )
    user = User.new(
      email: 'TEST@TEST.com',
      password: 'password',
      password_confirmation: 'differentpassword',
      first_name: 'John',
      last_name: 'Doe'
    )
    expect(user).not_to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(
      password: 'password',
      password_confirmation: 'differentpassword',
      first_name: 'John',
      last_name: 'Doe'
    )
    expect(user).not_to be_valid
  end

  it 'is not valid without a first name' do
    user = User.new(
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'differentpassword',
      last_name: 'Doe'
    )
    expect(user).not_to be_valid
  end

  it 'is not valid without a last name' do
    user = User.new(
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'differentpassword',
      first_name: 'John'
    )
    expect(user).not_to be_valid
  end
  
end
