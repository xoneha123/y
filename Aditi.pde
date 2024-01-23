String[] words = {"country", "picture", "careful", "english", "improve", "walking", "stomach", "climate", "problem",
  "harmful", "rainbow", "kitchen", "parking", "journey", "friends", "quickly", "dialect", "rafting", "magnets", "objects", "panther"};
//array of possible words
int wrong = 7;
PImage niallhoran;
PImage music;
String letter;
int wordqwerty;
String word;
String guess = "_______";
String wrongGuess = "";
int screens = -1;
int hangpoint = 0;
int gamescreen = 2;

void setup() {
  size(900, 800);
  //choose random word from list
  wordqwerty = floor(random(words.length));
  word = words[wordqwerty];
  niallhoran = loadImage("niallhoran.png");
  music = loadImage("music.png");
}
void draw() {
  if (gamescreen == 2) {
    //shows the rules of the game
    if (screens == -1) {
      background(0);
      textSize(60);
      fill(255);
      text("Rules:", 100, 100);
      textSize(35);
      text("-Try to guess the word by pressing letters", 80, 200);
      text("  on your keyboard, the blanks will give", 80, 235);
      text("  you hints for where the letters are", 80, 270);
      text("-Guess the word before the number of", 80, 330);
      text("  wrong guesses run out", 80, 365);
      text("-Save Niall Horan", 80, 425);
      Button(100, 550, "Play");
      image(niallhoran, 400, 400, 100, 100);
      textSize(20);
      fill(255);
      text("Points: "+hangpoint, 590, 40);
      Button(400, 550, "Exit game");
    }
    if (screens == 1) {
      background(0);
      //text(word, 100, 450);
      //pole thing that the person hangs on
      rect(250, 50, 10, 25);
      rect(150, 50, 10, 250);
      rect(50, 300, 210, 10);
      rect(150, 50, 100, 10);
      fill(255);
      textSize(50);
      strokeWeight(2);
      //shows the letters in the word as you guess letters
      text(guess, 100, 550);
      text(wrongGuess, 100, 650);
      textSize(20);
      fill(255);
      text("Points: "+hangpoint, 590, 40);
      image(music, 400, 400, 250, 200);
      if (wrong>0) {
        textSize(35);
        //makes the parts of the body show as you get more and more wrong guesses
        text("Wrong Guesses Left :"+wrong, 350, 200);
        if (wrong == 6) {
          image(niallhoran, 220, 70, 70, 70); //head
        } else if (wrong == 5) {
          rect(255, 130, 10, 60);//body
          image(niallhoran, 220, 70, 70, 70); //head
        } else if (wrong == 4) {
          rect(265, 150, 25, 10);//arm1
          rect(255, 130, 10, 60);//body
          image(niallhoran, 220, 70, 70, 70); //head
        } else if (wrong == 3) {
          rect(265, 150, 25, 10);//arm1
          rect(230, 150, 25, 10);//arm2
          rect(255, 130, 10, 60);//body
          image(niallhoran, 220, 70, 70, 70); //head
        } else if (wrong == 2) {
          rect(265, 150, 25, 10);//arm1
          rect(230, 150, 25, 10);//arm2
          rect(250, 190, 20, 10);//pelvis
          rect(245, 190, 10, 60);//leg2
          rect(255, 130, 10, 60);//body
          image(niallhoran, 220, 70, 70, 70); //head
        } else if (wrong == 1) {
          rect(265, 150, 25, 10);//arm1
          rect(230, 150, 25, 10);//arm2
          rect(250, 190, 20, 10);//pelvis
          rect(245, 190, 10, 60);//leg2
          rect(265, 190, 10, 60);//leg1
          rect(255, 130, 10, 60);//body
          image(niallhoran, 220, 70, 70, 70); //head
        }
      }
      //if the guess is the same as the word, it will show that you won
      if (guess.equals(word)) {
        screens = 2;
        hangpoint = hangpoint+1;
      }
      //when there are no wrong guesses left, it will show that you lost
      if (wrong == 0) {
        screens = 3;
      }
    }
    if (screens == 2) {
      //win screens
      background(0);
      fill(255);
      textSize(50);
      strokeWeight(2);
      text("You Win!!", 200, 200);
      text("Good Job!!", 200, 300);
      //goes back to home screens
      Button(100, 550, "Home");
      Button(400, 550, "Exit game");
      textSize(20);
      fill(255);
      text("Points: "+hangpoint, 590, 40);
    } else if (screens == 3) {
      // lose screens
      background(0);
      fill(255);
      textSize(50);
      strokeWeight(2);
      text("You Lost", 200, 200);
      text("Better Luck Next Time", 150, 300);
      text("The word was: "+word, 150, 400);
      //goes back to home screens
      Button(100, 550, "Try Again");
      Button(400, 550, "Exit game");
      textSize(20);
      fill(255);
      text("Points: "+hangpoint, 590, 40);
    }
  }
}
void keyPressed() {
  check(key + "");
}

void check(String c) {
  //checks if word has the letter pressed in it
  if (word.contains(c)) {
    int index = word.indexOf(c);
    if (index >= 0)
      // to check if guess and answer are same
      guess = guess.substring(0, index) + c + guess.substring(index+1, word.length());
  } else {
    if (! wrongGuess.contains(c)) {
      //checks if the letter has been pressed before
      wrongGuess += c;
      wrong--;
    } else {
      println("This letter has been pressed");
    }
  }
}

void mousePressed() {
  if ((screens == -1) ||(screens == 2) || (screens == 3)) {
    if (mouseX > 100 && mouseX < 250 && mouseY > 550 && mouseY < 700) {
      //returns to the instruction screens
      screens = -1;
      wordqwerty = floor(random(words.length));
      word = words[wordqwerty];
      guess = "_______";
      wrongGuess = "";
      wrong = 7;
    }
    if (mouseX > 400 && mouseX < 550 && mouseY > 550 && mouseY < 700) {
      exit();
    }
  }
  if (screens == -1) {
    if (mouseX > 100 && mouseX < 250 && mouseY > 550 && mouseY < 700) {
      //returns to the instruction screens
      screens = 1;
      wordqwerty = floor(random(words.length));
      word = words[wordqwerty];
      guess = "_______";
      wrongGuess = "";
      wrong = 7;
    }
  }
}
void Button(int x, int y, String title) {
  if (mouseX > x && mouseX < x + 150 && mouseY > y && mouseY < y + 50) {
    fill(255, 0, 0);
  } else fill(0, 255, 0);
  rect(x, y, 150, 50);
  textSize(30);
  fill(0);
  text(title, x + 75 - textWidth(title)/2, y + 40);
}
