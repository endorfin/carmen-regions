require 'carmen'
require "carmen/regions/version"

module Carmen
  locale_path = File.expand_path("../../../locale", __FILE__)
  i18n_backend.append_locale_path(locale_path)

  class Country
    def region
      Carmen.i18n_backend.translate(path('region'))
    end

    def sub_region
      Carmen.i18n_backend.translate(path('sub_region'))
    end
  end

  module Regions
  end
end
