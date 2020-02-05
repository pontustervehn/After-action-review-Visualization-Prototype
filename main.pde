import controlP5.*;
ControlP5 cp5;
PFont font_10,font_13,font_14;
boolean toggleValue = false;
boolean Primp = true;
boolean Flight_Parameters;
boolean Settings = false;
boolean Enable_Launch_slider = true;
boolean Play_Pause_Toggle = false;
boolean Reset_Bars_Toggle = false;
boolean Save_Limit_Values = false;
boolean Load_Limit_Values = false;
boolean Hide_Settings = false;
boolean Enable_Objects = true;
boolean Enable_Ghosts = false;
int playback_index;
int temp_speed;
int default_missile_launch_index = 44;

float launcherX_,launcherY_,launcherZ_,errAngX_,errAngY_,errAngZ_, targetX_, targetY_, targetZ_, pipX_, pipY_, pipZ_, missileX_, missileY_;
PVector launcherPos_,launcher_, targetPos_, target_, pipPos_, pip_, errAng_, missile_, missilePos_; 
PImage img_flyg,img_flyg2,hawkeye;
int percentageValue, speed_setting;
int framespeed = 12;

float framesBetweenSamples;
boolean missileLaunched = false;

float zoom_scale = 1.3;
int alert_duration = 25;

int current_index;

Airplane bplane,rplane,pip,bplane_ghost,rplane_ghost,pip_ghost;
Missile missile;
Alert launch_alert,launch_alert_fill,graph_alert, graph_alert_ghost;

void setup() {
  size(1490,620, P2D); //1500, 575
  hawkeye = loadImage("hawkeye_window.png");
  setupCP5();
  font_10 = createFont("Lucida", 10);
  font_13 = createFont("Lucida", 13);
  font_14 = createFont("Lucida", 14);
  
  //airplane(xpos,ypos,r,g,b, fill, stroke)
  bplane = new Airplane(0,0,0,0,255,255);
  rplane = new Airplane(0,0,255,0,0,255);
  pip = new Airplane(0,0,0,0,0,255);
  missile = new Missile(0,0,255,255,255);
  launch_alert = new Alert(0,0,240,240,240,false,true);
  launch_alert_fill = new Alert(0,0,210,210,210,true,false);
  launch_alert_fill.a.scale(1/(0.15*zoom_scale)); //återställer launch_alert_fill till orginalstorlek
  graph_alert = new Alert(0,0,255,255,255,true,false);
  graph_alert.a.scale(0.7);
  graph_alert_ghost = new Alert(0,0,160,160,160,true,false);
  graph_alert_ghost.a.scale(0.7);
  bplane_ghost = new Airplane(0,0,130,130,200,160);
  rplane_ghost = new Airplane(0,0,200,130,130,160);
  pip_ghost = new Airplane(0,0,0,0,0,160);

  loadCSV();
  
  bplane.createHeadingList();
  rplane.createHeadingList();
  missile.createHeadingList();
  
  bplane.createErrAnglist();
  bplane.createAspAnglist(); 
  
  bplane.setStartConditions();
  rplane.setStartConditions();
  pip.setStartConditions();
  missile.setStartConditions();
  
  bplane.createParameterList();
}

void draw(){
  background(20);
  image(hawkeye, 30, 20);
  
  displayGhosts(); 
  
  pushMatrix();
  translate(bplane.planeX,bplane.planeY);
  rotate(bplane.headinglist[bplane.listindex]);
  if (Enable_Objects) {
  bplane.display();
  }
  bplane.update();
  popMatrix();  
  
  pushMatrix();
  translate(rplane.planeX,rplane.planeY);
  rotate(rplane.headinglist[rplane.listindex]);
  if (Enable_Objects) {
  rplane.display();
  }
  rplane.update();
  popMatrix();

  pushMatrix();
  translate(pip.planeX,pip.planeY);
  if (Primp && Enable_Objects) {
    pip.display(); }
  pip.update();
  popMatrix();
  
  pushMatrix();
  translate(missile.planeX,missile.planeY);
  rotate(missile.headinglist[missile.listindex]);
  if (bplane.listindex == missile_launch_index) {
    missileLaunched = true;  
  }
  if (missileLaunched && Enable_Objects) {
    missile.display();
  }
  missile.update();
  popMatrix();

  pushMatrix();
  translate(bplane.planeX+10,bplane.planeY+30);
  if (bplane.listindex > missile_launch_index - alert_duration && missileLaunched == false){ 
   launch_alert_fill.a.scale((0.15*zoom_scale),(bplane.listindex-(missile_launch_index-alert_duration))*((0.15*zoom_scale)/(alert_duration-1)));
   //launch_alert_fill.a.scale((bplane.listindex-(missile_launch_index-alert_duration))*((0.15*zoom_scale)/(alert_duration-1)));
   if (Enable_Objects) {
   launch_alert_fill.display();
   }
   launch_alert_fill.a.scale(1/(0.15*zoom_scale),1/((bplane.listindex-(missile_launch_index-alert_duration))*((0.15*zoom_scale)/(alert_duration-1))));
   //launch_alert_fill.a.scale(1/((bplane.listindex-(missile_launch_index-alert_duration))*((0.15*zoom_scale)/(alert_duration-1))));
   if (Enable_Objects) {
   launch_alert.display();
   }
  }
  popMatrix();
  
  pushMatrix();
  if (bplane.listindex > missile_launch_index - alert_duration && bplane.listindex <= missile_launch_index + alert_duration){
    bplane.flight_parameter_list[bplane.listindex].graphDisplay(bplane.listindex);
  }
  else if (bplane.listindex >= missile_launch_index + alert_duration) {
    bplane.flight_parameter_list[bplane.listindex].graphDisplay(missile_launch_index + alert_duration);
  }
  popMatrix();
  
  fill(50);
  
  //rect(900, height-180,260,170);
  noStroke();
  rect(898, 575-180,550+5,170+45,15); //575 = height
  //rect(30, 575-180+95,550+318,120); //575 = height
  
  if (Hide_Settings == false) {
  rect(35, 575-180+95,550+180,100,15); //575 = height
  }
  
  if (bplane.listindex >= missile_launch_index) {
     stroke(0);
     strokeWeight(0);
     textFont(font_14);
     bplane.flight_parameter_list[missile_launch_index].launchDisplay(14, 900+30, 575-120);
     bplane.flight_parameter_list[missile_launch_index].launchIndicators();  
  }
  
  bplane.flight_parameter_list[bplane.listindex].axisDisplay(); 
  
  if (current_index != bplane.listindex){
  //println(bplane.listindex);
  cp5.getController("playback_index").setValue(bplane.listindex);
  
  //bplane.listindex = playback_index;
  //rplane.listindex = playback_index;
  //pip.listindex = playback_index;
  //missile.listindex = playback_index;
  }
  current_index=bplane.listindex;


  checkCP5toggles();
  setPlaybackSpeed();
}