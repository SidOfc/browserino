$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'coveralls'
Coveralls.wear!

require 'browserino'

module Library
  def self.data
    @data ||= begin
      paths = Dir[File.expand_path('files/*.yml', File.dirname(__FILE__))]
      paths.each_with_object({}) do |path, data|
        subject = path.split('/').last.split('.').first
        data[subject] = YAML.load_file(path)[subject]
      end
    end
  end
end
