import java.util.Arrays;
import controlP5.*;
import java.util.*;

public class MorseCode implements Cipher {
  
  public Character[] cha={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0','.',',','?','!','\'','\"','(',')','&',':',';','/','_','=','+','-','$','@'};
  public String[] morse={".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--..",".----","..---","...--","....-",".....","-....","--...","---..","----.","-----",".-.-.-","--..--","..--..","-.-.--",".----.",".-..-.","-.--.","-.--.-",".-...","---...","-.-.-.","-..-.","..--.-","-...-",".-.-.","-....-","...-..-",".--.-."};
  
  public Textlabel[] keyContent=new Textlabel[morse.length];
  public Textlabel inputContent;
  public Textlabel inputLabel;
  public Textlabel outputContent;
  public Textlabel outputLabel;
  public Textlabel keyLabel;
  public Textlabel[] textlabels={keyLabel, inputLabel, inputContent, outputLabel, outputContent};
  public ControlP5 cp5;
  
  public MorseCode(ControlP5 cp5){
    this.cp5=cp5;
    keyLabel =  cp5.addTextlabel("keyLabel");
    textlabels[0]=keyLabel;
    inputLabel=cp5.addTextlabel("inputLabel");
    textlabels[1]=inputLabel;
    outputLabel=cp5.addTextlabel("outputLabel");
    textlabels[2]=outputLabel;
    inputContent=cp5.addTextlabel("inputContent");
    textlabels[3]=inputContent;
    outputContent=cp5.addTextlabel("outputContent");
    textlabels[4]=outputContent;
  }
  
  public void showTextlabels(){
    keyLabel =  cp5.addTextlabel("keyLabel")
      .setValue("KEY")
      .setPosition(width/2-49+15, 30)
      .setColor(#FFFFFF)
      .setFont(createFont("arial", 30))
      ;
    for(int i=0;i<morse.length;i++){
      String value="";
      float xposition=150;
      float yposition=120;
      value+=cha[i]+":  "+morse[i];
      yposition+=i%6*60;
      xposition+=i/6*150;
      println("x: "+xposition+"  y: "+yposition);
      keyContent[i]=cp5.addTextlabel(cha[i]+"")
        .setValue(value)
        .setPosition(xposition,yposition)
        .setColor(#FFFFFF)
        .setFont(createFont("Georgia", 30))
        ;
    }
    inputLabel=cp5.addTextlabel("inputLabel")
      //.setValue("INPUT")
      //.setPosition(width/2-49+15, 15)
      .setColor(#FFFFFF)
      .setFont(createFont("arial", 30))
      ;
    outputLabel=cp5.addTextlabel("outputLabel")
      //.setValue("OUTPUT")
      //.setPosition(width/2-700+500+400, height/2-100-100+20)
      .setColor(#FFFFFF)
      .setFont(createFont("arial", 30))
      ;
    inputContent=cp5.addTextlabel("inputContent")
      .setColor(#FFFFFF)
      .setFont(createFont("Georgia", 20));
    outputContent=cp5.addTextlabel("OutputContent")
      .setColor(#FFFFFF)
      .setFont(createFont("Georgia", 20));
  }
  
  //String morseComparison(){
  //  String x="";
  //  for(int i=0;i<morse.length;i++){
  //    x+=cha[i]+":  "+morse[i]+"     ";
  //    if(i>0&&i%4==0){
  //      x+="\n";
  //    }
  //  }
  //  return x;
  //}
  
  String toString(){
    return "Morse Code";
  }
  
  public String encrypt(String s, ControlP5 cp5){
    String answer="";
    String x[]=new String[s.length()];
    for(int i=0;i<s.length();i++){
      x[i]="/";
      if(s.charAt(i)=='a'||s.charAt(i)=='A'){
        x[i]=".-";
      }
      if(s.charAt(i)=='b'||s.charAt(i)=='B'){
        x[i]="-...";
      }
      if(s.charAt(i)=='c'||s.charAt(i)=='C'){
        x[i]="-.-.";
      }
      if(s.charAt(i)=='d'||s.charAt(i)=='D'){
        x[i]="-..";
      }
      if(s.charAt(i)=='e'||s.charAt(i)=='E'){
        x[i]=".";
      }
      if(s.charAt(i)=='f'||s.charAt(i)=='F'){
        x[i]="..-.";
      }
      if(s.charAt(i)=='g'||s.charAt(i)=='G'){
        x[i]="--.";
      }
      if(s.charAt(i)=='h'||s.charAt(i)=='H'){
        x[i]="....";
      }
      if(s.charAt(i)=='i'||s.charAt(i)=='I'){
        x[i]="..";
      }
      if(s.charAt(i)=='j'||s.charAt(i)=='J'){
        x[i]=".---";
      }
      if(s.charAt(i)=='k'||s.charAt(i)=='K'){
        x[i]="-.-";
      }
      if(s.charAt(i)=='l'||s.charAt(i)=='L'){
        x[i]=".-..";
      }
      if(s.charAt(i)=='m'||s.charAt(i)=='M'){
        x[i]="--";
      }
      if(s.charAt(i)=='n'||s.charAt(i)=='N'){
        x[i]="-.";
      }
      if(s.charAt(i)=='o'||s.charAt(i)=='O'){
        x[i]="---";
      }
      if(s.charAt(i)=='p'||s.charAt(i)=='P'){
        x[i]=".--.";
      }
      if(s.charAt(i)=='q'||s.charAt(i)=='Q'){
        x[i]="--.-";
      }
      if(s.charAt(i)=='r'||s.charAt(i)=='R'){
        x[i]=".-.";
      }
      if(s.charAt(i)=='s'||s.charAt(i)=='S'){
        x[i]="...";
      }
      if(s.charAt(i)=='t'||s.charAt(i)=='T'){
        x[i]="-";
      }
      if(s.charAt(i)=='u'||s.charAt(i)=='U'){
        x[i]="..-";
      }
      if(s.charAt(i)=='v'||s.charAt(i)=='V'){
        x[i]="...-";
      }
      if(s.charAt(i)=='w'||s.charAt(i)=='W'){
        x[i]=".--";
      }
      if(s.charAt(i)=='x'||s.charAt(i)=='X'){
        x[i]="-..-";
      }
      if(s.charAt(i)=='y'||s.charAt(i)=='Y'){
        x[i]="-.--";
      }
      if(s.charAt(i)=='z'||s.charAt(i)=='Z'){
        x[i]="--..";
      }
      if(s.charAt(i)=='9'){
        x[i]="----.";
      }
      if(s.charAt(i)=='8'){
        x[i]="---..";
      }
      if(s.charAt(i)=='7'){
        x[i]="--...";
      }
      if(s.charAt(i)=='6'){
        x[i]="-....";
      }
      if(s.charAt(i)=='5'){
        x[i]=".....";
      }
      if(s.charAt(i)=='4'){
        x[i]="....-";
      }
      if(s.charAt(i)=='3'){
        x[i]="...--";
      }
      if(s.charAt(i)=='2'){
        x[i]="..---";
      }
      if(s.charAt(i)=='1'){
        x[i]=".----";
      }
      if(s.charAt(i)=='0'){
        x[i]="-----";
      }
      if(s.charAt(i)=='.'){
        x[i]=".-.-.-";
      }
      if(s.charAt(i)==','){
        x[i]="--..--";
      }
      if(s.charAt(i)=='?'){
        x[i]="..--..";
      }
      if(s.charAt(i)=='!'){
        x[i]="-.-.--";
      }
      if(s.charAt(i)=='\''){
        x[i]=".----.";
      }
      if(s.charAt(i)=='\"'){
        x[i]=".-..-.";
      }
      if(s.charAt(i)=='('){
        x[i]="-.--.";
      }
      if(s.charAt(i)==')'){
        x[i]="-.--.-";
      }
      if(s.charAt(i)=='&'){
        x[i]=".-...";
      }
      if(s.charAt(i)==':'){
        x[i]="---...";
      }
      if(s.charAt(i)==';'){
        x[i]="-.-.-.";
      }
      if(s.charAt(i)=='/'){
        x[i]="-..-.";
      }
      if(s.charAt(i)=='_'){
        x[i]="..--.-";
      }
      if(s.charAt(i)=='='){
        x[i]="-...-";
      }
      if(s.charAt(i)=='+'){
        x[i]=".-.-.";
      }
      if(s.charAt(i)=='-'){
        x[i]="-...-";
      }
      if(s.charAt(i)=='$'){
        x[i]="...-..-";
      }
      if(s.charAt(i)=='@'){
        x[i]=".--.-.";
      }
      answer+=x[i]+" ";
    }
    return answer.substring(0,answer.length()-1);
  }
  
  public String decrypt(String s, ControlP5 cp5){
    String answer="";
    String[] x=s.split(" ");
    System.out.println("s.split(\" \": "+ Arrays.toString(x));
    for(int i=0;i<x.length;i++){
      String a=" ";
      if(x[i].equals(".-")){
        a="a";
      }
      if(x[i].equals("-...")){
        a="b";
      }
      if(x[i].equals("-.-.")){
        a="c";
      }
      if(x[i].equals("-..")){
        a="d";
      }
      if(x[i].equals(".")){
        a="e";
      }
      if(x[i].equals("..-.")){
        a="f";
      }
      if(x[i].equals("--.")){
        a="g";
      }
      if(x[i].equals("....")){
        a="h";
      }
      if(x[i].equals("..")){
        a="i";
      }
      if(x[i].equals(".---")){
        a="j";
      }
      if(x[i].equals("-.-")){
        a="k";
      }
      if(x[i].equals(".-..")){
        a="l";
      }
      if(x[i].equals("--")){
        a="m";
      }
      if(x[i].equals("-.")){
        a="n";
      }
      if(x[i].equals("---")){
        a="o";
      }
      if(x[i].equals(".--.")){
        a="p";
      }
      if(x[i].equals("--.-")){
        a="q";
      }
      if(x[i].equals(".-.")){
        a="r";
      }
      if(x[i].equals("...")){
        a="s";
      }
      if(x[i].equals("-")){
        a="t";
      }
      if(x[i].equals("..-")){
        a="u";
      }
      if(x[i].equals("...-")){
        a="v";
      }
      if(x[i].equals(".--")){
        a="w";
      }
      if(x[i].equals("-..-")){
        a="x";
      }
      if(x[i].equals("-.--")){
        a="y";
      }
      if(x[i].equals("--..")){
        a="z";
      }
      if(x[i].equals("----.")){
        a="9";
      }
      if(x[i].equals("---..")){
        a="8";
      }
      if(x[i].equals("--...")){
        a="7";
      }
      if(x[i].equals("-....")){
        a="6";
      }
      if(x[i].equals(".....")){
        a="5";
      }
      if(x[i].equals("....-")){
        a="4";
      }
      if(x[i].equals("...--")){
        a="3";
      }
      if(x[i].equals("..---")){
        a="2";
      }
      if(x[i].equals(".----")){
        a="1";
      }
      if(x[i].equals("-----")){
        a="0";
      }
      if(x[i].equals(".-.-.-")){
        a=".";
      }
      if(x[i].equals("--..--")){
        a=",";
      }
      if(x[i].equals("..--..")){
        a="?";
      }
      if(x[i].equals("-.-.--")){
        a="!";
      }
      if(x[i].equals(".----.")){
        a="\'";
      }
      if(x[i].equals(".-..-.")){
        a="\"";
      }
      if(x[i].equals("-.--.")){
        a="(";
      }
      if(x[i].equals("-.--.-")){
        a=")";
      }
      if(x[i].equals(".-...")){
        a="&";
      }
      if(x[i].equals("---...")){
        a=":";
      }
      if(x[i].equals("-.-.-.")){
        a=";";
      }
      if(x[i].equals("-..-.")){
        a="/";
      }
      if(x[i].equals("..--.-")){
        a="_";
      }
      if(x[i].equals("-...-")){
        a="=";
      }
      if(x[i].equals(".-.-.")){
        a="+";
      }
      if(x[i].equals("-...-")){
        a="-";
      }
      if(x[i].equals("...-..-")){
        a="$";
      }
      if(x[i].equals(".--.-.")){
        a="@";
      }
      answer+=a;
    }
    return answer;
  }
  
  public void emptyTextlabels(){
    if(textlabels.length>0){
      for(int i=0;i<textlabels.length;i++){
        textlabels[i].setValue("");
      }
    }
  }
  
  public String textlabelsToString(){
    return Arrays.toString(textlabels);
  }
  
}
