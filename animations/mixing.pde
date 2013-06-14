Blob[] blobs = new Blob[56];
 
void setup()
{
  size(1500, 800);
  stroke(0);
  smooth();
  //noStroke();
  strokeWeight(3);
  frameRate(25);
 
  blobs[0] = new Blob(10, 10,6,22);
  blobs[1] = new Blob(20, 20,12,35);
  blobs[2] = new Blob(30, 35,2,33);
  blobs[3] = new Blob(120, 30,25,30);
  blobs[4] = new Blob(66, 10,6,24);
  blobs[5] = new Blob(10, 10,6,22);
  blobs[6] = new Blob(20, 20,12,35);
  blobs[7] = new Blob(30, 35,2,33);
  blobs[8] = new Blob(120, 30,25,30);
  blobs[9] = new Blob(66, 10,6,24);
  blobs[10] = new Blob(10, 10,6,22);
  blobs[11] = new Blob(20, 20,12,35);
  blobs[12] = new Blob(30, 35,2,33);
  blobs[13] = new Blob(120, 30,25,30);
  blobs[14] = new Blob(66, 10,6,24);
  blobs[15] = new Blob(19,23,29,35);
  blobs[16] = new Blob(25,29,35,40);
  blobs[17] = new Blob(30,33,38,44);
  blobs[18] = new Blob(33,37,41,49);
  blobs[19] = new Blob(38,42,46,52);
  blobs[20] = new Blob(42,46,50,56);
  blobs[21] = new Blob(48,51,55,61);
  blobs[22] = new Blob(52,55,59,66);
  blobs[23] = new Blob(58,60,62,70);
  blobs[24] = new Blob(8,12,19,21);
  blobs[25] = new Blob(14,19,25,28);
  blobs[26] = new Blob(20,25,30,35);
  blobs[27] = new Blob(23,30,35,38);
  blobs[28] = new Blob(29,35,40,43);
  blobs[29] = new Blob(32,40,45,49);
  blobs[30] = new Blob(39,45,20,17);
  blobs[31] = new Blob(52,60,30,35);
  blobs[32] = new Blob(42,28,19,45);
  blobs[33] = new Blob(35,41,32,19);
  blobs[34] = new Blob(51,38,26,42);
  blobs[35] = new Blob(35,62,15,58);
  blobs[36] = new Blob(25,29,35,40);
  blobs[37] = new Blob(30,33,38,44);
  blobs[38] = new Blob(33,37,41,49);
  blobs[39] = new Blob(38,42,46,52);
  blobs[40] = new Blob(42,46,50,56);
  blobs[41] = new Blob(48,51,55,61);
  blobs[42] = new Blob(52,55,59,66);
  blobs[43] = new Blob(58,60,62,70);
  blobs[44] = new Blob(8,12,19,21);
  blobs[45] = new Blob(14,19,25,28);
  blobs[46] = new Blob(20,25,30,35);
  blobs[47] = new Blob(23,30,35,38);
  blobs[48] = new Blob(29,35,40,43);
  blobs[49] = new Blob(32,40,45,49);
  blobs[50] = new Blob(39,45,20,17);
  blobs[51] = new Blob(52,60,30,35);
  blobs[52] = new Blob(42,28,19,45);
  blobs[53] = new Blob(35,41,32,19);
  blobs[54] = new Blob(51,38,26,42);
  blobs[55] = new Blob(35,62,15,58);
  
  
}
 
 
void draw()
 {

  var skeletons = getSkeletons();

   fill(skeletons[1].head[0], 25, 10,250);
  // background(#C95F45);
  rect(0, 0, width, height);
  for (int i = 0; i < blobs.length; i++)
  {
    blobs[i].ciz();
  }
   
 }
 
 class Blob
 {
  float ci_x = random(30);
  float ci_y = random(30);
  /*float ci_x;
  float ci_y;*/
 
  float move_x = random(50);
  float move_y = random(50);
 
  float currentx;
  float currenty;
  float num = random(50);
 
  int Segments;
  int buyuk;
  
  Blob(int seg, int b,float cx,float cy)
  {
    currentx = width / 2;
    currenty = height / 2;
    ci_x = cx;
    ci_y = cy;
   
    Segments = seg;
    buyuk = b;
  }
  
   void ciz(int color) {
    translate(width * noise(num+30), height * noise(num+50));
 
    rotate(80 * noise(num+10));
    num = num + 0.00009;
 
    float x[] = new float[Segments];
    float y[] = new float[Segments];
 
    for (int i=0; i<Segments; i++) {
      
     // float reb = noise(50);
      float angle = float(i) / float(Segments) * TWO_PI;
      float distance = buyuk + 8 * noise(i, frameCount/10.0); 
 
      x[i] = ci_x + sin(angle) * distance+80;
      y[i] = ci_y + cos(angle) * distance+80;
    }
 
    if (ci_x > width) {
      ci_x = width;
      move_x = -move_x;
    }
 
    if (ci_y > height) {
      ci_y = height;
      move_y = -move_y;
    }
 
    if (ci_x < 0) {
      ci_x = 0;
      move_x = -move_x;
    }
 
    if (ci_y < 0) {
      ci_y = 0;
      move_y = -move_y;
    }
 
    beginShape();
    fill(color);
 
    for (int i=0; i<Segments+4; i++) {
      curveVertex(x[i % Segments], y[i % Segments]);
      
    }
 
    endShape();
    resetMatrix();
  }
}
