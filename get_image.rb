load 'file_handler.rb'

class GetImage < FileHandler
  
  URL = URI('https://dog.ceo/api/breeds/image/random')

  def self.getUrlAddress(info)
    info["message"]
  end

  # info = getData(URL)
  
end

address = GetImage.getUrlAddress(GetImage.getData(GetImage::URL))



Dir.mkdir 'images' unless Dir.exist?('images') 
Down.download(address, destination: 'images/.')
  # binding.pry
  1+1