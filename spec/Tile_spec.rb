require 'Tile'

describe "Tile" do
  describe "initialize" do
    it "Should set the values" do
      edges = {"N" => 0, "E" => 0, "S" => 0, "W" => 0 }
      base = {"base" => 0, "object" => 0, "edges" => edges}
      t = Tile.new base
      t.base.should == 0
      t.object.should == 0
      t.edges.should have(4).items
    end
  end

  describe "to_h" do
    edges = {"N" => 0, "E" => 0, "S" => 0, "W" => 0 }
    base = {"base" => 0, "object" => 0, "edges" => edges}
   
    # to_h returns symbols instad of strings
    expected_edges = {:N => 0, :E => 0, :S => 0, :W => 0 }
    expected_base = {:base => 0, :object => 0, :edges => edges}
    t = Tile.new base
    t.to_h.should == expected_base
  end
end
