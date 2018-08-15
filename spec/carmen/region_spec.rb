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

  describe "localization" do
    before do
      Carmen.i18n_backend.locale = :de
      @de = Carmen::Country.coded('de')
    end

    it "has a german translation" do
      expect(@de.region).to eq("Europa")
    end
  end
end
