class BattleBot
 
 attr_reader :name, :health, :enemies
  def initialize(name)
    raise "NoMethodError" unless name
    @name = name
    @health = 100
    @enemies = []
    @weapon = nil
  end

  def dead?
    health == 0
  end

  def has_weapon?
   !weapon.nil?
  end

  def pick_up(new_weapon)
    raise ArgumentError unless new_weapon.is_a?(Weapon)
    raise ArgumentError if new_weapon.picked_up?
    new_weapon.picked_up == true
    if @weapon.nil?
      return
    else
      @weapon = new_weapon
      new_weapon.bot = self
      new_weapon
    end
  end

  def drop_weapon
    @weapon.bot = nil
    @weapon = nil
  end

  def take_damage(amount)
    # raise ArgumentError unless amount.is_a?(Fixnum)
    @health -= damage
    @health == 0 if @health < 0
    @health

  end

end