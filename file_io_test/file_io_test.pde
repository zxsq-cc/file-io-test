int curCharNo = 0;
int curChar;
int commaCount = 0;
int semiCount = 0;
String[] plotLines;
int plotByteLoop = 0;

void Setup(){
   selectInput("Select hpgl file to plot:", "plotfile"); 
}

void plotfile(File selection){
  //############file selection handling
  if(selection == null){
    println("Window closed or cancelled");
  }else{
    println("File: "+ selection.getAbsolutePath()); 
  }
  //############file read
  plotLines = loadStrings(selection.getAbsolutePath());
  println("Loading file into string");
  for(int i = 0; i<plotLines.length; i++){
    print(plotLines[i]);
  }
  //############file parse and send to plotter
  while(curCharNo <= plotLines.length){
     if(plotLines[curCharNo].equals(";")){
       delay(5000);
       curCharNo++;
       plotByteLoop = 0;
     }else if( plotByteLoop < 255){
       //plotPort.write(plotLines[curCharNo]);
       print(plotLines[curCharNo]);
       curCharNo++;
       plotByteLoop++;
     }else if(plotByteLoop >= 255){
       delay(5000);
       plotByteLoop = 0;
     }else{
      println("FILE PARSE/IO ERROR");
      break;
     }
  }
}
