void checkCP5toggles() {
  if (Hide_Settings == true) {
   setCP5Visibility("hide"); 
   //setSettingsVisibility("hide");
   //Settings = false;
  }
  else {
  setCP5Visibility("show"); 
  }
  
  if (Flight_Parameters == true && Hide_Settings == false) {
    textFont(font_13);
    bplane.flight_parameter_list[bplane.listindex].launchDisplay(13, 700, 50);
  }
  
  if (Settings == true && Hide_Settings == false) {
    setSettingsVisibility("show");
    textFont(font_14);
    stroke(0);
    strokeWeight(0);
    fill(30);
    rect(30,20,640,450);
    textSize(14);
    fill(255);
    text("Speed", 52, 100+30);
    text("Altitude", 52, 160+26);
    text("Proximity", 52, 220+22);
    text("Error \u2220", 52, 280+20);
    text("Aspect \u2220", 52, 340+18);
  }
  else {
    setSettingsVisibility("hide");
  }
  
  if (Enable_Launch_slider == true && Hide_Settings == false) {
   cp5.getController("missile_launch_index").show();
   cp5.getController("Enable_Objects").show();
   cp5.getController("Enable_Ghosts").show();
  }
  else {
    cp5.getController("missile_launch_index").hide();
    cp5.getController("Enable_Objects").hide();
    cp5.getController("Enable_Ghosts").hide();
  }

  if (speed_setting != 0) {
    //Play_Pause_Toggle = false;
    temp_speed = speed_setting;
  }
  
  if (Play_Pause_Toggle == true) {
    cp5.getController("Play_Pause_Toggle").setLabel("Play");
    speed_setting = 0;
  }
  else {
    cp5.getController("Play_Pause_Toggle").setLabel("Pause");
    speed_setting = temp_speed;
  }
  
  if (Reset_Bars_Toggle == true) {
      cp5.getController("spd_slider").setValue(1.0);
      cp5.getController("alt_slider").setValue(1.0);
      cp5.getController("dist_slider").setValue(1.0);
      cp5.getController("errang_slider").setValue(1.0);
      cp5.getController("aspang_slider").setValue(1.0);
      Reset_Bars_Toggle = false;
  }
  
  if (Save_Limit_Values == true) {
      saveLimitValues();
      Save_Limit_Values = false;
  }
  
    if (Load_Limit_Values == true) {
      loadLimitValues();
      Load_Limit_Values = false;
  } 
  
///////////////////////////////////////////end Check cp5_toggles///////////////////////////////////////////////   
}

void setPlaybackSpeed() {
  percentageValue = speed_setting;
  if (percentageValue == 100){
    framesBetweenSamples = framespeed;
  }
  else {
    if (percentageValue > 100){
      framesBetweenSamples = round(framespeed-((percentageValue/100.0)*((framespeed/2)+(framespeed*0.075))));
    }
    if (percentageValue < 100){
      framesBetweenSamples = framespeed/((percentageValue + 0.00001)/100);
    }  
  }
}

void displayPip(int r, int g, int b) {
  strokeWeight(1);
  stroke(color(r,g,b));
  line(0, 0, 15, 15);
  stroke(color(r,g,b));
  line(0, 15, 15, 0);
  stroke(color(r,g,b));
}

void displayGhosts() {
    if(Enable_Ghosts == true){
    if (bplane.listindex > missile_launch_index) {
    pushMatrix();
      translate(bplane.coordlist[missile_launch_index].x,bplane.coordlist[missile_launch_index].y);
      rotate(bplane.headinglist[missile_launch_index]);
      bplane_ghost.display();
    popMatrix();
    pushMatrix();
      translate(rplane.coordlist[missile_launch_index].x,rplane.coordlist[missile_launch_index].y);
      rotate(rplane.headinglist[missile_launch_index]);
      rplane_ghost.display();
    popMatrix();
    pushMatrix();
      translate(pip.coordlist[missile_launch_index].x,pip.coordlist[missile_launch_index].y);
      pip_ghost.display();
    popMatrix();
    
    ///////////-----------------------------------------------------------------------------------------------------------------
    pushMatrix();
      translate(bplane.coordlist[default_missile_launch_index].x,bplane.coordlist[default_missile_launch_index].y);
      rotate(bplane.headinglist[default_missile_launch_index]);
      bplane_ghost.display();
    popMatrix();
    pushMatrix();
      translate(rplane.coordlist[default_missile_launch_index].x,rplane.coordlist[default_missile_launch_index].y);
      rotate(rplane.headinglist[default_missile_launch_index]);
      rplane_ghost.display();
    popMatrix();
    /*
    pushMatrix();
      translate(pip.coordlist[default_missile_launch_index].x,pip.coordlist[default_missile_launch_index].y);
      pip_ghost.display();
    popMatrix();
   */
   
    pushMatrix();
      translate(bplane.coordlist[default_missile_launch_index].x-5,bplane.coordlist[default_missile_launch_index].y+15);
      graph_alert.display();
    popMatrix();
    pushMatrix();
      translate(rplane.coordlist[default_missile_launch_index].x+5,rplane.coordlist[default_missile_launch_index].y+15);
      graph_alert.display();
    popMatrix();
    
    /*
    pushMatrix();
      translate(pip.coordlist[default_missile_launch_index].x+5,pip.coordlist[default_missile_launch_index].y+7);
      graph_alert.display();
    popMatrix();
    */
    
    }
    }
}