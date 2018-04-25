require 'csv'

class Composition < ApplicationRecord
  has_many :asins
  accepts_nested_attributes_for :asins

  def generate
    CSV.generate do |csv|
      csv << headers
      byu_out_info.each do |row|
        csv << row
      end
      csv << []
      date_rows.each do |date_row|
        csv << date_row
      end
    end
  end

  def headers
    titles = []
    titles << self.title
    titles.first.prepend("\xEF\xBB\xBF") #Byte Order Mark
    titles
  end

  def byu_out_info
    rows = []
    rows << ["ASIN Товара", "B0786ZJ818", "URL"]
    rows << ["График", schedule, "URL"]
    rows << ["Сумма", "$758,95", "URL"]
    rows
  end

  def date_rows
    rows = []
    rows << ["ПН", "Дата выкупа", "Номер заказа", "Стоимость"]
    date = start_date
    scheduled = schedule.split('-').map(&:to_i)
    i = 0
    order_number = 1
    while date <= end_date
      if scheduled[i]
        for j in 1..scheduled[i] do
          rows << [order_number, date.strftime("%d.%m.%Y")]
          order_number += 1
        end
      end
      date = date + 1.day
      i += 1
    end
    rows
  end
end


