class Stamen {
  float centreSize;
  int gradientSize;
  float rotation;
  float distanceFromCentre;
  color antherColourA = color(208, 180, 147);
  color antherColourB = color(113, 81, 80);
  color filamentColourA = color(182, 181, 151);
  color filamentColourB = color(194, 188, 100);
  
  Stamen(float _size, float _rotation, float _distanceFromCentre) {
    centreSize = _size;
    rotation = _rotation;
    distanceFromCentre = _distanceFromCentre;
  }
  
  void display() {
    pushMatrix();
    rotate(rotation);
    color filamentColour = lerpColor(filamentColourA, filamentColourB, random(1));
    float filamentWidth = centreSize * (0.04 + random(0.02));
    PVector startControlPoint = new PVector(random(-0.15, 0.15), 0);
    PVector startPoint = new PVector(random(-0.05, 0.05) * centreSize, random(0.05, 0.3) * -distanceFromCentre);
    PVector endPoint = new PVector(random(-0.25, 0.25) * centreSize, -distanceFromCentre);
    PVector endControlPoint = new PVector(endPoint.x * (3 + random(12)), endPoint.y - 0.2 * distanceFromCentre);
    strokeWeight(filamentWidth);
    stroke(filamentColour, 225);
    noFill();
    curve(startControlPoint.x, startControlPoint.y, startPoint.x, startPoint.y, endPoint.x, endPoint.y, endControlPoint.x, endControlPoint.y);
    float antherSize = centreSize * (0.06 + random(0.02));
    color antherColour = lerpColor(antherColourA, antherColourB, random(1));
    noStroke();
    fill(antherColour, 205);
    ellipse(endPoint.x, endPoint.y, antherSize, antherSize);
    popMatrix();
  }
}
