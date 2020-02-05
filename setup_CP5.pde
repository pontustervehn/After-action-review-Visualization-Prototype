int slider_spacing = 50;
int settings_spacing = 60;

void setupCP5() {
  cp5 = new ControlP5(this);
    
  cp5.addToggle("Settings")
    .setLabel("Settings")
    .setPosition(600+50,575-40) //575 = height
    .setSize(45,20)
    .setColorLabel(255)
    ;  
  cp5.getController("Settings").getCaptionLabel().align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(2);
  
   
  cp5.addToggle("Enable_Ghosts")
    .setLabel("Enable Ghosts")
    .setPosition(898+10,575) //575 = height
    .setSize(64,15)
    .setColorLabel(255)
    ;  
  cp5.getController("Enable_Ghosts").getCaptionLabel().align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(2);    
    
  cp5.addToggle("Enable_Objects")
    .setLabel("Enable Planes")
    .setPosition(898+40+40,575) //575 = height
    .setSize(64,15)
    .setColorLabel(255)
    ;  
  cp5.getController("Enable_Objects").getCaptionLabel().align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(2);
    
  cp5.addToggle("Primp")
    .setLabel("Show Primp")
    .setPosition(260,400)
    .setSize(45,20)
    .setColorLabel(255)
    ;
  
  cp5.addToggle("Flight_Parameters")
    .setLabel("Show Flight Parameters")
    .setPosition(380,400)
    .setSize(45,20)
    .setColorLabel(255)
    .setValue(false)
    ;
    
  cp5.addToggle("Enable_Launch_slider")
    .setLabel("Enable launch index slider")
    .setPosition(500,400)
    .setSize(45,20)
    .setColorLabel(255)
    ; 
    
  cp5.addButton("Save_Limit_Values")
    .setLabel("Save values")
    .setPosition(450+100,50)
    .setSize(65,22)
    .setColorLabel(255)
    ;  
  cp5.getController("Save_Limit_Values").getCaptionLabel().align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(2);   
    
  cp5.addButton("Load_Limit_Values")
    .setLabel("Load values")
    .setPosition(350+100,50)
    .setSize(65,22)
    .setColorLabel(255)
    ;  
  cp5.getController("Load_Limit_Values").getCaptionLabel().align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(2);  
      
  cp5.addToggle("Hide_Settings")
    .setLabel("Hide all")
    .setPosition(width-50,50)
    .setSize(15,15)
    .setColorLabel(255)
    ;
    
  cp5.addToggle("Play_Pause_Toggle")
    .setLabel("Pause")
    .setPosition(100+50,480+17)
    .setSize(30,15)
    .setColorLabel(255)
    ;   
  cp5.getController("Play_Pause_Toggle").getCaptionLabel().align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(2);
  
  cp5.addButton("Reset_Bars_Toggle")
    .setLabel("Reset")
    .setPosition(1420,415)
    .setSize(28,15)
    .setColorLabel(255)
    ;  
  cp5.getController("Reset_Bars_Toggle").getCaptionLabel().align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(2); 
    
  cp5.addKnob("speed_setting")
    .setLabel("Playback Speed %")
    .setPosition(27+50,480+17)
    .setSize(70,20)
    .setColorLabel(255)
    .setRange(0,200)
    .setValue(100)
    ;  
    
    
  //amplitude change for bar sliders  
  cp5.addSlider("spd_slider")
    .setLabel("SPD")
    .setPosition(1200,575-162)
    .setSize(15,130)
    .setRange(0,5)
    .setValue(1)
    .setSliderMode(Slider.FLEXIBLE)
    ;
 
  cp5.addSlider("alt_slider")
    .setLabel("ALT")
    .setPosition(1200+slider_spacing,575-162)
    .setSize(15,130)
    .setRange(0,5)
    .setValue(1)
    .setSliderMode(Slider.FLEXIBLE)
    ;

  cp5.addSlider("dist_slider")
    .setLabel("PROX")
    .setPosition(1200+slider_spacing*2,575-162)
    .setSize(15,130)
    .setRange(0,5)
    .setValue(1)
    .setSliderMode(Slider.FLEXIBLE)
    ;

  cp5.addSlider("errang_slider")
    .setLabel("ERR")
    .setPosition(1200+slider_spacing*3,575-162)
    .setSize(15,130)
    .setRange(0,5)
    .setValue(1)
    .setSliderMode(Slider.FLEXIBLE)
    ;

  cp5.addSlider("aspang_slider")
    .setLabel("ASP")
    .setPosition(1200+slider_spacing*4,575-162)
    .setSize(15,130)
    .setRange(0,5)
    .setValue(1)
    .setSliderMode(Slider.FLEXIBLE)
    ;


//float spd_max,spd_min,spd_nMax,spd_nMin,alt_max,alt_min,alt_nMax,alt_nMin,dist_max,dist_min,dist_nMax,dist_nMin,errAng_max,errAng_min,errAng_nMax,errAng_nMin,aspAng_max,aspAng_min,aspAng_nMax,aspAng_nMin;
//settings sliders///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //float spd_max = 0.90;
  //float spd_min = 0.77;
  //float spd_nMax = 0.86;
  //float spd_nMin = 0.82;
  
  cp5.addSlider("spd_min")
     .setPosition(120,100)
     .hide()
     .setLabel("min")
     .setHeight(8)
     .setWidth(450)
     .setRange(0.6,1.0)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(0.75)
     ;
  cp5.getController("spd_min").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("spd_min").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);
  
  cp5.addSlider("spd_nMin")
     .setPosition(120,100+9)
     .hide()
     .setLabel("nMin")
     .setHeight(8)
     .setWidth(450)
     .setRange(0.6,1.0)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(0.80)
     ;
  cp5.getController("spd_nMin").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("spd_nMin").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);
  
  cp5.addSlider("spd_nMax")
     .setPosition(120,100+9+9)
     .hide()
     .setLabel("nMax")
     .setHeight(8)
     .setWidth(450)
     .setRange(0.6,1.0)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(0.84)
     ;
  cp5.getController("spd_nMax").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("spd_nMax").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);

  cp5.addSlider("spd_max")
     .setPosition(120,100+9+9+9)
     .hide()
     .setLabel("max")
     .setHeight(8)
     .setWidth(450)
     .setRange(0.6,1.0)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(0.90)
     ;
  cp5.getController("spd_max").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("spd_max").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);

//ALT-------------------------------------------------------------------------------------
  //float alt_max = 21000;
  //float alt_min = 17000;
  //float alt_nMax = 18300;
  //float alt_nMin = 18100;
  
  cp5.addSlider("alt_min")
     .setPosition(120,100+settings_spacing)
     .hide()
     .setLabel("min")
     .setHeight(8)
     .setWidth(450)
     .setRange(15000,24000)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(15300)
     ;
  cp5.getController("alt_min").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("alt_min").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);
  
  cp5.addSlider("alt_nMin")
     .setPosition(120,100+9+settings_spacing)
     .hide()
     .setLabel("nMin")
     .setHeight(8)
     .setWidth(450)
     .setRange(15000,24000)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(18900)
     ;
  cp5.getController("alt_nMin").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("alt_nMin").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);
  
  cp5.addSlider("alt_nMax")
     .setPosition(120,100+9+9+settings_spacing)
     .hide()
     .setLabel("nMax")
     .setHeight(8)
     .setWidth(450)
     .setRange(15000,24000)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(22100)
     ;
  cp5.getController("alt_nMax").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("alt_nMax").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);

  cp5.addSlider("alt_max")
     .setPosition(120,100+9+9+9+settings_spacing)
     .hide()
     .setLabel("max")
     .setHeight(8)
     .setWidth(450)
     .setRange(15000,24000)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(23300)
     ;
  cp5.getController("alt_max").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("alt_max").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);

//DIST-------------------------------------------------------------------------------------
  //float dist_max = 13000;
  //float dist_min = 36000;
  //float dist_nMax = 23000;
  //float dist_nMin = 32000;

cp5.addSlider("dist_min")
     .setPosition(120,100+settings_spacing*2)
     .hide()
     .setLabel("min")
     .setHeight(8)
     .setWidth(450)
     .setRange(40000,10000)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(31000)
     ;
  cp5.getController("dist_min").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("dist_min").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);
  
  cp5.addSlider("dist_nMin")
     .setPosition(120,100+9+settings_spacing*2)
     .hide()
     .setLabel("nMin")
     .setHeight(8)
     .setWidth(450)
     .setRange(40000,10000)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(26000)
     ;
  cp5.getController("dist_nMin").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("dist_nMin").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);
  
  cp5.addSlider("dist_nMax")
     .setPosition(120,100+9+9+settings_spacing*2)
     .hide()
     .setLabel("nMax")
     .setHeight(8)
     .setWidth(450)
     .setRange(40000,10000)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(23000)
     ;
  cp5.getController("dist_nMax").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("dist_nMax").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);

  cp5.addSlider("dist_max")
     .setPosition(120,100+9+9+9+settings_spacing*2)
     .hide()
     .setLabel("max")
     .setHeight(8)
     .setWidth(450)
     .setRange(40000,10000)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(12000)
     ;
  cp5.getController("dist_max").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("dist_max").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);

//ERR ANGLE-------------------------------------------------------------------------------------
  //float errAng_max = 0;
  //float errAng_min = 70;
  //float errAng_nMax = 20;
  //float errAng_nMin = 25;
  
  cp5.addSlider("errAng_min")
     .setPosition(120,100+settings_spacing*3)
     .hide()
     .setLabel("min")
     .setHeight(8)
     .setWidth(450)
     .setRange(180,0)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(75)
     ;
  cp5.getController("errAng_min").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("errAng_min").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);
  
  cp5.addSlider("errAng_nMin")
     .setPosition(120,100+9+settings_spacing*3)
     .hide()
     .setLabel("nMin")
     .setHeight(8)
     .setWidth(450)
     .setRange(180,0)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(50)
     ;
  cp5.getController("errAng_nMin").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("errAng_nMin").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);
  
  cp5.addSlider("errAng_nMax")
     .setPosition(120,100+9+9+settings_spacing*3)
     .hide()
     .setLabel("nMax")
     .setHeight(8)
     .setWidth(450)
     .setRange(180,0)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(40)
     ;
  cp5.getController("errAng_nMax").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("errAng_nMax").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);

  cp5.addSlider("errAng_max")
     .setPosition(120,100+9+9+9+settings_spacing*3)
     .hide()
     .setLabel("max")
     .setHeight(8)
     .setWidth(450)
     .setRange(180,0)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(8)
     ;
  cp5.getController("errAng_max").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("errAng_max").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);

//ASP ANG-------------------------------------------------------------------------------------
  //float aspAng_max = 180;
  //float aspAng_min = 0;
  //float aspAng_nMax = 170;
  //float aspAng_nMin = 135;
  
   cp5.addSlider("aspAng_min")
     .setPosition(120,100+settings_spacing*4)
     .hide()
     .setLabel("min")
     .setHeight(8)
     .setWidth(450)
     .setRange(0,180)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(0)
     ;
  cp5.getController("aspAng_min").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("aspAng_min").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);
  
  cp5.addSlider("aspAng_nMin")
     .setPosition(120,100+9+settings_spacing*4)
     .hide()
     .setLabel("nMin")
     .setHeight(8)
     .setWidth(450)
     .setRange(0,180)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(100)
     ;
  cp5.getController("aspAng_nMin").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("aspAng_nMin").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);
  
  cp5.addSlider("aspAng_nMax")
     .setPosition(120,100+9+9+settings_spacing*4)
     .hide()
     .setLabel("nMax")
     .setHeight(8)
     .setWidth(450)
     .setRange(0,180)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(140)
     ;
  cp5.getController("aspAng_nMax").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("aspAng_nMax").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);

  cp5.addSlider("aspAng_max")
     .setPosition(120,100+9+9+9+settings_spacing*4)
     .hide()
     .setLabel("max")
     .setHeight(8)
     .setWidth(450)
     .setRange(0,180)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(180)
     ;
  cp5.getController("aspAng_max").getValueLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(30);
  cp5.getController("aspAng_max").getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,ControlP5.CENTER).setPaddingX(2);
  
//--------------------------------------------------------------------------


  cp5.addSlider("missile_launch_index")
     .setPosition(898+65+50+50+2,575)
     .setLabel("Launch index setting")
     .setHeight(14)
     .setWidth(380)
     .setRange(26,140)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(44)
     ;
  cp5.getController("missile_launch_index").getValueLabel().align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(0);
  cp5.getController("missile_launch_index").getCaptionLabel().align(ControlP5.CENTER,ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
  
    //rect(898, 575-180,540+8+2,170); //575 = height
  /*
  cp5.addSlider("missile_launch_index")
     .setPosition(135,575-80)
     .setLabel("Launch index setting")
     .setHeight(14)
     .setWidth(420)
     .setRange(26,140)
     .setSliderMode(Slider.FLEXIBLE)
     .setValue(44)
     ;
  cp5.getController("missile_launch_index").getValueLabel().align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(0);
  cp5.getController("missile_launch_index").getCaptionLabel().align(ControlP5.CENTER,ControlP5.TOP_OUTSIDE).setPaddingX(0);
  */
  
    cp5.addSlider("playback_index")
     .setPosition(135+50,575-40)
     .setLabel("Playback index setting")
     .setHeight(18)
     .setWidth(420)
     .setRange(12,153)
     .setSliderMode(Slider.FLEXIBLE)
     ;
  cp5.getController("playback_index").getValueLabel().align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(0);
  cp5.getController("playback_index").getCaptionLabel().align(ControlP5.CENTER,ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
  
  
  

// reposition the Label for controller 'slider'
//cp5.getController("slider").getValueLabel().align(ControlP5.LEFT,ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
//cp5.getController("slider").getCaptionLabel().align(ControlP5.RIGHT,ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
//.setWidth(400)
//.setNumberOfTickMarks(7)
//.setSliderMode(Slider.FLEXIBLE)
//.setValueLabel("")

}

void setSettingsVisibility(String status) {
  
  if (status == "show") {
    cp5.getController("spd_min").show();
    cp5.getController("spd_nMin").show();
    cp5.getController("spd_nMax").show();
    cp5.getController("spd_max").show();
    cp5.getController("alt_min").show();
    cp5.getController("alt_nMin").show();
    cp5.getController("alt_nMax").show();
    cp5.getController("alt_max").show();
    cp5.getController("dist_min").show();
    cp5.getController("dist_nMin").show();
    cp5.getController("dist_nMax").show();
    cp5.getController("dist_max").show();
    cp5.getController("errAng_min").show();
    cp5.getController("errAng_nMin").show();
    cp5.getController("errAng_nMax").show();
    cp5.getController("errAng_max").show();
    cp5.getController("aspAng_min").show();
    cp5.getController("aspAng_nMin").show();
    cp5.getController("aspAng_nMax").show();
    cp5.getController("aspAng_max").show();
    cp5.getController("Enable_Launch_slider").show();
    cp5.getController("Primp").show();
    cp5.getController("Flight_Parameters").show();
    cp5.getController("Save_Limit_Values").show();
    cp5.getController("Load_Limit_Values").show();
    
  }
  else {
    cp5.getController("spd_min").hide();
    cp5.getController("spd_nMin").hide();
    cp5.getController("spd_nMax").hide();
    cp5.getController("spd_max").hide();
    cp5.getController("alt_min").hide();
    cp5.getController("alt_nMin").hide();
    cp5.getController("alt_nMax").hide();
    cp5.getController("alt_max").hide();
    cp5.getController("dist_min").hide();
    cp5.getController("dist_nMin").hide();
    cp5.getController("dist_nMax").hide();
    cp5.getController("dist_max").hide();
    cp5.getController("errAng_min").hide();
    cp5.getController("errAng_nMin").hide();
    cp5.getController("errAng_nMax").hide();
    cp5.getController("errAng_max").hide();
    cp5.getController("aspAng_min").hide();
    cp5.getController("aspAng_nMin").hide();
    cp5.getController("aspAng_nMax").hide();
    cp5.getController("aspAng_max").hide();
    cp5.getController("Enable_Launch_slider").hide();
    cp5.getController("Primp").hide();
    cp5.getController("Flight_Parameters").hide();
    cp5.getController("Save_Limit_Values").hide();
    cp5.getController("Load_Limit_Values").hide();
    
  }
   //cp5.getController("spd_slider").hide();
}


void setCP5Visibility (String status) {
    if (status == "show") {
      cp5.getController("playback_index").show();
      cp5.getController("missile_launch_index").show();
      cp5.getController("Play_Pause_Toggle").show();
      cp5.getController("Reset_Bars_Toggle").show();
      cp5.getController("speed_setting").show();
      cp5.getController("spd_slider").show();
      cp5.getController("alt_slider").show();
      cp5.getController("dist_slider").show();
      cp5.getController("errang_slider").show();
      cp5.getController("aspang_slider").show();
      cp5.getController("Settings").show();
      cp5.getController("Enable_Objects").show();
      cp5.getController("Enable_Ghosts").show();
      setSettingsVisibility("show");
    }
    else {
      cp5.getController("playback_index").hide();
      cp5.getController("missile_launch_index").hide();
      cp5.getController("Play_Pause_Toggle").hide();
      cp5.getController("Reset_Bars_Toggle").hide();
      cp5.getController("speed_setting").hide();
      cp5.getController("spd_slider").hide();
      cp5.getController("alt_slider").hide();
      cp5.getController("dist_slider").hide();
      cp5.getController("errang_slider").hide();
      cp5.getController("aspang_slider").hide();
      cp5.getController("Settings").hide();
      cp5.getController("Enable_Objects").hide();
      cp5.getController("Enable_Ghosts").hide();
      setSettingsVisibility("hide");
    }
}
    
  