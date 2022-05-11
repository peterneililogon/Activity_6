//peter neil ilogon

import 'dart:io';

class Customer { //For customer details only
  String name = " ";
  String add = " ";

  aCustomer() {
    print("Full Name: ");
    name = stdin.readLineSync()!;
    print("Address: ");
    add = stdin.readLineSync()!;
  }
}

class Books { //All actions for the books
  String title = " ";
  String author = " ";
  var genre = " ";

  bool available = true;

  List lgenre = ["Computer Science", "Philosopy", "Pure Science", "Art and Recreation", "History"];

  aBook() { //asking for details to add books
    print("Title: ");
    title = stdin.readLineSync()!;
    print("Author: ");
    author = stdin.readLineSync()!;
    do {
      print(
          "Genre: Computer Science | Philosopy | Pure Science | Art and Recreation | History");
      genre = stdin.readLineSync()!;
    } while (!lgenre.contains(genre));
  }
    display() { //display all added books and availability
      print(title + " | " + author + " | " + genre);
      if (available == true) {
        stdout.write(" | Available");
      }
    }
  }
//public declarations of variables and Growable List
var cusinfo = new Map();
List uname = [];
var bookinfo = new Map();
List isbn = [];
int cbook = 0;

//main body
void main(){
  DateTime now =  new DateTime.now(); //declared to print current time
  menu();
  int opt = 0;
  do {
  print("Option: ");
  opt = int.parse(stdin.readLineSync()!);
  switch(opt){
    case 1: { //Option to call functions to add books
      var misbn = " ";
      print("ISBN: ");
      misbn = stdin.readLineSync()!;
      isbn.add(misbn);
      Books x = new Books();
      x.aBook();
      bookinfo[misbn] = x;
      cbook++;
    }break;
    case 2: //Option to display added books
      print("--List of Books--");
      for(int i = 0; i < cbook; i++){
        print(isbn[i]);
        bookinfo[isbn[i]].display();
      }break;
    case 3:{ //Option to view available books
      print("--Available Books--");
      for(int i = 0; i < cbook; i++){
        if(bookinfo[isbn[i]].available == true){
          bookinfo[isbn[i]].display();
        }
      }
    }break;
    case 4:{ //Option to lend books and ask for customer details
      var temp = " ";//customer details
      print("Enter Username: ");
      temp = stdin.readLineSync()!;
      uname.add(temp);
      Customer z = new Customer();
      z.aCustomer();
      cusinfo[temp] = z;

      var aisbn = " ";
      print("ISBN: "); //book info to borrow
      aisbn = stdin.readLineSync()!;
      if(!isbn.contains(aisbn)){
        print("Number not recognized");
      }else{
        stdout.write(now);
        stdout.write(" Borrowed by ");
        stdout.write(temp);
        print(" ");
      }
    }break;
    default:{
      exit(0);
    }
  }
  }while (opt != 9);
}


void menu(){
  print("'1' Add | '2' Show Books | '3' Availability | '4' Lend"); //menu display
}
