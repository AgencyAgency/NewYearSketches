srand Time.now.to_i
SIDE_W = 300
NUM_COLS = 36
COL_W = SIDE_W/NUM_COLS.to_f

def display_line idx 
  push_style
  if mouse_x > idx*COL_W && mouse_x < (idx+1)*COL_W
    stroke 255,0,0
  else
    mouse_dist = abs(mouse_x - (idx*COL_W + COL_W/2.0))
    gray = map mouse_dist, 0, width/2.0, 255, 0
    stroke gray
  end
  line @x1s[idx], @y1s[idx], @x2s[idx], height
  pop_style
end

def setup
  size SIDE_W, SIDE_W
  stroke 255

  @x1s = []
  @x2s = []
  @y1s = []

  (0..NUM_COLS).each do |idx|
    @x1s << COL_W*idx + rand * COL_W
    @x2s << COL_W*idx + rand * COL_W
    @y1s << 20 + rand(30)
  end
end

def draw
  background 0

  (0...NUM_COLS).each do |idx|
    display_line idx
  end
end