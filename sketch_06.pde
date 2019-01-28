//create capture
import processing.video.*;
Capture video;

//pixels
int videoScale = 10;
int cols, rows;
int width = 800;
int height = 600;

//stop
int option = 1;

//imag
PImage img;
PImage error;
PImage undefined;

//link button
boolean overButton = false;

//rect
float speed = 1.5;
float yValue = -20;

//background music
import ddf.minim.*;
Minim minim;
AudioPlayer player;

void captureEvent(Capture video) {  
  video.read();
}


void setup() {  
  img = loadImage("stop.png");
  error = loadImage("error-01.png");
  undefined = loadImage("undefined-02.png");
  
  minim = new Minim(this);
  player = minim.loadFile("speech-2.mp3");
  player.loop();
  ////player.play();

  size(displayWidth, displayHeight);
  cols = width / videoScale;  
  rows = height/ videoScale;  

  video = new Capture(this, cols, rows);
  video.start();
}

void draw() { 
  background(0);
  video.loadPixels();  
  // Begin loop for columns  
  for (int i = 0; i < cols; i++) {    
    // Begin loop for rows    
    for (int j = 0; j < rows; j++) {      

      int x = i*videoScale;      
      int y = j*videoScale;    

      // Reverse the column to mirro the image.
      int loc = (video.width - i - 1) + j * video.width;       
      color c = video.pixels[loc];
      float sz = (brightness(c)/255) * videoScale; 

      rectMode(CENTER);      
      fill(255);      
      noStroke();  
      ellipse((displayWidth/4-50) + x + videoScale/2, (displayHeight/7-20) + y + videoScale/2, sz, sz);
      rect((displayWidth/4-50) + x + videoScale, (displayHeight/7-20) + y + videoScale, random (sz/1), random(sz/1));
    }
  }
  if (overButton == true) {
    fill(0,255,0);
  } else {
    fill(255);
  }
  textSize(14);
  text("About", 244, 24);
  //fill(90);
  //rect(262, 18, 65, 33);
  
  if (option == 2) {
    fill(0, 255, 0);
    textSize(40);
    for (int x = 100; x < width+500; x+=20) {
      for (int y = 10; y < displayHeight; y+=50) {
        text("!", x, y);
      }
    }
  } else if (option == 3) {
    fill(0, 255, 0);
    textSize(25);
    for (int x = 600; x < width+400; x+=60) {
      for (int y = 10; y < displayHeight; y+=40) {
        text("%%", x, y);
      }
    }
  } else if (option == 4) {
    fill(0, 255, 0);
    textSize(20);
    for (int y = -1; y < displayWidth; y+=random(90)) {
      text("loading the fuction", 600, y);
      text("loading the fuction", 200, y);
      text("loading the fuction", 1000, y);
    }
  } else if (option == 5 ) {
   fill(0, 255, 0);
    textSize(20);
    for (int y = -1; y < displayWidth; y+=random(90)) {
      for (int x = 600; x < width+400; x+=60) {
      text("!Errors", x, y);
    }
    }
      image(error, 515, 284, 223, 28);
      image(error, 561, 334, 223, 28);
      image(error, 623, 382, 223, 28);
      
  } else if (option == 6) {
     fill(0, 255, 0);
    textSize(20);
    for (int y = -5; y <= displayWidth; y+=random(90)) {
      text("The value of action is undefined", 550, y);
    }
    image(undefined, 476, 468, 51, 45);
    image(undefined, 753, 94, 51, 45);
    image(undefined, 885, 371, 51, 45);
    
  } else if (option ==7) {
   fill(0, 255, 0);
    textSize(20);
    for (int x = 650; x <= width+500; x+=30) {
      for (int y = 10; y <= displayHeight; y+=random(70)) {
        text("NO", x, y);
      }
    }
   
  } else if (option ==8) {
     fill(0, 255, 0);
    textSize(20);
    for (int y = 0; y <= displayHeight; y+=30) {
      text("NO WAY", 200, y);
      text("NO WAY", 400, y);
      text("NO WAY", 600, y);
      text("NO WAY", 800, y);
      text("NO WAY", 1000, y);
      text("NO WAY", 1200, y);
    }
    
    yValue += speed;
    float linespacing = 40;
    for (int i=0; i<900; i++) {

      noFill();
      stroke(255);
      rect(i*linespacing+yValue, i*linespacing+yValue, i*linespacing, random(0, 150));
    }
  } else if (option ==9) {
     fill(0, 255, 0);
    textSize(20);
    for (int y = 0; y <= displayHeight; y+=30) {
      text("I ", 400, y);
      text("don't", 600, y);
       text("understand", 1000, y);
    
    }
  }else if (option ==10) {
    fill(0, 255, 0);
    textSize(30);
    for (int x = 20; x <= displayWidth; x += 50) {
      //for (int y = 50; y <= height; y+=10) {
      text("Goodbye", 400, x);
    }
  }else if (option ==11) {
  }

  fill(255);
  textSize(14);
  text("Stop This Capture", 72, 24);
  
  if (overButton == true) {
    fill(0,255,0);
  } else {
    fill(255);
  }
  image(img, 661, 740, 147/2, 72/2);
  //fill(255);
  //textSize(25);
  //text("Stop", 681, 775);
} 

void mousePressed() {
  option++;
  if (option > 11) option = 2;
   if (overButton) { 
    link("file:///Users/JasmineJ/Desktop/frontier%20space/project%202/pdf/WEB.pdf");
  }
}


void mouseMoved() { 
  checkButtons(); 
}
  
void mouseDragged() {
  checkButtons(); 
}

void checkButtons() {
  if (mouseX > 260 && mouseX < 320 && mouseY > 18 && mouseY < 51) {
    overButton = true;   
  } else {
    overButton = false;
  }
}
