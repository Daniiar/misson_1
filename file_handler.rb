require 'json'
require 'pry'
require 'net/http'
require 'colorize'
require 'colorized_string'
require 'down'
require './file_handler_module.rb'

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

# Написать класс, в котором есть следующие методы:
# + Чтение из JSON файла, парсинг json. Возвращает объект ruby
# + Запись в файл, принимает Hash, сериализирует полученные данные и 
#   записывает в локальный файл перезаписывая существующий файл и создав новый.
# + Метод в котором присваивается значение переменной экземпляра @response используя 
#   мемоизацию и вовзращает значение переменной экземпляра @response
# + Метод который получает данные с удаленного 
#   адреса(Url должен быть прописан в константе), парсит JSON в ruby
#   url = 'https://api.apis.guru/v2/metrics.json'
# + Метод получает Hash, фильтрует по определенным ключам и передает на запись в файл.
#   Должен содержать белый список ключей, по этому белому списку нужно отфильтровать пары
#   ключ-значение из полученного в аргументах Hash
# + Метод call:
#   1 Вызвать метод, который получит json из удаленного сервера
#   2 Вызов метода фильтрации
#   3 Вызов метода записи в файл.
#   4 Вызов метода записи в переменную @response
#   5 Вывести на экран содержимое переменной @response, сравнить c содержимым файла.

# Все методы должны быть написаны как методы класса(self методы)
# обернуть всё в модуль(убрать "self" с методов)

# + Написать тесты

# Задача № 2

# Создать другой класс который будет иметь все те же методы, 
# но отпраляет запрос на нижеуказанный адрес,
# в полученном json берет ссылку и по ссылке скачивает файл в определенную папку.
# random_dog_url = 'https://dog.ceo/api/breeds/image/random'
  