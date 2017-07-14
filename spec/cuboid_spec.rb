require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do
  let(:cuboid){Cuboid.new(width: 2, height: 2, length: 2)}

  describe 'initialize' do
    it 'raises error when missing initial args' do
      expect{Cuboid.new}.to raise_error(ArgumentError)
    end
    it 'raises error when improper origin is specified' do
      expect{Cuboid.new(origin: 'hello')}.to raise_error(ArgumentError)
    end
  end
  describe "move_to" do
    it "changes the origin in the simple happy case" do
      expect(cuboid.move_to!([1,2,3])).to be true
    end
  end

  describe "intersects?" do
    it 'returns false for non intersecting objects' do
      cuboid2 = Cuboid.new(width: 1, height: 1, length: 1, origin: [3,3,3])
      expect(cuboid.intersects?(cuboid2)).to eq false
    end
    it 'returns true for intersecting objects' do
      cuboid2 = Cuboid.new(width: 1, height: 1, length: 1, origin: [1,1,1])
      expect(cuboid.intersects?(cuboid2)).to eq true
    end
  end

  describe 'vertices' do
    it 'returns a collection of vertices' do
      expect(cuboid.vertices).to eq([
        [0,0,0],
        [2,0,0],
        [2,2,0],
        [2,0,2],
        [2,2,2],
        [0,2,2],
        [0,0,2],
        [0,2,0]
        ])
    end
  end

end
