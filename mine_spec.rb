require_relative 'mine'

input = [
  ['0', 'x', '0', 'x'],
  ['x', '0', '0', '0'],
  ['0', '0', '0', 'x'],
  ['0', 'x', '0', 'x'],
]

output = [
  ['2', 'x', '2', 'x'],
  ['x', '2', '3', '2'],
  ['2', '2', '3', 'x'],
  ['1', 'x', '3', 'x'],
]

RSpec.describe Mine do
  it 'calculates field' do
    expect(Mine.new(input).calculated).to eq(output)
  end
end
