interface Cue {
  void display();
  void onKeyPressed();
  void initialize();
}

class CenterWordAndGrow implements Cue {
  float myTextSize = 40;
  
  void initialize() {
  }
  

  void display() {
    background(0);
    if (keyPressed) {
      if (key == '1') {
        textSize(myTextSize);
        textAlign(CENTER);
        text("Politeia", width/2, height/2);
      } else if (key == '2'){
        textSize(myTextSize);
        textAlign(CENTER);
        text("the hard-to-get", width/2, height/2);
        text("Philia", width/2, height/2 + myTextSize);
      } else if (key == '3'){
        textSize(myTextSize);
        textAlign(CENTER);
        text("My hand", width/2, height/2);
      } else if (key == '4'){
        textSize(myTextSize);
        textAlign(CENTER);
        text("Techne Politeia", width/2, height/2);
      }
        myTextSize += 10;
        if (myTextSize >= 100) {
          myTextSize = 100;
        }
    } else {
      myTextSize = 12;
    }
  }
  
  void onKeyPressed() {
    
  }
}




class CenterWordWithFixedSize implements Cue {
  String [] words;
  int index = 0;
  
  CenterWordWithFixedSize() {
    
  }
  
  void initialize() {
    String [] lines = loadStrings("test.txt");
    String entirePlayString = join(lines, " ");
    println (entirePlayString);
    words = split(entirePlayString, " ");
    frameRate(15);
  }

  
  void display() {    
    if (!keyPressed) {
      background(0);
      fill(random(255));
      textSize(random(12,100));
      textAlign(CENTER);
      text(words[index], width/2, height/2);
      index = (index + 1) % words.length;
    } else {
      background(0);
      int textSize = 100;
      fill(255);
      textSize(textSize);
      textAlign(CENTER);
     
      if (key == 'a') {
        text("How far from us are the sun", width/2, height/2);
      } else if(key == 's') {
        text("Alithea and you", width/2, height/2);
      } else if(key == 'd') {
        text("If you don't see her and", width/2, height/2);
        text("me/us", width/2, height/2 + textSize);
      } else if(key == 'f') {
        text("me/us", width/2, height/2);
        text("her/us", width/2, height/2 + textSize);
      } else if (key == 'g') {
        text("Politiea", width/2, height/2);
      } else if (key == 'h') {
        text("You're begin Athens", width/2, height/2);
        text("again in a new land", width/2, height/2 + textSize);
      } else if (key == 'j') {
        text("on a clear horizon", width/2, height/2);
      } else if (key == 'z') {
        text("You've been formed", width/2, height/2);
        text("inside us", width/2, height/2 + textSize);
      } else if (key == 'x') {
        text ("like we are the Fetus", width/2, height/2);
        text("in your womb", width/2, height/2 + textSize);
      } else if (key == 'c') {
        text ("Politeia", width/2, height/2);
      }
    }
  }
  
  void onKeyPressed() {
  }
  
}



class BlackScreen implements Cue {
  
    void display() {
      background(0);
    }
    
    void initialize() {
    }
    
    void onKeyPressed() {
    }
   
}


class LetterAppearInDifferentLocations implements Cue {
    int count = 0;
    int every = 30;
    String [] words;
    int index = 0;
    
    void initialize() {
      String [] lines = loadStrings("Letter appear in different locations.txt");
      printArray (lines);
      words = lines;
      frameRate(80);
    }
    
    void display() {
      if (count % every == 0) {
        float posX;
        float posY;
        posX = random(width);
        posY = random(height);
        
        if (posX > width/2){
          textAlign(RIGHT);
        } else {
          textAlign(LEFT);
        }
        
        fill(255);
        textSize(64);
        text(words[index], posX,posY);
        index = (index + 1) % words.length;
        every--;
        if (every == 0) {
          every = 1;
        }
      }
      count++;
    }  

    void onKeyPressed() {}
    
}


class PureVideo implements Cue {
  
  String filename;
  Movie movie;
  PApplet sketch;
  
  PureVideo(PApplet sketch, String filename) {
    this.sketch = sketch;
    this.filename = filename;
  }
  
  
  void initialize() {
    movie = new Movie(sketch, filename);
    // movie.loop();
  }
  
  void display() {
    
    movie.play();
    if (movie.available()) {
     movie.read();
    }
    image(movie, 0, 0);
  }

  void onKeyPressed() {
  }
  
}


class IchiDance implements Cue {
  
    String filename;
    Movie movie;
    PApplet sketch;
    IchiDance(PApplet sketch, String filename) {
    this.sketch = sketch;
    this.filename = filename;
    }
    
    int movieScale = 5;
    int cols, rows;
    int xStep, yStep;


  
  void initialize() {

     calcScale();
     movie = new Movie(sketch, filename);
     movie.loop();
  }
  
  
  void display() {
   
    background(0);
    //float mt = movie.time();
    //if(mt > md/1.0) {
      // line(0 , 0, width, height);
   // }  
    if (movie.available()) {
      movie.read();
    }
      if (movie.pixels.length > 0) {
        for (int i = 0; i < cols; i++) {
          // Begin loop for rows
          for (int j = 0; j < rows; j++) {
            // Where are we, pixel-wise?
            int x = i * movieScale;
            int y = j * movieScale;
            
            int loc = x + y * movie.width;
                
            color c = movie.pixels[loc];
            
            float sz = (brightness(c)/255) * movieScale; 
            rectMode(CENTER);
            fill(255);
            noStroke();
            rect(x + movieScale/2, y + movieScale/2, sz, sz);
       }
    }
  }
  }

  void onKeyPressed() {
    if (key == '1') {
      movieScale = 5;
      calcScale();
    } else if (key == '2') {
      movieScale = 10;
      calcScale();
    } else if (key == '3') {
      movieScale = 15;
      calcScale();
    } else if (key == '4') {
      movieScale = 25;
      calcScale();
    }
  }
  
  void calcScale() {
    
    cols = width / movieScale;
    xStep = width / cols;
    rows = height / movieScale;
    yStep = width / cols;
  }
}


class FullScreenWordsScrolling implements Cue {
  
    String [] words;
    int index = 0;
    Boolean part1 = false;
  
   void initialize() {
    String [] lines = loadStrings("FullScreen.txt");
    String entirePlayString = join(lines, " ");
    println (entirePlayString);
    words = split(entirePlayString, "!?/',.");
    frameRate(20);
   }
   
   void display() {
     background (0);
     
      if (part1) {
        centerJumpyWords();
      } else {
        index = 0;
        var charIndex = 0;
        background(0);
        stroke(255);
        float stepSizeX = 20.0;
        float gridStepsX = width / stepSizeX;
        
        float stepSizeY = 20.0;
        float gridStepsY = height / stepSizeY;
        
        for (int i = 0; i < gridStepsX; i++) {
          strokeWeight(1);
          float offset = 5;
          float xPos = offset + i * stepSizeX;
          float startY = 20;
          
          ellipseMode(CENTER);
          fill(255);
          for (int j = 0; j < gridStepsY; j++) {
             var yPos = startY + j * stepSizeY;
             
             fill(random(20, 255));
             textSize(20);
             textAlign(BOTTOM);
             while (words[index].length() == 0) {
               incrementIndex();
             }
             text(words[index].charAt(charIndex), xPos, yPos);
             charIndex++;
            
             if (charIndex >= words[index].length()) {
              
               charIndex = 0;
               incrementIndex();
             }
          }
        }
      }
    }

   void incrementIndex() {
     index = (index + 1) % words.length;
  }
   
   void onKeyPressed() {
     if (!keyPressed) {
      background(0);
      fill(random(255));
      textSize(random(12,64));
      textAlign(CENTER);
      text(words[index], width/2, height/2);
      incrementIndex();
     } else {
      background(0);
      fill(255);
      textSize(64);
      textAlign(CENTER);
       if (key == 'a') {
        text("Politea", width/2, height/2);
      } else if(key == 's') {
        text("How far from us are the sun", width/2, height/2);
      } else if(key == 'd') {
        text("Alithea and you", width/2, height/2);
      }
    } 
  }
  
  void centerJumpyWords() {
  }
}
 

  
