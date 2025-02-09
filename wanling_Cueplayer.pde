import processing.video.*;

int currentCue = 0;
Cue[] cues = {
  new CenterWordAndGrow(), 
  new CenterWordWithFixedSize(),
  new CenterWordAndGrow(),
  new BlackScreen(),
  new LetterAppearInDifferentLocations(),
  new PureVideo(this, "pointing.mov"),
  new IchiDance(this,"freeze.mov"),
  new FullScreenWordsScrolling(),
  new CenterWordAndGrow(), 
  new CenterWordWithFixedSize(),
  new PureVideo(this, "walk.mov"),
  new CenterWordAndGrow(),
  new BlackScreen(),
};

void setup() {
 //\\size  (1600,800);
  fullScreen();
  
  for (int i = 0; i < cues.length; i++) {
    cues[i].initialize();
  }
}
void draw() {
  cues[currentCue].display();
  if (mousePressed == false) {
    noCursor();
  } else {
    cursor();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      currentCue = (currentCue - 1) < 0 ? 0 : currentCue - 1;
    } else if (keyCode == DOWN) {
      currentCue = (currentCue + 1) >= cues.length ? cues.length - 1 : currentCue + 1;
    } 
  }
  cues[currentCue].onKeyPressed();
}
