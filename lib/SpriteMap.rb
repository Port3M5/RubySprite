class SpriteMap
  attr_accessor :map, :layers, :rows, :columns
  
  def initialize json = nil
    
    @layers, @rows, @columns = 0, 0, 0
    
    if json
      load_map json
    end
  end
  
  def load_map(json)
    require 'json'
    
    # Load JSON from file if a file path is given
    # Otherwise assume Raw JSON is given
    if File.exists? json
      json = File.read json
    end

    @map = JSON.parse(json)["Map"]
    
    @map.each_with_index do |z, zi|
      @layers = zi
      z.each_with_index do |y, yi|
        @rows = yi
        y.each_with_index do |x, xi|
          @columns = xi unless xi < @columns
          require 'Tile'
          @map[zi][yi][xi] = Tile.new x
        end
      end
    end
  end
  
  def get_layer(z)
    @map[z]
  end
  
  def get_row(z, y)
    layer = get_layer(z)
    layer[y]
  end
  
  def get_column(z, y, x)
    row = get_row(z, y)
    row[x]
  end
  
  def get_tile(z, y, x)
    tile = get_column(z, y, x)
  end
  
  def get_xy_dimensions(x, y, basewidth, baseheight)
    w = basewidth
    h = baseheight

    xpos = 0
    ypos = 0

    xpos = (x * (w / 2)) - (y * (w / 2))
    ypos = (y * (h / 2)) + (x * (h / 2))
    puts "[#{x},#{y}] = #{xpos}, #{ypos}"
    return {:x => xpos, :y => ypos}
  end
  
  def to_json
    to_h.to_json
  end
  
  def to_s
    require 'ap'
    ap @map
  end
  
  def to_h
    map = {:Map => []}
    (0..@layers).each do |z|
      map[:Map][z] = []
      (0..@rows).each do |y|
        map[:Map][z][y] = []
        (0..@columns).each do |x|
          map[:Map][z][y][x] = get_tile(z, y, x).to_h
        end
      end
    end
    map
  end
end
