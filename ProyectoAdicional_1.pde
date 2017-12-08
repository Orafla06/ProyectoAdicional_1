import processing.video.*;
int cellSize = 15;
int cols, rows;
Capture video;

void setup() {
  size(640, 480);

  cols = width / cellSize;
  rows = height / cellSize;
  colorMode(RGB, 255, 255, 255, 100);
  rectMode(CENTER);
  video = new Capture(this, width, height);
  video.start();  
  background(0);
}


void draw() { 
  scale(.5);
  if (video.available()) {
    video.read();
    video.loadPixels();
    background(0);
    tint(255,155,45);
    image(video, width , height);

  for (int i = 0; i < cols;i++) {
      for (int j = 0; j < rows;j++) {

        int x = i * cellSize;
        int y = j * cellSize;
        int loc = (video.width - x - 1) + y*video.width; //mirror image         
 
        color c = video.pixels[loc];
        float sz = (brightness(c) / 255.0) * cellSize;
   
        fill(random(255),random(155),45);
        noStroke();
        rect(x + cellSize/2, y + cellSize/2, sz, sz);      
      }
    }
    
  }
}