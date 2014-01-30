srand Time.now.to_i
SIDE_W = 300
NUM_COLS = 50
NUM_ROWS = 8
ROW_PAD = 4
COL_W = SIDE_W/NUM_COLS.to_f
ROW_H = (SIDE_W - NUM_ROWS*ROW_PAD)/NUM_ROWS.to_f

def add_line_ends
  x1s = []
  x2s = []
  y1s = []
  (0..NUM_COLS).each do |idx|
    x1s << COL_W*idx + rand * COL_W
    x2s << COL_W*idx + rand * COL_W
    y1s << rand(5)
  end
  @x1s << x1s
  @x2s << x2s
  @y1s << y1s
end

def display_line row_idx, col_idx, y_offset
  push_style
  stroke 255
  x1s = @x1s[row_idx]
  x2s = @x2s[row_idx]
  y1s = @y1s[row_idx]

  line x1s[col_idx], y_offset + y1s[col_idx], x2s[col_idx], y_offset + ROW_H - y1s[col_idx]
  pop_style
end

def display_row row_idx, num_cols=NUM_COLS
  (0...num_cols).each do |col_idx|
    y_offset = row_idx*(ROW_H+ROW_PAD)
    y_offset += ROW_PAD if row_idx > 0
    y_offset += ROW_PAD/2.0 if row_idx == 0
    display_line row_idx, col_idx, y_offset
  end
end

def setup
  size SIDE_W, SIDE_W
  stroke 255

  @x1s = []
  @x2s = []
  @y1s = []
  NUM_ROWS.times { add_line_ends }
end

def draw
  background 0

  (0..6).each do |row_idx|
    display_row row_idx
  end
  display_row 7, 15
end