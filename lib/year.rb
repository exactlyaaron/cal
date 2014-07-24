require_relative 'zellers_congruence'
require_relative 'month'

class Year

  attr_accessor :year_array
  attr_accessor :month_count

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def initialize(num)
    @num = num
  end

  def value
    @num
  end

  def leap_year?
    if (@num % 4 == 0) && (@num % 100 != 0) || (@num % 400 == 0)
      return true
    end
    return false
  end

  def year_header
    "#{@num}".center(64).rstrip
  end

  def name(i)
    MONTHS[@month_count]
  end

  def month_header(i, j)
    string = "#{name(i)}".center(20)
    if j < 2
      string << "  "
    elsif j == 2
      string.rstrip! << "\n"
    end
    string
  end

  def print_weekdays(k)
    string = ""
    if k < 2
      string << "Su Mo Tu We Th Fr Sa"
      string << "  "
    elsif k == 2
      string << "Su Mo Tu We Th Fr Sa"
      string << "\n"
    end
    string
  end

  def print_week(iteration, row_count, line)

    month_num = iteration * row_count
    string = ""

    if row_count == 2 && iteration == 0
      month_num = 3
    elsif row_count == 2 && iteration == 1
      month_num = 4
    elsif row_count == 2 && iteration == 2
      month_num = 5
    elsif row_count == 3 && iteration == 0
      month_num = 6
    elsif row_count == 3 && iteration == 1
      month_num = 7
    elsif row_count == 3 && iteration == 2
      month_num = 8
    elsif row_count == 4 && iteration == 0
      month_num = 9
    elsif row_count == 4 && iteration == 1
      month_num = 10
    elsif row_count == 4 && iteration == 2
      month_num = 11
    end

    week = @year_array[month_num][line]
    week.each do |day|
      if day == nil
        string << "   "
      elsif day <= 9
        string << " #{day} "
      else
        string << "#{day} "
      end

      if (line >= 5 && day == nil)
        return string.rstrip!
      end
    end

    string = string[0...-1]
    string << "  "

    if iteration == 2
      string.rstrip! << "\n"
    end

    # if iteration == 2 && row_count == 4 && line > 5
    #   string = string[0...-1]
    # end
    return string
  end

  def to_s
    @month_count = 0
    row_count = 0
    build_year_array

    output = year_header
    output << "\n\n"
    4.times do |i|
      row_count += 1
      3.times do |j|
        @month_count += 1
        output << month_header(@month_count, j)
      end
      3.times do |k|
        output << print_weekdays(k)
      end
      6.times do |line|
        3.times do |month|
          output << print_week(month, row_count, line)
        end
      end
      output << "\n"
    end
    output
  end

  def build_year_array
    @year_array = []
    12.times do |i|
      @year_array << Month.new(i+1, @num).build_month_array
    end
    @year_array
  end

end
