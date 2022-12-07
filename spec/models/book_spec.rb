require "rails_helper"

RSpec.describe Book do
  it { should belong_to(:library) }

  describe "class methods" do
    it 'only_available' do
      #count and books#
    end
  end
end