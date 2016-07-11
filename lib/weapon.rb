class Weapon
  attr_accessor :picked_up, :bot
  attr_reader :name, :damage
  def initialize(name, damage=nil)
    raise ArgumentError unless name.is_a?(String)
    # raise ArgumentError unless damage.is_a?(Fixnum)
    @name = name
    @damage = damage
    @bot = nil
    @picked_up = false
  end

  def bot=(bot)
    raise ArgumentError unless bot.is_a?BattleBot || bot.nil?
  end

  def picked_up?
    if @picked_up
      true
    else
      false
    end

  end

end