int halfWidth = 43;
float halfHeight = 72.5;
//PVector vectorResult;
//PVector[] coordlist = new PVector[29];

class Airplane {
  PShape s;
  float x, y, deg;
  
  PVector vectorResult, currentVector;
  
  PVector[] coordlist = new PVector[164];
  float[] speedlist = new float[164];
  float[] erroranglelist = new float[164];
  float[] aspectanglelist = new float[164];
  float[] distancelist = new float[164];
  int[] missile_status_list = new int[164];
  Parameters[] flight_parameter_list = new Parameters[164];

  
  PVector[] vectorlist = new PVector[164];
  float[] headinglist = new float[164];
  float[] rollingAverage = new float[11];
  
      
  PVector[] plane_to_pip_list = new PVector[164];
  float[] plane_to_pip_headinglist = new float[164];
 
  int listindex = 11; 
  int samplesShown = 0;
  float planeX,planeY,planeSpeed,planeErrAng,planeDist;
  float currentRotation = 270.0;
  
  
  Airplane(float x, float y,int r, int g, int b, int transp) {
  s = createShape();
  s.beginShape();
  s.fill(r,g,b,transp);
  s.stroke(1);
  s.strokeWeight(2);
  s.scale(0.3*zoom_scale);
  s.translate(x, y);
  s.rotate(radians(currentRotation));

  int[][] vertexArray = { 
    {46,0},{51,15},{78,21},{81,15},{86,15},{86,45},{81,40},
    {56,69},{66,67},{66,75},{50,97},
  
    //cockpitwindow START
    {45,111},{43,113},{41,111},{36,97},{36,89},{37,78},{39,70},
    {43,65},{47,70},{49,78},{50,89},{50,97},
    //cockpitwindow END

   //top (front), middle
    {46,135},{43,145},{40,135},{36,97},{20,75},{20,67},{30,69},
    {5,40},{0,45},{0,15},{5,15},{8,21},{35,15},{40,0},
  };
  
  for (int i=vertexArray.length-1; i>0; i--) 
  {
    s.vertex(vertexArray[i][0]-halfWidth,vertexArray[i][1]-halfHeight);
  }
   
  s.endShape(CLOSE);
 
  }
  
   void display() {
     //shape(s);
     if (this == pip) {
       displayPip(0,204,102);
     }
     else if (this == pip_ghost){
       displayPip(150,150,150);
     }
     else {
       shape(s);
     }
   }
   
   void update() {
       //currentVector = vectorlist[listindex-1];
       currentVector = new PVector((coordlist[listindex].x-coordlist[listindex-1].x),(coordlist[listindex].y-coordlist[listindex-1].y));
     
       if (samplesShown < framesBetweenSamples){ // TODO Lägga till villkor. typ "and not currently using playback slider". så den skippar denna biten.
          planeX += currentVector.x/framesBetweenSamples;
          planeY += currentVector.y/framesBetweenSamples;
          samplesShown += 1;
        }
  
      else {
        samplesShown = 0;
        if (listindex < coordlist.length-11){
          listindex += 1;
          planeX = coordlist[listindex-1].x;
          planeY = coordlist[listindex-1].y;
          planeSpeed = speedlist[listindex-1];
          planeErrAng = erroranglelist[listindex-1];
          planeDist = distancelist[listindex-1];
        }
        
        else {
          listindex = 11;
          missileLaunched = false;
          planeX = coordlist[10].x;
          planeY = coordlist[10].y;
          default_missile_launch_index = missile_launch_index;
        }
      }
   }

   
   void createHeadingList() {
    //orginal headinglist skapas. 
    for (int i = 0; i < vectorlist.length; i++) {
      //print(vectorlist[i].heading());
      if (vectorlist[i].heading() < 0  && this == rplane) { //TODO edit
        headinglist[i] = (vectorlist[i].heading()+ 2*PI);
      }
      else {
      headinglist[i] = vectorlist[i].heading();
      }
    }
    
    //Rolling average-filter går genom headinglist och ändrar den.   
    for (int heading_i=listindex-1; heading_i < headinglist.length; heading_i++) { //heading_i är 10
       int rolling_i = -5;
       float headings = 0.0;
       
       if (heading_i > headinglist.length-6) {
         rolling_i = -11;
       }
       for (int x = 0; x < listindex; x++) {
         headings += headinglist[heading_i+rolling_i];
         rolling_i += 1;
       }
       headinglist[heading_i] = (headings/listindex);    
    }    
    
   }
    //error_angle beräknas och läggs till i erroranglelist.
    void createErrAnglist() {
    for (int i = 0; i < headinglist.length; i++) {      
      float min_angle = Math.abs(plane_to_pip_headinglist[i]-headinglist[i])%(2*PI);
      if(min_angle>PI){
        min_angle = (2*PI-min_angle);
      }
      erroranglelist[i] = degrees(min_angle);
    }
   }
   //aspect_angle beräknas och läggs till i aspectanglelist.
   void createAspAnglist() {
     for (int i = 0; i < headinglist.length; i++) {      
      float min_angle = Math.abs(rplane.headinglist[i]-headinglist[i])%(2*PI);
      if(min_angle>PI){
        min_angle = (2*PI-min_angle);
      }
      aspectanglelist[i] = degrees(min_angle);
    }
   }
    
   void createParameterList() {
     for (int i = 0; i < headinglist.length; i++) {
       float spd = speedlist[i];;
       float alt = coordlist[i].z*105;
       float dist = distancelist[i]*45;
       float errAng = erroranglelist[i];
       //float aspAng = degrees(PVector.angleBetween(bplane.vectorlist[i], rplane.vectorlist[i]));
       float aspAng = aspectanglelist[i];
       
       Parameters flight_param = new Parameters(spd, alt, dist, errAng, aspAng);
       flight_parameter_list[i] = flight_param;
     }
   }
 
   void setStartConditions() {
     planeX=coordlist[listindex-1].x;
     planeY=coordlist[listindex-1].y; 
     planeSpeed=speedlist[listindex-1];
     planeErrAng=erroranglelist[listindex-1];
     planeDist=distancelist[listindex-1];
   }
   
   void setRotate(float deg) {
     //s.translate((width/2),(height/2));
     s.rotate(radians(deg));
   }
   
   void setRotateRad(float rad) {
      s.rotate(rad);
   }
   
   void setColor(int r, int g, int b) {
      s.fill(r, g, b);
   }
}