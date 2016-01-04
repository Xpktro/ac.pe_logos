/*
 * Based on the Generative Typography tutorial from the Creative Application 
 * http://www.creativeapplications.net/processing/generative-typography-processing-tutorial/
 */

int gridX = 250;                       // number of horizontal grid points
int gridY = 65;                        // number of vertical grid points
float waveHeight = 25;                 // maximum height of each wave (vertex)
float baseHeight = 12;                  // default base weight of each wave (vertex)
color BACKGROUND_COLOR = color(0);   // background color of the sketch

color PGRAPHICS_COLOR = color(0);
PGraphics pg;

void setup() {
  size(1280, 720, P2D);
  smooth(16); // higher smooth setting = higher quality rendering
  // Set colorMode for the sketch to Hue-Saturation-Brightness (HSB)
  colorMode(HSB, 360, 100, 100);
  // create the offscreen PGraphics with the text 
  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.shearX(PI/16.);
  pg.translate(-85, 0);
  PFont font = createFont("Avenger", 300);
  pg.textFont(font, 300);
  pg.textAlign(CENTER, CENTER);
  pg.fill(PGRAPHICS_COLOR);
  pg.text("ac.pE", pg.width/2, pg.height/2); 
  pg.endDraw();
}

void draw() {
  background(BACKGROUND_COLOR);
  float w = float(width) / gridX;
  float h = float(height) / gridY;
  translate(w/2, h/2);
  float fc = frameCount * 0.01;
  // for each 'row'
  for (int y=0; y<gridY; y++) {
    boolean continuous = false;
    // go over all the 'columns'
    for (int x=0; x<gridX; x++) {
      // for each point, determine it's position in the grid
      float vx = x * w;
      float vy = y * h;
      // determine of this point is inside the text
      color c = pg.get(int(vx), int(vy));
      boolean inText = (c == PGRAPHICS_COLOR);
      if (inText) {
        if (!continuous) {
          // when entering the text
          continuous = true;
          fill(0);
          stroke(255);
          strokeWeight(1.3);
          beginShape();
          vertex(vx, vy);
        }
        // add a curveVertex point which is moved upwards using noise()
        float n = noise(vx + fc, vy, fc);
        vy -= n * n * waveHeight + baseHeight;
        curveVertex(vx, vy);
      } else {
        if (continuous) {
          // when exiting the text
          continuous = false;
          vertex(vx, vy);
          endShape(CLOSE);
        }
      }
    }
  }
}