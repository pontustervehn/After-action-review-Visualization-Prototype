float spd_slider,alt_slider,dist_slider,errang_slider,aspang_slider;
float spd_max,spd_min,spd_nMax,spd_nMin,alt_max,alt_min,alt_nMax,alt_nMin,dist_max,dist_min,dist_nMax,dist_nMin,errAng_max,errAng_min,errAng_nMax,errAng_nMin,aspAng_max,aspAng_min,aspAng_nMax,aspAng_nMin;
int spacing;
int height_adjust = 45;

float launch_spd_height, launch_alt_height, launch_dist_height, launch_errAng_height, launch_aspAng_height;

/*
float spd_slider = 1.0;
float alt_slider = 1.0; 
float dist_slider = 1.0; 
float errang_slider = 1.0;  
float aspang_slider = 1.0; 
*/

class Parameters {
  float spd, alt, dist, errAng, aspAng;
  color spd_color, alt_color, dist_color, errAng_color, aspAng_color;
  int spd_height, alt_height, dist_height, errAng_height, aspAng_height, launch_spacing;
  
  //Parameter limits
  //========================================================
  /*
  float spd_max = 0.90;
  float spd_min = 0.77;
  float spd_nMax = 0.86;
  float spd_nMin = 0.82;
 
  float alt_max = 21000;
  float alt_min = 17000;
  float alt_nMax = 18300;
  float alt_nMin = 18100;
 
  float dist_max = 13000;
  float dist_min = 36000;
  float dist_nMax = 23000;
  float dist_nMin = 32000;
 
  float errAng_max = 0;
  float errAng_min = 70;
  float errAng_nMax = 20;
  float errAng_nMin = 25;
 
  float aspAng_max = 180;
  float aspAng_min = 0;
  float aspAng_nMax = 170;
  float aspAng_nMin = 135;
  */
  
  //========================================================
  int graphlevel=60;
  
    Parameters(float x, float y, float z, float q, float w) {
      spd = x;
      alt = y;
      dist = z;
      errAng = q;
      aspAng = w;
      
      //spd_color = determineColor(spd, spd_max, spd_min, spd_nMax, spd_nMin);
      //alt_color = determineColor(alt, alt_max, alt_min, alt_nMax, alt_nMin);
      //dist_color = determineColor(dist, dist_max, dist_min, dist_nMax, dist_nMin);
      //errAng_color = determineColor(errAng, errAng_max, errAng_min, errAng_nMax, errAng_nMin);
      //aspAng_color = determineColor(aspAng, aspAng_max, aspAng_min, aspAng_nMax, aspAng_nMin);
      
      //print(determineRectHeight(spd, 0.95, 0.65, 0.8, 0.79) + "\n");
      //print(determineRectHeight(errAng, 0, 180, 30, 45) + "\n");
    }
    
    void createRectangles(int xpos, int i){
      pushMatrix();
      scale(1, -1);
      translate(0, -height);
      
      spd_height = determineRectHeight(spd, spd_max, spd_min, spd_nMax, spd_nMin, graphlevel*spd_slider);
      alt_height = determineRectHeight(alt, alt_max, alt_min, alt_nMax, alt_nMin, graphlevel*alt_slider);
      dist_height = determineRectHeight(dist, dist_max, dist_min, dist_nMax, dist_nMin, graphlevel*dist_slider);
      errAng_height = determineRectHeight(errAng, errAng_max, errAng_min, errAng_nMax, errAng_nMin, graphlevel*errang_slider);
      aspAng_height = determineRectHeight(aspAng, aspAng_max, aspAng_min, aspAng_nMax, aspAng_nMin, graphlevel*aspang_slider);
      
      stroke(0);
      strokeWeight(0);
      
      fill(138,137,166);
      //default: rect(900, 200, 6, aspAng_height);
      rect(xpos, 200+height_adjust, 7, aspAng_height);
      
      fill(123,104,136);
      rect(xpos, 200+aspAng_height+height_adjust, 7, errAng_height);
      
      fill(107,72,107);
      rect(xpos, 200+aspAng_height+errAng_height+height_adjust, 7, dist_height);
      
      fill(160,93,86);
      rect(xpos, 200+aspAng_height+errAng_height+dist_height+height_adjust, 7, alt_height);
      
      fill(208,116,60);
      rect(xpos, 200+aspAng_height+errAng_height+dist_height+alt_height+height_adjust, 7, spd_height);
    
      popMatrix();
     /*
      fill(255);
      textSize(10);
      text("2", xpos, 194+height_adjust);  
      */
      if (i == default_missile_launch_index){
      pushMatrix();
      translate(xpos+3,(575-200-aspAng_height-errAng_height-dist_height-alt_height-spd_height-9));
      graph_alert.display();
      popMatrix();
      
      launch_spd_height = spd_height;
      launch_alt_height = alt_height;
      launch_dist_height = dist_height;
      launch_errAng_height = errAng_height;
      launch_aspAng_height = aspAng_height;
      
      //stroke(color(255), 150);
      //strokeWeight(2);
      ///////line(900, (575-200-aspAng_height-errAng_height-dist_height-alt_height-spd_height),900+spacing, (575-200-aspAng_height-errAng_height-dist_height-alt_height-spd_height));
      //line(900, (575-200-aspAng_height-errAng_height-dist_height-alt_height-spd_height),900+500, (575-200-aspAng_height-errAng_height-dist_height-alt_height-spd_height));
      }
      
    }
    
    void graphDisplay (int endIndex){
      fill(0);
      spacing=0;
      
      stroke(0);
      strokeWeight(0);
      
      for (int i = missile_launch_index - alert_duration; i <= endIndex; i++) {
        bplane.flight_parameter_list[i].createRectangles(900+spacing,i);

        if(i % 4 == 0){
        fill(255);
        textFont(font_10);
        textSize(10);
        if (((-default_missile_launch_index+i)/3)>=1){
          text("+"+(-default_missile_launch_index+i)/3, 900+spacing-10, 388);
        }
        else {
          text((-default_missile_launch_index+i)/3, 900+spacing-1, 388); 
        }
        }
        
        if (i == missile_launch_index) {
          launch_spacing = 900+spacing+3;
        }
        spacing += 10;
      }
    }
    
    void axisDisplay() {
      //legend
      textFont(font_10);
      stroke(200);
      strokeWeight(1);
      textSize(10);
      fill(208,116,60);
      rect(900+525, 575-200-140,10,10);
      fill(255);
      text("SPD", 900+525+17, 575-200-140+10);
      
      fill(160,93,86);
      rect(900+525, 575-200-140+22 ,10,10);
      fill(255);
      text("ALT", 900+525+17, 575-200-140+10+22);
      
      fill(107,72,107);
      rect(900+525, 575-200-140+22+22 ,10,10);
      fill(255);
      text("PROX", 900+525+17, 575-200-140+10+22+22);
      
      fill(123,104,136);
      rect(900+525, 575-200-140+22+22+22 ,10,10);
      fill(255);
      text("ERR", 900+525+17, 575-200-140+10+22+22+22);
      
      fill(138,137,166);
      rect(900+525, 575-200-140+22+22+22+22 ,10,10);
      fill(255);
      text("ASP", 900+525+17, 575-200-140+10+22+22+22+22);
      
      
      fill(255);
      text("(sec)", 900+525+17+5, 575-200-140+10+22+22+22+22+55);
      
      textFont(font_14);
      textSize(14);
      text("     \u2222", 900+525+17, 575-200-140+10+22+22+22);
      text("     \u2222", 900+525+17, 575-200-140+10+22+22+22+22);
      
      //axis
      pushMatrix();
      scale(1, -1);
      translate(0, -height);
      stroke(230);
      strokeWeight(2);
      line(900, 200+height_adjust, 900+540, 200+height_adjust);
      line(900, 200+height_adjust, 900, 200+180+height_adjust);
      noStroke();
      fill(230);
      triangle(896, 200+180+height_adjust, 900, 200+180+8+height_adjust, 905, 200+180+height_adjust);
      triangle(900+540, 196+height_adjust, 900+540+8, 200+height_adjust, 900+540, 204+height_adjust);
      popMatrix();
    }
    
    
    void launchIndicators() {
      pushMatrix();
      fill(255);
      text("LAUNCH DATA", 900+30, 575-141);
      stroke(255);
      strokeWeight(1);
      line(900+30,575-136,900+30+150,575-136);
      line(900+30+150,575-136,1120,575-170);
      line(1120,575-170,1153,575-170);  //1153 brukade vara launch_spacing, ändrade då det buggades vid flytt av launch_index
      line(1153,575-170,1153,575-196-6-10);
      triangle(1150, 575-196-10, 1153, 575-196-6-10, 1156, 575-196-10);

      //line(x1, y1, x2, y2)
      //stroke(color(255), 100);
      //strokeWeight(2);
      //line(900, (575-200-aspAng_height-errAng_height-dist_height-alt_height-spd_height),900+spacing, (575-200-aspAng_height-errAng_height-dist_height-alt_height-spd_height));
      
      //graph_alert = new Alert(launch_spacing,180,0,0,0,true,false);
      //line(launch_spacing, height-188,launch_spacing, height-200-200);
      //200+aspAng_height+errAng_height+dist_height+alt_height+spd_height)
  
      //translate(launch_spacing,(height-200-aspAng_height-errAng_height-dist_height-alt_height-spd_height-9));
      if (missile_launch_index != default_missile_launch_index){
      pushMatrix();
        translate(1153,(575-200-aspAng_height-errAng_height-dist_height-alt_height-spd_height-9));
        graph_alert_ghost.display();
      popMatrix();
      stroke(color(255), 180);
      strokeWeight(1);
      line(900, (575-200-aspAng_height-errAng_height-dist_height-alt_height-spd_height),900+500+6, (575-200-aspAng_height-errAng_height-dist_height-alt_height-spd_height));
      }
      //graph_alert.display();
      
      stroke(color(255), 180);
      strokeWeight(2);
      //line(900, (575-200-aspAng_height-errAng_height-dist_height-alt_height-spd_height),900+spacing, (575-200-aspAng_height-errAng_height-dist_height-alt_height-spd_height));
      line(900, (575-200-launch_aspAng_height-launch_errAng_height-launch_dist_height-launch_alt_height-launch_spd_height),900+500+6, (575-200-launch_aspAng_height-launch_errAng_height-launch_dist_height-launch_alt_height-launch_spd_height));


      popMatrix();
    }
    
    void launchDisplay(int textsize, int xpos, int ypos) {
      //0,255,0 = solid green
      //124,255,124 = half green
      //255,0,0 = solid red
      //255,124,124 = half red
      
      // limits:
      //speed: <0.75 (bad), 0.75-0.8 (normal), >0.8 (good)      MAX:0.95 MIN: 0.65
      //altitude: <18 (low), 18-23 (normal), >23 (good)      MAX: 27000, MIN: 11000
      //distance: >36 (out of range, too far), 36-32 (pusher, far), 32-25 (normal), <25 (good) 
      //error angle: 0 (best), 180 (worst)      
      //aspect angle: 180 (best), 0 (worst)      

      //original xpos = width-400
      //original ypos = 50
      textSize(textsize);
      fill(255, 255, 255);
      text("Speed:", xpos, ypos);

      //determineColor(parameter, max(good), min(bad), nMax(normal good), nMin (normal bad))
      
      fill(determineColor(spd, spd_max, spd_min, spd_nMax, spd_nMin));
      text("              "+ spd, xpos, ypos);
      //text(spd, xpos+(textsize*7/2), ypos);
      fill(255, 255, 255);
   
      text("Altitude:", xpos, ypos+20);
      
      fill(determineColor(alt, alt_max, alt_min, alt_nMax, alt_nMin));
      text("               " + round(alt), xpos, ypos+20);
      
      fill(255, 255, 255);
      text("Proximity to target:", xpos, ypos+40);
      
      //distance: >36 (out of range, too far), 36-32 (pusher, far), 32-25 (normal), <25 (good) 
      fill(determineColor(dist, dist_max, dist_min, dist_nMax, dist_nMin));
      float tempdist = dist/1000;
      tempdist = tempdist * 100;
      tempdist = round(tempdist);
      text("                                  " + tempdist/100,  xpos, ypos+40);
      
      
      fill(255, 255, 255);
      text("Error angle:", xpos, ypos+60);
      
      fill(determineColor(errAng, errAng_max, errAng_min, errAng_nMax, errAng_nMin));
      text("                     " + round(errAng)  +"\u00b0", xpos, ypos+60);
      
      
      fill(255, 255, 255);
      text("Aspect angle:", xpos, ypos+80);
      fill(determineColor(aspAng, aspAng_max, aspAng_min, aspAng_nMax, aspAng_nMin));
      text("                        " + round(aspAng)  +"\u00b0", xpos, ypos+80);
}
    
    
    //type: spd, max, min, nMax, nMin
    color determineColor(float param, float max, float min, float nMax, float nMin){
      float r,g,b;
      
      if (max < min) {
        if (param <= nMin && param >= nMax) {
          r = 255;
          g = 255;
          b = 255;
        }
        else if (param > nMin) {
          if (param > min) {
            r = 255;
            g = 0;
            b = 0;
          }
          else {
            r = 255;
            g = round(((min-param)*100)*(255/((min-nMin)*100)));
            b = round(((min-param)*100)*(255/((min-nMin)*100)));
          }
        }
        else {
          if (param < max) {
            r = 0;
            g = 255;
            b = 0;
          }
          else {
            r = round(((param-max)*100)*(255/((nMax-max)*100)));
            g = 255;
            b = round(((param-max)*100)*(255/((nMax-max)*100))); 
          } 
        }
        
      }
      else {
      
       if (param >= nMin && param <= nMax) {
        r = 255;
        g = 255;
        b = 255;
      }
      else if (param < nMin) {
        // tex. spd= 0.71 --> 0.21*10 -->21   I detta fall:
        //25-21=4 --> 4* 255/25 detta blir färgen
        //round(25-((spd-0.5)*10)*(255/25)); 
        if (param < min) {
          r = 255;
          g = 0;
          b = 0;
        }
        else {
        r = 255;
        g = round(((param-min)*100)*(255/((nMin-min)*100)));
        b = round(((param-min)*100)*(255/((nMin-min)*100)));
        }
      }
      else {
        if (param > max) {
          r = 0;
          g = 255;
          b = 0;
        }
        else {
          //0.842 
          //(spd, 0.95, 0.65, 0.8, 0.79));
         //type: spd, max, min, nMax, nMin
         //0.842, 0.95, 0.65, 0.8, 0.79
         //0.95-0.842 = 0.108 ---> * 100 = 10.8
         //255/ ( 0.95-0.8 = 0.15)
          
          r = round(((max-param)*100)*(255/((max-nMax)*100)));
          g = 255;
          b = round(((max-param)*100)*(255/((max-nMax)*100))); 
          //0.95-0.802 = 0.148 ---> *10
        } 
      }
      }
      //print(r + "  " + g + "  " + b + "\n"); 
      return color(r, g, b);
    }
    
    
    int determineRectHeight(float param, float max, float min, float nMax, float nMin, float level){
      int rectHeight;
      
      if (max < min) {
        if (param <= nMin && param >= nMax) {
          rectHeight=round(level/2);
        }
        else if (param > nMin) {
          if (param > min) {
            rectHeight=0;
          }
          else {
            rectHeight = round(((min-param)*100)*((level/2)/((min-nMin)*100)));
          }
        }
        else {
          if (param < max) {
            rectHeight=round(level);
          }
          else {
            rectHeight=round((level/2)+((level/2)-((param-max)*100)*((level/2)/((nMax-max)*100))));
          } 
        }
        
      }
      else {
      
       if (param >= nMin && param <= nMax) {
        rectHeight=round(level/2);
       }
       else if (param < nMin) {
         if (param < min) {
           rectHeight=0;
         }
         else {
         rectHeight = round(((param-min)*100)*((level/2)/((nMin-min)*100)));
         }
       }
       else {
         if (param > max) {
           rectHeight=round(level);
         }
         else {
           rectHeight=round((level/2)+((level/2)-(((max-param)*100)*((level/2)/((max-nMax)*100)))));
         } 
       }
       }

      return rectHeight;
    }
}