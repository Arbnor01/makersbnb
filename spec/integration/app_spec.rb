require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'json'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # Write your integration tests below.
  # If you want to split your integration tests
  # accross multiple RSpec files (for example, have
  # one test suite for each set of related features),
  # you can duplicate this test file to create a new one.


  context 'GET /' do
    it 'should get the homepage' do
      response = get('/')

      expect(response.status).to eq(200)
    end
  end

  context 'GET /register' do
    it 'should allow you to register' do
      response = get('/register')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Registration Form</h1>')
    end
  end

  context 'POST /register' do
    it 'should save user details to log in again' do
      response = post('/register', name: 'bob', email: '@yahoo', phone_num: '00', password: '123' )

      expect(response.status).to eq(200)
      expect(response.body).to include("User registration successful!")

      reponse = post('/register').to include('bob')
    end
  end
end
