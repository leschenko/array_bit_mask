require 'spec_helper'

class WithBitMask
  attr_accessor :colors_mask, :second_colors_mask

  include ArrayBitMask
  as_bit_mask :colors, :source => :subject_colors
  as_bit_mask :second_colors, :source => [:red, :green, :black, :white]

  def subject_colors
    [:red, :green, :black, :white]
  end
end

describe ArrayBitMask do
  subject { WithBitMask.new }

  it 'should add accessor methods' do
    should respond_to(:colors)
    should respond_to(:colors=)
  end

  it 'should store bit mask' do
    subject.colors = [:red, :white]
    subject.colors_mask.should eq(9)
  end

  it 'should restore array from bit mask' do
    subject.colors_mask = 6
    subject.colors.should =~ [:green, :black]
  end

  it 'should return empty array for zero mask' do
    subject.colors_mask = 0
    subject.colors.should =~ []
  end

  it 'should store array' do
    subject.colors = []
    subject.colors.should eq([])
  end

  it 'should return empty array for nil mask' do
    subject.colors_mask = nil
    subject.colors.should =~ []
  end

  context 'source as array' do
    it 'should store bit mask' do
      subject.second_colors = [:red, :white]
      subject.second_colors_mask.should eq(9)
    end

    it 'should restore array from bit mask' do
      subject.second_colors_mask = 6
      subject.second_colors.should =~ [:green, :black]
    end
  end

end