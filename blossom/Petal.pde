class Petal {
  float centreSize;
  int gradientSize;
  float rotation;
  float distanceFromCentre;
  float elongation;
  ArrayList<PVector> petalPoints = new ArrayList<PVector>();
  int petalPointsTotal = 5;
  color lightest = color(255, 255, 248);
  color darkest = color(207, 203, 191);
  
  Petal(float _size, float _rotation, float _distanceFromCentre) {
    centreSize = _size;
    rotation = _rotation;
    distanceFromCentre = _distanceFromCentre;
    elongation = 1.05 + random(0.2);
  }
  
  void display() {
    pushMatrix();
    rotate(rotation);
    translate(0, -distanceFromCentre);
    PGraphics gradient = makeGradient();
    PGraphics petal = makePetal();
    gradient.mask(petal);
    image(gradient, 0, 0);
    popMatrix();
  }
  
  PGraphics makePetal() {
    PGraphics petal;
    petalPoints = getPetalPoints();
    petal = createGraphics(gradientSize, gradientSize);
    petal.beginDraw();
    petal.noStroke();
    petal.fill(240);
    petal.background(0);
    petal.beginShape();
    for (PVector petalPoint : petalPoints) {
      petal.curveVertex(petalPoint.x, petalPoint.y);
    }
    petal.endShape();
    petal.endDraw();
    return petal;
  }
  
  ArrayList<PVector> getPetalPoints() {
    PVector centrePoint = new PVector(1.75 * centreSize, 1.75 * centreSize);
    for (int i = 0; i < petalPointsTotal; i++) {
      float angle = i * TWO_PI / petalPointsTotal;
      float petalRadius = lerp(0.9 * centreSize, 1.25 * centreSize, random(1));
      PVector point = new PVector(petalRadius * sin(angle), petalRadius * cos(angle));
      point.add(centrePoint.x, centrePoint.y);
      point.x *= elongation;
      petalPoints.add(point);
    }
    petalPoints.add(petalPoints.get(0));
    petalPoints.add(petalPoints.get(1));
    petalPoints.add(petalPoints.get(2));
    return petalPoints;
  }

  PGraphics makeGradient() {
    PGraphics gradient;
    PVector gradientCentre = new PVector(1.25 * centreSize + random(centreSize), 1.25 * centreSize/2 + random(centreSize));
    gradientSize = 7 * int(centreSize);
    gradient = createGraphics(gradientSize, gradientSize);
    gradient.beginDraw();
    gradient.noStroke();
    gradient.background(0);
    for (int i = int(gradientSize); i >= 0; i--) {
      float gradientProgress = map(i, 0, gradientSize, 0, 1);
      color fillColour = lerpColor(lightest, darkest, gradientProgress);
      gradient.fill(fillColour);
      gradient.ellipse(gradientCentre.x, gradientCentre.y, i, i);
    }
    gradient.endDraw();
    return gradient;
  }
}
