require 'spec_helper'

describe ScriptureVerse do 
  describe '#initialize' do 
    it 'raises an error if either of the arugments cannot be converted to an integer' do
      lambda { ScriptureVerse.new(:a1, 1, 4) }.should raise_error(ArgumentError)
      lambda { ScriptureVerse.new(3, :asdf, 4) }.should raise_error(ArgumentError)
      lambda { ScriptureVerse.new(3, 2, nil) }.should raise_error(ArgumentError)
    end

    it 'raises an error if the book number is not within 1-66' do
      lambda { ScriptureVerse.new(67, 34, 12) }.should raise_error(RuntimeError)
      lambda { ScriptureVerse.new(0, 34, 12) }.should raise_error(RuntimeError)
    end

    it 'raises an error when the chapter does not exist' do 
      lambda { ScriptureVerse.new(19, 151, 1) }.should raise_error(RuntimeError)
    end

    it 'raises an error when the verse does not exist' do 
      lambda { ScriptureVerse.new(19, 119, 500 ) }.should raise_error(RuntimeError)
    end

    it 'does not raise an error when the verse exists' do
      lambda { ScriptureVerse.new(32, 2, 2) }.should_not raise_error
    end
  end
end
