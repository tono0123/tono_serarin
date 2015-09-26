module Dqx
  class Slime
    include Virtus.model

    attribute :name, String
    attribute :attack_power, Integer
    attribute :defence_power, Integer
    attribute :hit_point, Integer
    attribute :experience_point, Integer

    #def Initialize
    #  self.name = "スライム"
    #  self.attack_power = 5
    #  self.defence_power = 3
    #  self.hit_point = 3
    #  self.experience_point = 1
    #end

    def attack(hero)
      puts name + "の攻撃"
      base_damage = (attack_power * 2 - hero.defence_power) / 2
      if base_damage <= 0
        damage = rand(2) + 1
      elsif base_damage < attack_power / 2 + 1
        damage = (2 + (attack_power / 2 + 1) * rand(256) / 256) / 3
      else
        damage = (base_damage + (base_damage + 1) * rand(256) / 256) / 2
      end
      puts "  " + damage.to_s.concat("のダメージ！")
      hero.defence(damage)
    end

    def defence(damage)
      self.hit_point -= damage
    end
  end
end
