require 'pry'
require 'json'

class Treatment
  def self.read(file)
    string = ''
    data = File.readlines(file)
    
    data.each do |elem|
      elem = elem.strip
      string = string + elem
    end
    
    new_hash = JSON.parse(string)
    puts new_hash
  end

  def self.write(data)
    data = JSON.pretty_generate(data)
    file = File.new('output.json', 'w')
    file.syswrite(data)
  end
end

Treatment.read("incoming_file.json")
animal_names = {lion: 'John', cat: 'Pusik', dog: 'Tom'}
Treatment.write(animal_names)

# Написать класс, в котором есть следующие методы:
# - Чтение из JSON файла, парсинг json. Возвращает объект ruby
# - Запись в файл, принимает Hash, сериализирует полученные данные и записывает в локальный файл перезаписывая существующий файл и создав новый.

# - Метод в котором присваивается значение переменной экземпляра @response используя мемоизацию
# - Метод который вовзращает значение переменной экземпляра @response
# - Метод который получает данные с удаленного адреса(Url должен быть прописан в константе), парсит JSON в ruby
#   url = 'https://api.apis.guru/v2/metrics.json'
# - Метод получает Hash, фильтрует по определенным ключам и передает на запись в файл. Должен содержать белый список ключей,
#   по этому белому списку нужно отфильтровать пары ключ-значение из полученного в аргументах Hash
# - Метод call:
#   1 Вызвать метод, который получит json из удаленного сервера
#   2 Вызов метода фильтрации
#   3 Вызов метода записи в файл.
#   4 Вызов метода записи в переменную @response
#   5 Вывести на экран содержимое переменной @response, сравнить в содержимым файла.

# Все методы должны быть написаны как методы класса(self методы)



# Задача № 2

# Создать другой класс который будет иметь все те же методы, но отпраляет запрос на нижеуказанный адрес,
# в полученном json берет ссылку и по ссылке скачивает файл в определенную папку.
# random_dog_url = 'https://dog.ceo/api/breeds/image/random'
