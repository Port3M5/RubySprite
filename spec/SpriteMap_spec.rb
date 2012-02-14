require 'SpriteMap'
require 'json'

describe SpriteMap do
  describe "Constructor" do
    it "Loads from JSON if the file exists" do
      expect { SpriteMap.new "./resources/spritemap.json"}.to_not raise_error
    end

    it "Takes raw JSON" do
      raw_json = '{"Map":[[[{"base":0,"object":1,"edges":{"N":1,"E":0,"S":0,"W":1}},{"base":0,"object":0,"edges":{"N":1,"E":1,"S":0,"W":0}}],[{"base":0,"object":0,"edges":{"N":0,"E":0,"S":1,"W":1}},{"base":0,"object":0,"edges":{"N":0,"E":1,"S":1,"W":0}}]]]}'
      expect { SpriteMap.new raw_json }.to_not raise_error
    end
  end
  
  describe "Get layer 0" do
    it "Should return an array of an array of Tiles" do
      sm = SpriteMap.new "./resources/spritemap.json"
      layer = sm.get_layer(0)
      layer.each do |y|
        y.each do |x|
          x.should be_a_kind_of Tile
        end
      end
    end
  end
end    
