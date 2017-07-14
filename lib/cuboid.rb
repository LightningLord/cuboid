
class Cuboid
  def initialize(options = {})
    origin = options[:origin] || [0,0,0]
    raise ArgumentError, "improper origin #{origin}. pass in an array of length 3" unless origin.is_a?(Array) && origin.length == 3
    @width = options[:width].to_i #x axis
    @height = options[:height].to_i #y axis
    @length = options[:length].to_i #z axis
    raise ArgumentError, "width, height, and length are all required!" unless @width > 0 && @height > 0 && @length > 0

    move_to!(origin)
  end

  #BEGIN public methods that should be your starting point

  def move_to!(coords)
    @origin = coords
    @origin_x, @origin_y, @origin_z = @origin

    @max_x = @origin_x + @width
    @max_y = @origin_y + @height
    @max_z = @origin_z + @length
    true
  end

  def vertices

    [
      [@origin_x, @origin_y, @origin_z], #origin
      [@max_x, @origin_y, @origin_z ],
      [@max_x, @max_y, @origin_z],
      [@max_x, @origin_y, @max_z],
      [@max_x, @max_y, @max_z],
      [@origin_x, @max_y, @max_z],
      [@origin_x, @origin_y, @max_z],
      [@origin_x, @max_y, @origin_z]
    ]
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
    other.vertices.each do |vertex|
      return true if interior?(vertex)
    end
    false
  end

  private
  #returns true if the point is within the cuboid
  def interior?(coords)
    x, y, z = coords
    x >= @origin_x && x <= @max_x &&
    y >= @origin_y && y <= @max_y &&
    z >= @origin_z && z <= @max_z
  end

end
