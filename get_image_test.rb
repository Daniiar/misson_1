require 'minitest/autorun'
require 'pry'
require_relative 'get_image'

class GetImageTest < Minitest::Test

  def test_checking_url_address
    assert Net::HTTP.get_response(GetImage::URL).code == "200"
  end

  def test_getUrlAddress
    hash_from_url = GetImage.getData(GetImage::URL)
    
    assert_kind_of Hash, hash_from_url
    assert_kind_of String, GetImage.getUrlAddress(hash_from_url)
  end

  def test_save_image
    GetImage.save_image
    file_names = Dir["images/*"]
    assert File.exist? file_names[0]
  end
  
end