require 'rails_helper'

RSpec.describe Movie, type: :model do
  context "relationships" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:ratings) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end
end
