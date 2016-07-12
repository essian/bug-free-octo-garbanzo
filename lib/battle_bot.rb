class BattleBot

  @@count = 0

  def self.count
    @@count
  end

  attr_reader :name, :health, :enemies, :weapon
  def initialize(name)
    raise "NoMethodError" unless name
    @name = name
    @health = 100
    @enemies = []
    @weapon = nil
    @@count += 1
  end

  def dead?
    if health == 0
      true
    else
      false
    end
  end

  def has_weapon?
    !weapon.nil?
  end

  def pick_up(new_weapon)
    raise ArgumentError unless new_weapon.is_a?(Weapon)
    raise ArgumentError if new_weapon.picked_up?
    new_weapon.picked_up == true
    if @weapon.nil?
      @weapon = new_weapon
      new_weapon.bot = self
      new_weapon.picked_up = true
      new_weapon
    else
      return nil
    end
  end

  def drop_weapon
    @weapon.bot = nil
    @weapon = nil

  end

  def take_damage(amount)
    raise ArgumentError unless amount.is_a?(Fixnum)
    @health -= amount
    if @health < 0
      @@count -= 1
      @health = 0

    end
    @health

  end


  def heal
    return if dead?
    @health += 10
    @health = 100 if @health > 100
    @health


  end

  def attack(enemy)
    raise ArgumentError unless enemy.is_a?(BattleBot)
    raise ArgumentError if enemy == self
    raise ArgumentError unless has_weapon?
    enemy.receive_attack_from(self)
  end

  def receive_attack_from(enemy)
    raise ArgumentError unless enemy.is_a?BattleBot
    raise ArgumentError if enemy == self
    raise ArgumentError if enemy.weapon.nil?
    @enemies << enemy unless @enemies.include?enemy
    self.take_damage(30)
    self.defend_against(enemy)

  end

  def defend_against(enemy)
    if !dead? && has_weapon?
      attack(enemy)
    end

  end
end
