class Mine
  attr_accessor :field

  def initialize(field)
    @field = field
  end

  def calculated
    output = []
    (0..field.size-1).each do |row|
      output[row] = (0..field.size-1).map { |col| calculate_cell(row, col) }
    end
    output
  end

  private

  def cell_value(row, col)
    return 0 unless (0..(field[0].size-1)).cover?(row)
    return 0 unless (0..(field.size-1)).cover?(col)

    field[row][col] == 'x' ? 1 : 0
  end

  def cell_moore_sum(row, col)
    ((row - 1)..(row + 1)).inject(0) do |sum, row|
      sum + moore_in_row(row, col)
    end
  end

  def moore_in_row(row, col)
    ((col - 1)..(col + 1)).inject(0) do |sum, col|
      sum + cell_value(row, col)
    end
  end

  def calculate_cell(row, col)
    field[row][col] == 'x' ? 'x' : cell_moore_sum(row, col).to_s
  end
end
