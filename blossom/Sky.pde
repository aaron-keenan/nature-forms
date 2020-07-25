class Sky {
  PVector gradientCentre;
  PVector gradientEnd;
  float gradientSize;
  float gradientProgress;
  color darkest = color(76, 96, 128);
  color lightest = color(209, 221, 249);
  
  Sky() {
    gradientCentre = new PVector(-width/2 + random(2*width), -random(height/2));
    if (gradientCentre.x < width/2) {
      gradientEnd = new PVector(width, height);
    } else {
      gradientEnd = new PVector(0, height);
    }  
    gradientSize = 2 * PVector.sub(gradientCentre, gradientEnd).mag();
  }
  
  void display() {
    noStroke();
    background(darkest);
    for (int i = int(gradientSize); i >= 0; i--) {
      gradientProgress = map(i, 0, gradientSize, 0, 1);
      color currentColour = lerpColor(lightest, darkest, gradientProgress);
      fill(currentColour);
      ellipse(gradientCentre.x, gradientCentre.y, i, i);
    }
  }
}
