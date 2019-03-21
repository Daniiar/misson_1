require 'json'
require 'pry'
require 'net/http'
require 'colorize'
require 'colorized_string'

class FileHandler
  
  Url = URI('https://raw.githubusercontent.com/Daniiar/My-JSON-Server/master/10_users.json')

  def self.read(file)
    puts "\nFile reading...".light_yellow.on_magenta
    puts "#{File.readlines(file)}".light_yellow.on_blue
  end

  def self.write(data)
    data = JSON.pretty_generate(data)
    file = File.new('output.json', 'w')
    file.syswrite(data)
  end

  def self.memoizate(object)
    @response ||= object
  end

  def self.getData(url)
    info = Net::HTTP.get(url)
    JSON.parse(info)
  end

  def self.filterKeys(hash)
    white_list = {}
    white_list.store("id", hash["id"])
    white_list.store("name", hash["name"])
    white_list.store("username", hash["username"])
    white_list.store("phone", hash["phone"])
    white_list.store("website", hash["website"])
    return white_list
  end

  def self.call
    info = getData(Url)
    info = filterKeys(info)
    write(info)
    puts "From url address...".light_yellow.on_magenta
    print "#{memoizate(info)}".light_yellow.on_blue
  end

end

FileHandler.call
FileHandler.read('output.json')

# Написать класс, в котором есть следующие методы:

# + Чтение из JSON файла, парсинг json. Возвращает объект ruby

# + Запись в файл, принимает Hash, сериализирует полученные данные и записывает в локальный файл перезаписывая существующий файл и создав новый.

# + Метод в котором присваивается значение переменной экземпляра @response используя мемоизацию и вовзращает значение переменной экземпляра @response

# + Метод который получает данные с удаленного адреса(Url должен быть прописан в константе), парсит JSON в ruby
#   url = 'https://api.apis.guru/v2/metrics.json'

# + Метод получает Hash, фильтрует по определенным ключам и передает на запись в файл. Должен содержать белый список ключей,
#   по этому белому списку нужно отфильтровать пары ключ-значение из полученного в аргументах Hash

# + Метод call:
#   1 Вызвать метод, который получит json из удаленного сервера
#   2 Вызов метода фильтрации
#   3 Вызов метода записи в файл.
#   4 Вызов метода записи в переменную @response
#   5 Вывести на экран содержимое переменной @response, сравнить c содержимым файла.

# Все методы должны быть написаны как методы класса(self методы)

# Написать тесты

# Задача № 2

# Создать другой класс который будет иметь все те же методы, но отпраляет запрос на нижеуказанный адрес,
# в полученном json берет ссылку и по ссылке скачивает файл в определенную папку.
# random_dog_url = 'https://dog.ceo/api/breeds/image/random'
