require_relative 'zellers_congruence'
require_relative 'year'

class Month

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  attr_accessor :big_string
  attr_accessor :big_string_array

  def initialize(month, year)
    @month = month
    @year = Year.new(year)
  end

  def name
    MONTHS[@month]
  end

  def header
    "#{name} #{@year.value}".center(20).rstrip
  end

  def to_s
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    output << grid
    output
  end

  def length
    days = 30 + ((@month + (@month / 8).floor) % 2)

    if (@month == 2) && !@year.leap_year?
      days = days - 2
    elsif (@month == 2) && @year.leap_year?
      days = days - 1
    end

    return days
  end

  def build_big_string
    build_initial_spaces
    add_days
    return @big_string
  end

  def add_days
    length.times do |i|
      if i == self.length - 1
        @big_string << "#{i + 1}"
      elsif i <= 8
        @big_string << "#{i + 1}  "
      else
        @big_string << "#{i + 1} "
      end
    end
  end

  def remove_spaces_for_new_lines
    @big_string.length.times do |i|

      unless i == 0
        if i % 20 == 0
          puts "XXXXXXXXXX"
          @big_string.slice!(i)
        end
      end

    end

    @big_string
  end

  def build_initial_spaces
    @big_string = ""

    day = ZellersCongruence.calculate(@month, @year.value)
    spaces = (3 * day) - 2

    spaces.times do
      @big_string << " "
    end
  end

  def break_big_string_into_array
    @big_string_array = []
    6.times do |i|
      @big_string_array << @big_string.slice((20 * i),20)
    end
    return @big_string_array
  end



  def grid
    day = ZellersCongruence.calculate(@month, @year.value)
    # spaces = (3 * day) - 2

    case day
    when 1
      string = " "
    when 2
      string = "    "
    when 3
      string = "       "
    when 4
      string = "          "
    when 5
      string = "             "
    when 6
      string = "                "
    when 7
      string = "                   "
    end



    line = string.length

    length.times do |i|
      if i < 8
        string << "#{i + 1}  "
      elsif i >=8
        string << "#{i + 1} "
      end

      line = line + 3

      if line > 20 && i < 8
        string = string[0...-2]
        string << "\n "
        line = 0
      elsif line > 20 && i > 8
        string = string[0...-1]
        string << "\n"
        line = 0
      elsif line > 20 && i == 8
        string = string[0...-1]
        string << "\n"
        line = 0
      end
    end

    if string.lines.count >= 5
      string = string[0...-1]
      string << "\n"
    elsif string.lines.count < 5
      string = string[0...-1]
      string << "\n"
    else
      return string
    end

    return string
  end

end
