require 'minitest/autorun'
require 'pry'
require_relative 'file_handler'

class FileHandlerTest < Minitest::Test
  def test_checking_url_address
    assert Net::HTTP.get_response(FileHandler::URL).code == "200"
  end

  def test_getData
    assert_kind_of Hash, FileHandler.getData(FileHandler::URL)
  end

  def test_filterKeys
    info = FileHandler.getData(FileHandler::URL)
    info = FileHandler.filterKeys(info)
    assert info.key?(:id)
    assert info.key?(:name)
    assert info.key?(:username)
    assert info.key?(:phone)
    assert info.key?(:website)
    assert info.length == 5
  end

  def test_memoizate
    info = FileHandler.getData(FileHandler::URL)
    info = FileHandler.filterKeys(info)
    memoization = FileHandler.instance_variable_get(:@response)
    assert info == memoization
  end

  def test_write_call
    FileHandler.call
    data_from_file = JSON.parse(File.read('output.json'))
    data_from_memoization = FileHandler.instance_variable_get(:@response)
    data_from_memoization = data_from_memoization.inject({}){|memo, (k, v)| memo[k.to_s] = v; memo}
    assert data_from_file == data_from_memoization
  end
end