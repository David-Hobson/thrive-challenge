require 'json'

# Class used to facilitate importing and associating it a model
class Importer
  def import(file_name, model)
    file_contents = File.read(file_name)
    json_file_contents = JSON.parse(file_contents)

    json_file_contents.map { |content| model.new(content) }
  rescue Errno::ENOENT
    puts "The following file was not found: #{file_name}"
    exit
  rescue JSON::ParserError
    puts "The following file was unable to be parsed: #{file_name}"
    puts 'Please make sure that your file is valid JSON'
    exit
  end
end
