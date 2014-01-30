NUM_COLS = 10
NUM_ROWS = 10
SIDE_W = 300

def reset_grid
  grays = []
  grid_corners = []
  (0...NUM_COLS).each do |col_idx|
    dx = col_idx*@grid_w
    (0...NUM_ROWS).each do |row_idx|
      dy = row_idx*@grid_h
      grid_corners << [dx, dy]
      grays << rand(255)
    end
  end

  target_grays = []
  grays.each do |g|
    target_grays << ((g < 127.5) ? 0 : 255)
  end

  @grid_corners = grid_corners
  @grays = grays
  @target_grays = target_grays
end

def key_pressed
  reset_grid
end

def setup
  size SIDE_W, SIDE_W
  @grid_w = width / NUM_COLS.to_f
  @grid_h = height / NUM_ROWS.to_f

  no_stroke
  reset_grid
end

def draw
  @grid_corners.each_with_index do |corner, idx|
    gray = @grays[idx]
    @grays[idx] = lerp gray, @target_grays[idx], 0.005

    push_style
    fill gray
    rect *corner, @grid_w, @grid_h
    pop_style
  end
end