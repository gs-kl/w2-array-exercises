def get_coordinates inputletter 
  coordinates = []
  data.each_with_index do |row, x_coord|
    row.each_with_index do |item, y_coord|
      coordinates << [x_coord, y_coord] if item == inputletter
    end
  end
  coordinates
end 

=begin
Version shown to Kane, originally in 04_tic_tac_toe_spec.rb
She had several comments:
- Move to library instead of repeating function in both relevant tests
- Name in accordance with Ruby convention, using snake case instead of mashing words together
- "For" is unpopular in Ruby and suggests unfamiliarity with the language; use an iterator instead
- Use the shovel operator (`<<`) instead of `.push`, `.push` exists in Ruby because they were trying to make Ruby arrays act like C stacks

def getcoordinates inputletter 
  coordinates = []
  for rownumber in 0..2
    data[rownumber].each_with_index do |a, i|
      coordinates.push([rownumber, i]) if a == inputletter
    end
  end
  coordinates
end
=end
