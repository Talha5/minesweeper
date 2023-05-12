# Minesweeper Board Generation

# Algorithm Approach
 - When the board is created, we are calling `BoardService` to generate the mines with input `mines_count`.
 - The service generates matrix for the given board (in-case some mines are already generated) and validates whether board can fill more mines or not, if not return the filled matrix.
 - Afterwards, We check if given count is greater than available cells, if yes, set count to max available cells
 - In mines generation we exclude available cells from matrix and fill available cells with mines according to `count` and return DB create-able array of hash for mines.
 - afterwards, we update current matrix with filled mines.

# Run server
 - Run `bin/rails s` to run the server

# Test cases:
 - Run `rspec` to run test cases.
