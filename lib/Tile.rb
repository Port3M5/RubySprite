class Tile
  attr_accessor :base, :object, :edges
  
  def initialize tile
    @base = tile['base']
    @object = tile['object']
    @edges = tile['edges']
  end
  
  def to_h
    return {:base => @base, :object => @object, :edges => @edges}
  end
  
  def to_s
    "Base: #{@base}, Object: #{@object}, Edges: #{@edges}"
  end
end