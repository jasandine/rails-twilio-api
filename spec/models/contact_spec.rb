require 'rails_helper'

describe Contact do
  it { should belong_to :user }
  it { should have_many :messages }
end
