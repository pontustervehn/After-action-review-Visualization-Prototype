class Alert extends Airplane {
  PShape a;
 
  Alert(float x, float y,int r, int g, int b, boolean fill, boolean stroke) {
    super(0,0,0,0,0,0);
     
    a = createShape();
    a.beginShape();
    a.fill(r,g,b);
    a.stroke(r,g,b);
    a.strokeWeight(2);
    a.scale(0.15*zoom_scale);
    a.translate(x, y);
    a.rotate(radians(180));
    
    if (fill == false) {
      a.noFill();
    }
    else {
    a.fill(r,g,b);
    }
    
    if (stroke == false) {
      a.noStroke();
    }
    else {
      a.stroke(r,g,b);
      a.strokeWeight(2);
    }
    
    int[][] vertexArray = { 
      {3,-54},{5,-50},{18,-50},{18,-40},{10,-33},{10,-18},
      {25,-18},{10,3},{10,25},{9,32},{8,38},{7,43},{6,48},
      {4,52},{3,53},{1,54},{0,54},{-1,54},{-3,53},{-4,52},
      {-6,48},{-7,43},{-8,38},{-9,32},{-10,25},{-10,3},
      {-25,-18},{-10,-18},{-10,-33},{-18,-40},{-18,-50},
      {-5,-50},{-3,-54}
    };
    
    for (int i=vertexArray.length-1; i>0; i--) 
    {
      a.vertex(vertexArray[i][0],vertexArray[i][1]);
    }
    
    a.endShape(CLOSE); 
}

void display() {
  shape(a);
}

void update() {
  shape(a);
}

void setScale(float x) {
  a.scale(0.15*zoom_scale);
  a.scale(x);
}
}