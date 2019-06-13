require './app/file_handler.rb'

class GetImage < FileHandler
  
  URL = URI('https://dog.ceo/api/breeds/image/random')

  def self.getUrlAddress(info)
    info["message"]
  end

  def self.save_image
    FileUtils.rm_f Dir.glob("images/*")
    address = getUrlAddress(getData(URL))
    Dir.mkdir 'images' unless Dir.exist?('images')
    image_as_string_code = Net::HTTP.get(URI(address))
    dog_image = File.open('images/' + 'dog.jpeg', 'w+')
    dog_image.write(image_as_string_code)
    dog_image.close
  end

end

GetImage.save_image

# Вопрос почему self.getUrlAddress(info) не работает без self