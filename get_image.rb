load 'file_handler.rb'

class GetImage < FileHandler
  
  URL = URI('https://dog.ceo/api/breeds/image/random')

  def self.getUrlAddress(info)
    info["message"]
  end

  def self.save_image
    address = getUrlAddress(getData(URL))
    Dir.mkdir 'images' unless Dir.exist?('images') 
    Down.download(address, destination: 'images/.')
  end

end

GetImage.save_image

# Вопрос почему self.getUrlAddress(info) не работает без self