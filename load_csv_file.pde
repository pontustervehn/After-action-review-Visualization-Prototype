 Table table;
 int i, errAng;
 float mapScale = 1.0;
 int missile_launch_index = 44;
 
 PrintWriter limitvalues;
 
 void loadCSV() {
 
 table = loadTable("testdata.csv", "header, csv");
  
  i=0;
  for (TableRow row : table.rows()) {
   
    if (i == 0) {
    }
    else {
      
      launcherX_=table.getRow(i).getFloat("launcherX")-table.getRow(i-1).getFloat("launcherX");
      launcherY_=table.getRow(i).getFloat("launcherY")-table.getRow(i-1).getFloat("launcherY");
      launcherZ_=table.getRow(i).getFloat("launcherZ")-table.getRow(i-1).getFloat("launcherZ");  
      launcherPos_ = new PVector(mapScale*table.getRow(i-1).getFloat("launcherX"),mapScale*table.getRow(i-1).getFloat("launcherY"),mapScale*table.getRow(i-1).getFloat("launcherZ"));
      launcher_ = new PVector(launcherX_,launcherY_,launcherZ_);
      
      bplane.coordlist[i-1] = launcherPos_;
      bplane.vectorlist[i-1] = launcher_;
      
      bplane.speedlist[i-1] = table.getRow(i).getFloat("launcherSPD");
      
      targetX_=table.getRow(i).getFloat("targetX")-table.getRow(i-1).getFloat("targetX");
      targetY_=table.getRow(i).getFloat("targetY")-table.getRow(i-1).getFloat("targetY");
      targetZ_=table.getRow(i).getFloat("targetZ")-table.getRow(i-1).getFloat("targetZ");  
      targetPos_ = new PVector(mapScale*table.getRow(i-1).getFloat("targetX"),mapScale*table.getRow(i-1).getFloat("targetY"),mapScale*table.getRow(i-1).getFloat("targetZ"));
      target_ = new PVector(targetX_,targetY_,targetZ_);
      
      rplane.coordlist[i-1] = targetPos_;
      rplane.vectorlist[i-1] = target_;
      
      pipX_=table.getRow(i).getFloat("pipX")-table.getRow(i-1).getFloat("pipX");
      pipY_=table.getRow(i).getFloat("pipY")-table.getRow(i-1).getFloat("pipY");
      pipZ_=table.getRow(i).getFloat("pipZ")-table.getRow(i-1).getFloat("pipZ");  
      pipPos_ = new PVector(mapScale*table.getRow(i-1).getFloat("pipX"),mapScale*table.getRow(i-1).getFloat("pipY"),mapScale*table.getRow(i-1).getFloat("pipZ"));
      pip_ = new PVector(pipX_,pipY_,pipZ_);
      
      pip.coordlist[i-1] = pipPos_;
      pip.vectorlist[i-1] = pip_;
      
      errAngX_ = table.getRow(i-1).getFloat("pipX")-table.getRow(i-1).getFloat("launcherX");
      errAngY_ = table.getRow(i-1).getFloat("pipY")-table.getRow(i-1).getFloat("launcherY");
      errAngZ_ = table.getRow(i-1).getFloat("pipZ")-table.getRow(i-1).getFloat("launcherZ");
      errAng_ = new PVector(errAngX_,errAngY_,errAngZ_);
      
      bplane.plane_to_pip_list[i-1] = errAng_;
      
      bplane.plane_to_pip_headinglist[i-1]=bplane.plane_to_pip_list[i-1].heading();
      
      /*
      bplane.missile_status_list[i-1] = table.getRow(i).getInt("missileStatus");
      if (table.getRow(i).getInt("missileStatus") == 1) {
        missile_launch_index = i-1;
      }
      */
       
      missileX_=table.getRow(i).getFloat("missileX")-table.getRow(i-1).getFloat("missileX");
      missileY_=table.getRow(i).getFloat("missileY")-table.getRow(i-1).getFloat("missileY");
      missilePos_ = new PVector(mapScale*table.getRow(i-1).getFloat("missileX"),mapScale*table.getRow(i-1).getFloat("missileY"));
      missile_ = new PVector(missileX_,missileY_);
      
      missile.coordlist[i-1] = missilePos_;
      missile.vectorlist[i-1] = missile_;
      
      bplane.distancelist[i-1] = launcherPos_.dist(targetPos_);    
    }
    i += 1;   
  }
 }
 
 
void loadLimitValues() {
  //cp5.getController("spd_slider").setValue(1.0);
  table = loadTable("limitvalues.csv", "header, csv");
  for (TableRow row : table.rows()) {
    //table.getRow(i).getFloat("launcherX")
    cp5.getController("spd_min").setValue(table.getRow(0).getFloat("spd_min")); 
    cp5.getController("spd_nMin").setValue(table.getRow(0).getFloat("spd_nMin"));
    cp5.getController("spd_nMax").setValue(table.getRow(0).getFloat("spd_nMax"));
    cp5.getController("spd_max").setValue(table.getRow(0).getFloat("spd_max"));
    cp5.getController("alt_min").setValue(table.getRow(0).getFloat("alt_min")); 
    cp5.getController("alt_nMin").setValue(table.getRow(0).getFloat("alt_nMin"));
    cp5.getController("alt_nMax").setValue(table.getRow(0).getFloat("alt_nMax"));
    cp5.getController("alt_max").setValue(table.getRow(0).getFloat("alt_max"));
    cp5.getController("dist_min").setValue(table.getRow(0).getFloat("dist_min")); 
    cp5.getController("dist_nMin").setValue(table.getRow(0).getFloat("dist_nMin"));
    cp5.getController("dist_nMax").setValue(table.getRow(0).getFloat("dist_nMax"));
    cp5.getController("dist_max").setValue(table.getRow(0).getFloat("dist_max"));
    cp5.getController("errAng_min").setValue(table.getRow(0).getFloat("errAng_min")); 
    cp5.getController("errAng_nMin").setValue(table.getRow(0).getFloat("errAng_nMin"));
    cp5.getController("errAng_nMax").setValue(table.getRow(0).getFloat("errAng_nMax"));
    cp5.getController("errAng_max").setValue(table.getRow(0).getFloat("errAng_max"));
    cp5.getController("aspAng_min").setValue(table.getRow(0).getFloat("aspAng_min")); 
    cp5.getController("aspAng_nMin").setValue(table.getRow(0).getFloat("aspAng_nMin"));
    cp5.getController("aspAng_nMax").setValue(table.getRow(0).getFloat("aspAng_nMax"));
    cp5.getController("aspAng_max").setValue(table.getRow(0).getFloat("aspAng_max"));
  }
}

void saveLimitValues() {
  limitvalues = createWriter("limitvalues.csv");
  //outputX.println(mouseX);
  limitvalues.println("spd_min,spd_nMin,spd_nMax,spd_max,alt_min,alt_nMin,alt_nMax,alt_max,dist_min,dist_nMin,dist_nMax,dist_max,errAng_min,errAng_nMin,errAng_nMax,errAng_max,aspAng_min,aspAng_nMin,aspAng_nMax,aspAng_max");
  limitvalues.print(cp5.getController("spd_min").getValue() +",");
  limitvalues.print(cp5.getController("spd_nMin").getValue() +",");
  limitvalues.print(cp5.getController("spd_nMax").getValue() +",");
  limitvalues.print(cp5.getController("spd_max").getValue() +",");
  limitvalues.print(cp5.getController("alt_min").getValue() +",");
  limitvalues.print(cp5.getController("alt_nMin").getValue() +",");
  limitvalues.print(cp5.getController("alt_nMax").getValue() +",");
  limitvalues.print(cp5.getController("alt_max").getValue() +",");
  limitvalues.print(cp5.getController("dist_min").getValue() +",");
  limitvalues.print(cp5.getController("dist_nMin").getValue() +",");
  limitvalues.print(cp5.getController("dist_nMax").getValue() +",");
  limitvalues.print(cp5.getController("dist_max").getValue() +",");
  limitvalues.print(cp5.getController("errAng_min").getValue() +",");
  limitvalues.print(cp5.getController("errAng_nMin").getValue() +",");
  limitvalues.print(cp5.getController("errAng_nMax").getValue() +",");
  limitvalues.print(cp5.getController("errAng_max").getValue() +",");
  limitvalues.print(cp5.getController("aspAng_min").getValue() +",");
  limitvalues.print(cp5.getController("aspAng_nMin").getValue() +",");
  limitvalues.print(cp5.getController("aspAng_nMax").getValue() +",");
  limitvalues.print(cp5.getController("aspAng_max").getValue());
  limitvalues.flush(); // Writes the remaining data to the file
  limitvalues.close(); // Finishes the file
}