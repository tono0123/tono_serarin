require "./characters/hero"
require "./characters/monster"
require "./characters/monsters/slime"
require "./characters/monsters/chimera"
require "./characters/monsters/dragon"

class Game

  def initialize
    @hero = Hero.new
  	start
  end

  def start
    battle
    loop do
      if @hero.hit_point > 0
        puts "ゲームを続けますか？"
        puts "1:はい　2:いいえ"
        answer = gets.chomp.to_i
        if answer == 1
          battle
        else
          break
        end
      else
        # 勇者死んでるとき
        break
      end
    end

  end

  def battle
    @monster = [Slime, Chimera, Dragon].sample.new
    puts "#{@monster.name}があらわれた！"
    loop do
      puts "1:たたかう　2:にげる"

      cmd = gets.chomp.to_i
      if cmd == 1
        hero_attack = @hero.attack(@monster)
        @monster.hit_point -= hero_attack
        puts "勇者は#{@monster.name}に#{hero_attack}のダメージ！！"
        puts "#{@monster.name}HP：#{@monster.hit_point}"
        if @monster.hit_point <= 0
          puts "#{@monster.name}は倒れた。"
          experience_point = @monster.experience_point
          puts "経験値を#{experience_point}手に入れた！"
          @hero.add_experience_point(experience_point)
          break
        end

        monster_attack = @monster.attack(@hero)
        @hero.hit_point -= monster_attack
        puts "#{@monster.name}は勇者に#{monster_attack}のダメージ！！"
        puts "勇者HP：#{@hero.hit_point}"
        if @hero.hit_point <= 0
          puts "勇者は死んでしまった..."
          break
        end

      else cmd == 2
        break
      end
    end
  end
end

Game.new
