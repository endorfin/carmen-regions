require "bundler/gem_tasks"

namespace :regions do
  desc 'import regions'
  task :import do
    require File.expand_path("../script/import.rb", __FILE__)

    importer = WorldDataImporter.new
    importer.perform
    puts "done"
  end
end
