require 'spec_helper'

describe Carmen::Country do
  describe "basic attributes" do
    before do
      @us = Carmen::Country.coded('us')
    end

    it "has a region" do
      expect(@us.region).to eq("Americas")
    end

    it "has a region" do
      expect(@us.sub_region).to eq("Northern America")
    end
  end
end
