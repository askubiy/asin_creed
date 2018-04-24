require 'csv'

class Composition < ApplicationRecord
  has_many :asins
  accepts_nested_attributes_for :asins

  def generate
    CSV.generate do |csv|
      csv << headers
      date_rows.each do |date_row|
        csv << date_row
      end
    end
  end

  def headers
    titles = []
    titles << "Date"
    titles << "Another"
    titles.first.prepend("\xEF\xBB\xBF") #Byte Order Mark
    titles
  end

  def date_rows
    rows = []
    date = start_date
    while date <= end_date
      rows << [(date).to_s]
      date = date + 1.day
    end
    rows
  end
end


