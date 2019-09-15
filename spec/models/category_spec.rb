require 'rails_helper'

RSpec.describe Category, type: :model do
  context "relationships" do
    it { is_expected.to have_many(:movies) }
  end
end
