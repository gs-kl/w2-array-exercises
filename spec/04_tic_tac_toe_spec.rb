require 'spec_helper'

describe "Tic Tac Toe, in arrays" do
  let(:___) { nil }

  let(:data) {
    [
      ['X', 'O', 'O'],
      ['X', 'X', 'O'],
      ['O', 'X', 'O']
    ]
  }

  before do
  end

  describe "counting usage per row" do
    it "returns how many times X was played in each row" do
      xs_per_row = [data[0].select {|a| a == "X"}.length, data[1].select {|a| a == "X"}.length, data[2].select {|a| a == "X"}.length]
      expect(xs_per_row).to be == [1, 2, 1]
    end

    it "returns how many times O was played in each row" do
      os_per_row = [data[0].select {|a| a == "O"}.length, data[1].select {|a| a == "O"}.length, data[2].select {|a| a == "O"}.length]
      expect(os_per_row).to be == [2, 1, 2]
    end
  end

  describe "getting coordinates of usage" do
    it "returns an array of [row, column] array coordinates for each usage of X" do
      x_coordinates = []
			getcoordinates = Proc.new do |letter, rownumber|
				data[rownumber].each_with_index do |a, i|
					if a == letter 
						x_coordinates.push([rownumber, i])
					end
				end
			end
			getcoordinates.call "X", 0
			getcoordinates.call "X", 1
			getcoordinates.call "X", 2
     expect(x_coordinates).to be == [[0, 0], [1, 0], [1, 1], [2, 1]]
    end

    it "returns an array of [row, column] array coordinates for each usage of O" do
      x_coordinates = []
			getcoordinates = Proc.new do |letter, rownumber|
				data[rownumber].each_with_index do |a, i|
					if a == letter 
						x_coordinates.push([rownumber, i])
					end
				end
			end
			getcoordinates.call "O", 0
			getcoordinates.call "O", 1
			getcoordinates.call "O", 2
      expect(x_coordinates).to be == [[0, 1], [0, 2], [1, 2], [2, 0], [2, 2]]
    end
  end

  describe "testing who won" do
    it "determines whether X or O won" do
			# Getting ready
			winner = "none"
			checkforwinner = Proc.new do |a|
				if a.include?("XXX")
					winner = "X"
				elsif a.include?("OOO")
					winner = "O"
				end
			end
			# Check horizontals
			horizontals = data[0].to_s.gsub(/[^OX]/, "") + " " +  data[1].to_s.gsub(/[^OX]/, "") + " " + thirdrow = data[2].to_s.gsub(/[^OX]/, "")
			checkforwinner.call horizontals
			# Check verticals
			transposedarray = data.transpose
			verticals = transposedarray[0].to_s.gsub(/[^OX]/, "") + " " +  transposedarray[1].to_s.gsub(/[^OX]/, "") + " " + thirdrow = transposedarray[2].to_s.gsub(/[^OX]/, "")
			checkforwinner.call verticals	
			# Check diagonals
			diagonals = data[0][0] + data[1][1] + data[2][2] + " " + data[0][2] + data[1][1] + data[2][0]
			checkforwinner.call diagonals
      expect(winner).to be == 'O'
    end
  end
end
