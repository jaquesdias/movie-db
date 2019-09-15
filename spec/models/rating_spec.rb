require 'rails_helper'

RSpec.describe Rating, type: :model do
  context "relationships" do
    it { is_expected.to belong_to(:movie) }
  end

  context "validations" do
    it { is_expected.to validate_numericality_of(:rating_value).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:rating_value).is_less_than_or_equal_to(5) }
  end
end
