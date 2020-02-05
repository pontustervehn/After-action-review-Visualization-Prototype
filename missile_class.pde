int multiplier = 10;

class Missile extends Airplane {
  PShape m;
 
  Missile(float x, float y,int r, int g, int b) {
    super(0,0,0,0,0,0);
     
    m = createShape();
    m.beginShape();
    m.fill(r,g,b);
    m.scale(0.06*zoom_scale);
    m.translate(x, y);
    m.rotate(radians(currentRotation));
    
    
    double[][] vertexArray = { 
      {0,-17},{3,-17},{3,-13},{1,-12},{1,-10},{2,9},{2,10},
      {1,12},{1,15},{1,16.5},{0.3,17},{0,17},{-0.3,17},
      {-1,16.5},{-1,15},{-1,12},{-2,10},{-2,9},{-1,10},
      {-1,-12},{-3,-13},{-3,-17}
    };
    
    for (int i=vertexArray.length-1; i>0; i--) 
    {
      m.vertex((int)vertexArray[i][0]*multiplier,(int)vertexArray[i][1]*multiplier);
    }
    
    m.endShape(CLOSE); 
}

void display() {
  //stroke(color(0,100,102));
  //rect(0, 0, 10, 10);
  shape(m);
}

}