float topX, topY, sideLength;
boolean on; 
boolean dragger = false;
float xAccel, yAccel;
float yVelo = 0;
float xVelo = 0;


public void setup(){
size(1000, 1000);
frameRate(60);
topX = 500;
topY = 500;
sideLength = 100;
}

public void draw(){
background(255);
strokeWeight(5);
line(500.0, 500.0, topX, topY);
sierpinski(topX, topY, sideLength);
falling();
collision();
}

public void mouseDragged(){
 dragger = true;
 if(mouseX > sideLength*2 && mouseX < 1000-sideLength*2){
 topX = mouseX;
 }
 else if(mouseX <= sideLength*2){topX = sideLength*2;}
 else if(mouseX >= 1000-sideLength*2){topX = 1000-sideLength*2;}
 if(mouseY > 0 && mouseY < (1000-sideLength*4)){
 topY = mouseY;
 }
 else if(mouseY <= 0){topY = 0;}
 else if(mouseY >= 1000-sideLength*4){topY = 1000-sideLength*4;}
 yAccel = 0;
 yVelo = 0;
 xAccel = 0;
 xVelo = 0;
}

public void mouseReleased(){
 dragger = false; 
}

public void sierpinski(float x, float y, float len) {
  strokeWeight(2);
  triangle(x, y, x-(len/2), y+len, x+(len/2),y+len);
  triangle(x-(len/2), y+len, x-len, y+(2*len), x, y+(2*len));
  triangle(x+(len/2), y+len, x+len, y+(2*len), x, y+(2*len));
  if(len >= 1){
  sierpinski(x-len, y+(2*len), len/2);
  sierpinski(x+len, y+(2*len), len/2);
  }
}

public void keyPressed(){
 if(keyCode == UP || key == 'W' || key == 'w'){sideLength++;} 
 if(keyCode == DOWN || key == 'S' || key == 's'){sideLength--;} 
}

public void falling(){
 if(dragger == false){
 if(topY < 500){yAccel = 0.25*(dist(500, 500, 500, topY)/(200*(sideLength/25)));}
 else if(topY > 500) {yAccel = -0.25*(dist(500, 500, 500, topY)/(200*(sideLength/25)));}
 if(topX < 500){xAccel = 0.25*(dist(500, 500, topX, 500)/(200*(sideLength/25)));}
 else if(topX > 500){xAccel = -0.25*(dist(500, 500, topX, 500)/(200*(sideLength/25)));}
 yAccel = yAccel + 0.10;
 }
 yVelo = yVelo + yAccel;
 topY = topY + yVelo; 
 xVelo = xVelo + xAccel;
 topX = topX + xVelo; 
}

public void collision(){
 if(topY < 0){yVelo = -yVelo; yAccel = -yAccel;}
 if(topY > 1000-sideLength*4){yVelo = -yVelo; yAccel = -yAccel;}
 if(topX < sideLength*2){xVelo = -xVelo; xAccel = -xAccel;}
 if(topX > 1000-sideLength*2){xVelo = -xVelo; xAccel = -xAccel;}
}
