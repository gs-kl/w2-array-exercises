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
      xs_per_row = [data[0].count("X"), data[1].count("X"), data[2].count("X")]
      expect(xs_per_row).to be == [1, 2, 1]
    end

    it "returns how many times O was played in each row" do
      os_per_row = [data[0].count("O"), data[1].count("O"), data[2].count("O")]
      expect(os_per_row).to be == [2, 1, 2]
    end
  end

  describe "getting coordinates of usage" do
    it "returns an array of [row, column] array coordinates for each usage of X" do
      
      def getcoordinates inputletter 
        coordinates = []
        for rownumber in 0..2
          data[rownumber].each_with_index do |a, i|
            if a == inputletter
              coordinates.push([rownumber, i])
            end
          end
        end
        coordinates
      end

      x_coordinates = getcoordinates "X"

     expect(x_coordinates).to be == [[0, 0], [1, 0], [1, 1], [2, 1]]
    end

    it "returns an array of [row, column] array coordinates for each usage of O" do
      def getcoordinates inputletter 
        coordinates = []
        for rownumber in 0..2
          data[rownumber].each_with_index do |a, i|
            if a == inputletter
              coordinates.push([rownumber, i])
            end
          end
        end
        coordinates
      end

      o_coordinates = getcoordinates "O"

     expect(o_coordinates).to be == [[0, 1], [0, 2], [1, 2], [2, 0], [2, 2]]
    end
  end

  describe "testing who won" do
    it "determines whether X or O won" do

      def whowon
        @x_wins = false
        @o_wins = false
        winner = "none"

        def check linestocheck
          @x_wins = true if linestocheck.include?("XXX")
          @o_wins = true if linestocheck.include?("OOO")
        end

        rows = data[0].join + " " +  data[1].join + " " + data[2].join
        check rows

        columns = data.transpose[0].join + " " +  data.transpose[1].join + " " + data.transpose[2].join 
        check columns

        diagonals = data[0][0] + data[1][1] + data[2][2] + " " + data[0][2] + data[1][1] + data[2][0]
        check diagonals

        if @x_wins && !@o_wins
          winner = "X"
        elsif @o_wins && !@x_wins
          winner = "O"
        elsif @x_wins && @o_wins
          winner = "both"
        end

        winner
      end

      winner = whowon

      expect(winner).to be == 'O'
    end
  end
end
