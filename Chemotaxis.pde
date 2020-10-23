 /*Program: Circle Art
What it does: 100 circle appear at 200, 200 on a 400, 400 canvas and they move around randomly.
You can change the color of the circles by clicking on a color at the bottom and then hovering
over the circles. Hovering over the circles also increases their size. If you only want to 
increase the size and not change the color then press any key while hovering.
*/
 Circle[] Alex;
 int redPaint, greenPaint, bluePaint;
 void setup()   
 {     
   size(400, 400);
   background(255);
   Alex = new Circle[100];
   for(int i = 0; i < Alex.length; i++)
   {
         Alex[i] = new Circle();
   }

 }   
 void mousePressed()
 {
   if(mouseX < 133 && mouseY > 350) {
     greenPaint = 0;
     bluePaint = 0;
     redPaint = 255;
    }else if(mouseX > 133 && mouseX < 266 && mouseY > 350) {
     bluePaint = 0;
     redPaint = 0;
     greenPaint = 255;
    }else if(mouseX > 266 && mouseY > 350) {
     redPaint = 0;
     greenPaint = 0;
     bluePaint = 255;
     }
 }
   
 void draw()   
 { 
   background(255);
   for(int i = 0; i < Alex.length; i++) 
   {
     Alex[i].move();
     Alex[i].show();
   }
   fill(255, 0, 0);
   rect(0, 350, 133, 50);
   fill(0, 255, 0);
   rect(133, 350, 133, 50);
   fill(0, 0, 255);
   rect(266, 350, 133, 50);
   fill(redPaint, greenPaint, bluePaint);
   ellipse(mouseX, mouseY, 10, 10); 
 }  
 class Circle    
 {     
   int x, y, red, green, blue;
   float circleSize;
   Circle() {
     x = 200;
     y = 200;
     circleSize = 10;
   }
   void move() {
     x += (int)(Math.random()*3);
     x -= (int)(Math.random()*3);
     y += (int)(Math.random()*3);
     y -= (int)(Math.random()*3);
   }
   void show() {
     
     fill(red, green, blue);
     ellipse(x, y, circleSize, circleSize);
     
     if(dist(mouseX, mouseY, x, y) < circleSize)
       circleSize += .2;
     if((dist(mouseX, mouseY, x, y) < circleSize) && redPaint == 255 && keyPressed == false)
     {
       red = 255;
       green = 0;
       blue = 0;
     }
     else if((dist(mouseX, mouseY, x, y) < circleSize) && greenPaint == 255 && keyPressed == false)
     {
       red = 0;
       green = 255;
       blue = 0;
     }
     else if((dist(mouseX, mouseY, x, y) < circleSize) && bluePaint == 255 && keyPressed == false)
     {
       red = 0;
       green = 0;
       blue = 255;
     }
   }
}     
