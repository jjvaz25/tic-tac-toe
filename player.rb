class Player
  attr_accessor :name
  attr_accessor :marker_symbol
  
  def initialize(name, marker_symbol)
    @name = name
    @marker_symbol = marker_symbol
  end

end