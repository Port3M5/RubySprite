class SpriteSheet
  attr_accessor :sprite, :width, :height, :basewidth, :baseheight
  
  def initialize path, width, height, basewidth, baseheight
    @sprite = path #TODO: This should be the loaded spritesheet
    @width = width
    @height = height
    @basewidth = basewidth
    @baseheight = baseheight
  end
  
end
