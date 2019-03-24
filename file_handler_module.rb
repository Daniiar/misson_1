module FileHandlerModule
  def read(file)
    puts "\nFile reading...".light_yellow.on_magenta
    puts "#{File.readlines(file)}".light_yellow.on_blue
  end

  def write(data)
    data = JSON.pretty_generate(data)
    file = File.new('output.json', 'w')
    file.syswrite(data)
  end

  def memoizate(object)
    @response ||= object
  end

  def getData(url)
    info = Net::HTTP.get(url)
    JSON.parse(info)
  end

  def filterKeys(hash)
    white_list = {
      "id": hash["id"],
      "name": hash["name"],
      "username": hash["username"],
      "phone": hash["phone"],
      "website": hash["website"]
    }
  end
end