require_relative 'zellers_congruence'

class Year

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

  def to_s
    output = year_header
    
  end

end
