class Year < ActiveRecord::Base
  attr_accessible :build_season_start, :year_end, :year_start
  
  has_many :timelogs
  has_many :users, :through => :timelogs
  
  def is_current_year?
    if !Year.current_year.nil? && Year.current_year.id == self.id
      return true
    end
    return false
  end
  def self.current_year
    Year.where("year_start <= ? and year_end >= ?",Date.today,Date.today).first
  end
  def self.find_year(date)
    Year.where("year_start <= ? and year_end >= ?",date,date).first
  end
end