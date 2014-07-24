require_relative 'zellers_congruence'
require_relative 'year'

class Month

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  attr_accessor :month_array
  attr_accessor :day_count

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
    build_month_array
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    6.times do |i|
      output << print_week(i)
      output = output[0...-1]
      output << "\n"
    end
    output
  end

  def print_week(i)
    string = ""
    @month_array[i].length.times do |j|
      day = @month_array[i][j]

      if day == nil
        string << "   "
      elsif day <= 9
        string << " #{day} "
      else
        string << "#{day} "
      end

      if (i >= 5 && day == nil)
        string.rstrip!
        return string << " "
      end
    end
    string.rstrip!
    return string << " "
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

  def build_month_array
    @month_array = []
    @day_count = 0
    6.times do |i|
      build_week(i)
    end
    return @month_array
  end

  def build_week(i)
    if i == 0
      week = []
      day = ZellersCongruence.calculate(@month, @year.value)
      (day - 1).times do
        week << nil
      end
      (7 - (day - 1)).times do |j|
        week << (j + 1)
        @day_count += 1
      end
      @month_array << week
    else
      week = []
      7.times do |j|
        if @day_count < length
          @day_count += 1
          week << @day_count
        else
          (7 - week.length).times do |i|
            week << nil
          end
        end
      end
      @month_array << week
    end
  end

end
