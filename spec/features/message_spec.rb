require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5039463641')
    expect(message.save).to eq false
  end
end

describe Message, :vcr => true do
  it 'adds an error if the to number is invalid' do
    message = Message.new(:body => 'hi', :to => '111111', :from => '9713402668')
    message.save
    expect(message.errors.messages[:base]).to eq ["The 'To' number 111111 is not a valid phone number."]
  end
end
