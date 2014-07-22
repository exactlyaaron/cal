class ZellersCongruence

  # DAYS = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

  def self.calculate(month, year, day=1)

    if month < 3
      month = month + 12
      year = year - 1
    end

    result = (1 + (((month + 1) * 26) / 10).floor + year + (year/4).floor + (6*(year/100).floor) + (year/400).floor) % 7
    # return DAYS[result]
    if result == 0
      return 7
    else
      return result
    end
  end

end
