require 'carmen'
require 'yaml'
require 'open-uri'
require 'tempfile'
require 'csv'

class LocalResource
  attr_reader :uri

  def initialize(uri)
    @uri = uri
  end

  def file
    @file ||= Tempfile.new(tmp_filename, tmp_folder, encoding: encoding).tap do |f|
      io.rewind
      f.write(io.read)
      f.close
    end
  end

  def io
    @io ||= open(uri)
  end

  def encoding
    io.rewind
    io.read.encoding
  end

  def tmp_filename
    [
      Pathname.new(uri.path).basename.to_s,
      Pathname.new(uri.path).extname
    ]
  end

  def tmp_folder
    File.expand_path('../../tmp', __FILE__)
  end
end


class ContinentsData
  def self.fetch(url)
    entries = {}
    local_resource = LocalResource.new(URI.parse(url))

    CSV.foreach(local_resource.file, headers: true) do |row|
      key = row['alpha-2'].downcase

      entries[key] = {
        'region' => row['region'],
        'sub-region' => row['sub-region'],
        'intermediate-region' => row['intermediate-region']
      }
    end

    entries
  end
end


class WorldDataImporter
  attr_accessor :data, :import_data

  def initialize
    @import_data = ContinentsData.fetch('https://raw.githubusercontent.com/lukes/ISO-3166-Countries-with-Regional-Codes/master/all/all.csv')
    @data = { 'en' => { 'world' => {} } }
  end

  def perform
    build_yaml_structure
    write
  end

  private

  def build_yaml_structure
    Carmen::Country.all.each do |entry|
      region = ''
      sub_region = ''
      code = entry.alpha_2_code.downcase
      country = import_data[code]

      unless country.nil?
        region = country['region']
        sub_region = country['intermediate-region'] === '' ? country['sub-region'] : country['intermediate-region']
      end

      @data['en']['world'][code] ||= {}
      @data['en']['world'][code]['region'] = region
      @data['en']['world'][code]['sub_region'] = sub_region
    end
  end

  def write
    path = File.expand_path("../../locale/en/world.yml", __FILE__)
    File.open(path, 'w+') { |f| f << @data.to_yaml }
  end
end
