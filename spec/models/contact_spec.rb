require "rails_helper"

describe Contact do
  it { should belong_to :user}
  it { should have_and_belong_to_many :texts}
  it { should validate_presence_of :name}
  it { should validate_presence_of :number}
end
