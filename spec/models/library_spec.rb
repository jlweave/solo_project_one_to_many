require "rails_helper"

RSpec.describe Library do
  it { should have_many(:books) }
end