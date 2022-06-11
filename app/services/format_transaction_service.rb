class FormatTransactionService
  def initialize(file)
    @file = file
    @types_transactions = TypeTransaction.all
  end

  def call
    result = []
    text = File.read(@file.path)
    list_of_char = text.split('')

    current_char_index = 0
    number_lines = list_of_char.count / 81
    number_lines.times do
      hash_of_type_char = {
        type: list_of_char[current_char_index + 0],
        date: list_of_char[current_char_index + 1..current_char_index + 8],
        value: list_of_char[current_char_index + 9..current_char_index + 18],
        cpf: list_of_char[current_char_index + 19..current_char_index + 29],
        card: list_of_char[current_char_index + 30..current_char_index + 41],
        hour: list_of_char[current_char_index + 42..current_char_index + 47],
        store_manager: list_of_char[current_char_index + 48..current_char_index + 61],
        store_name: list_of_char[current_char_index + 62..current_char_index + 80]
      }

      result <<
        {
          type_transaction: @types_transactions.select { |item| item.type_code == hash_of_type_char[:type].to_i }[0],
          date: format_date(hash_of_type_char[:date]),
          value: hash_of_type_char[:value] * '',
          cpf: hash_of_type_char[:cpf] * '',
          card: hash_of_type_char[:card] * '',
          hour: format_hour(hash_of_type_char[:hour]),
          store_manager: hash_of_type_char[:store_manager] * '',
          store_name: hash_of_type_char[:store_name] * ''
        }

      current_char_index += 81
    end

    puts result

    Transaction.create!(result)
  end

  def format_date(date)
    str_date = ''
    index = 0
    date.each do |char|
      str_date += '-' if index == 4
      str_date += '-' if index == 6
      index += 1
      str_date += char
    end

    str_date
  end

  def format_hour(hour)
    str_hour = ''
    index = 0
    hour.each do |char|
      str_hour += ':' if index == 2
      str_hour += ':' if index == 4
      index += 1
      str_hour += char
    end

    str_hour
  end
end
