class Flower {
  ArrayList<Petal> petals = new ArrayList<Petal>();
  ArrayList<Stamen> stamens = new ArrayList<Stamen>();
  PVector position;
  float size;
  float centreSize;
  int totalPetals = 5;
  int totalStamens = 15;
  color centreLightestA = color(206, 181, 120);
  color centreLightestB = color(189, 181, 136);
  color centreDarkestA = color(60, 58, 25);
  color centreDarkestB = color(120, 84, 30);
  
  Flower(PVector _position, float _size) {
    position = _position;
    size = _size;
  }
  
  void display() {
    drawCentre();
    drawPetals();
    drawStamens();
  }
  
  void drawCentre() {
    noStroke();
    fill(199, 191, 126);
    ellipse(position.x, position.y, size, size);
    
    float centreGradientProgress;
    centreSize = size * (0.75 + random(0.2));
    color centreLightest = lerpColor(centreLightestA, centreLightestB, random(1));
    color centreDarkest = lerpColor(centreDarkestA, centreDarkestB, random(1));
    for (int i = int(centreSize); i >= 0; i--) {
      centreGradientProgress = map(i, 0, centreSize, 0, 1);
      color centreColour = lerpColor(centreDarkest, centreLightest, centreGradientProgress);
      fill(centreColour, 155 + random(100));
      ellipse(position.x, position.y, i, i);
    }
  }
  
  void drawPetals() {
    pushMatrix();
    translate(position.x, position.y);
    for (int i = 0; i < totalPetals; i++) {
      float petalRotation = i * TWO_PI/totalPetals;
      float petalDistance = centreSize * (1.9 + random(0.2));
      pushMatrix();
        Petal petal = new Petal(centreSize, petalRotation, petalDistance);
        petals.add(petal);
      popMatrix();
    }
    for (Petal petal : petals) {
      petal.display();
    }
    popMatrix();
  }
  
  void drawStamens() {
    pushMatrix();
    translate(position.x, position.y);
    for (int i = 0; i < totalStamens; i++) {
      float stamenRotation = i * TWO_PI/totalStamens;
      float stamenDistance = centreSize * (0.7 + random(0.7));
      pushMatrix();
        Stamen stamen = new Stamen(centreSize, stamenRotation, stamenDistance);
        stamens.add(stamen);
      popMatrix();
    }
    for (Stamen stamen : stamens) {
      stamen.display();
    }
    popMatrix();
  }
}
