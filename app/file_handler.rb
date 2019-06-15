require 'json'
require 'pry'
require 'net/http'
require 'colorize'
require 'colorized_string'
require './app/file_handler_module.rb'

class FileHandler
  URL = URI('https://raw.githubusercontent.com/Daniiar/My-JSON-Server/master/10_users.json')
  extend FileHandlerModule
  def self.call
    info = getData(URL)
    info = filterKeys(info)
    memoizate(info)
    write(info)
    puts "From url address...".light_yellow.on_magenta
    puts "#{@response}".light_yellow.on_blue
  end
end

FileHandler.call
FileHandler.read('output.json')