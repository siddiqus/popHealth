class Entry 

  def initialize
    super
  end
  
  def usable?
    codes.present? || (start_time.present? || end_time.present? || time.present?)
  end
  
end
