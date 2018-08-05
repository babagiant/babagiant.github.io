int num_cell = 8;
int count_tgt = 120;
void setup()
{
  noFill();
  size(1280, 800);
  smooth();
  frameRate(60);
  background(255);
  strokeWeight(2);
  cells = new ArrayList();
  for(int i = 0; i < num_cell; i++) {
    cells[i] = new CCell();
  }
}

void draw()
{
  //background(255, 1);
  fill(0,128);
  for(int i = 0; i < num_cell; i++){
    cells[i].advance();
  }
}

class CCell {
  int m_sx;
  int m_sy;
  int m_ex;
  int m_ey;
  int m_radius;
  int m_col;
  int m_count;
  int m_count_tgt;

  CCell()
  {
    setNext();
  }

  void setNext()
  {
    m_radius = 10 + random(15);
    m_sx = m_radius + random(width - (m_radius*2)) + 64;
    m_sy = height + m_radius / 2;
    m_col = color(125 + random(75), 125 + random(75), 125 + random(75));
    m_radius = 14 + random(20);
    m_ex = m_radius + random(width - (m_radius * 2)) + 64;
    m_ey = m_radius / 2 * -1;
    m_col = color(32 + random(192), 32 + random(192), 32 + random(192));
    m_count = 0;
    m_count_tgt = count_tgt + random(30);
  }
  void advance()
  {    
    fill(m_col);
    stroke(192);
    int x = m_sx + (m_ex - m_sx) / m_count_tgt * m_count;
    int y = m_sy + (m_ey - m_sy) / m_count_tgt * m_count;
    ellipse(x, y, m_radius, m_radius);
    m_ex += random(18.0) - 9.0;
    if(++m_count > m_count_tgt) {
      setNext();
    }
  }
}

// end of file.

