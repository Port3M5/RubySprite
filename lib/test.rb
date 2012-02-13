require './SpriteMap.rb'

sm = SpriteMap.new 'spritemap.json'
puts sm

ary = [[1,2],[1,2]]

def xy ary
  w = 32
  h = w / 2
  
  xpos = 0
  ypos = 0
  
  ary.each_with_index do |y, yi|
    y.each_with_index do |x, xi|
      xpos = (xi * (w / 2)) - (yi * (w / 2))
      ypos = (yi * (h / 2)) + (xi * (h / 2))
      puts "#{xi},#{yi} = #{xpos}, #{ypos}"
    end
  end
end

xy ary