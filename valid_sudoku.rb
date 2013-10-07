def build_grid n, rows
  pocket = []
	grid = []

	rows.each_with_index do |e, i| 
		pocket << e
		if (i + 1) % n == 0
			grid << pocket 
			pocket = []
		end
	end

	grid
end

def check_rows? grid
	n = grid.size
	values = Array(1..n).map(&:to_s)

	grid.each do |row|
		return false if row.sort != values 
	end	

	return true
end

def check_columns? grid
	n = grid.size
	values = Array(1..n).map(&:to_s)

	grid.transpose.each do |column|
		return false if column.sort != values
	end

	return true
end

def check_subgrid? grid
	n = grid.size
	values = Array(1..n).map(&:to_s)

	case n
	when 4
		i = 0
		2.times do
			sub_grid1 = grid[i][0..1] << grid[i+1][0..1]
			sub_grid2 = grid[i][2..3] << grid[i+1][2..3]
			i = 2
			return false if sub_grid1.flatten.sort != values || sub_grid2.flatten.sort != values
		end
	else
		i = 0
		3.times do
			sub_grid1 = grid[i][0..2] << grid[i+1][0..2] << grid[i+2][0..2]
			sub_grid2 = grid[i][3..5] << grid[i+1][3..5] << grid[i+2][3..5]
			sub_grid3 = grid[i][6..8] << grid[i+1][6..8] << grid[i+2][6..8]
			return false if sub_grid1.flatten.sort != values || sub_grid2.flatten.sort != values || sub_grid3.flatten.sort != values
		end
	end

	return true
end

def valid_sudoku n, rows
	grid = build_grid(n, rows)

	return "False" unless check_rows? grid
	return "False" unless check_columns? grid
	return "False" unless check_subgrid? grid
	return "True"
end

File.open(ARGV[0]).each_line do |line|
	n, rows = line.strip.split(';')
	n = n.to_i
	rows = rows.split(",")
	puts valid_sudoku(n, rows)
end