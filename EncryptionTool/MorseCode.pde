import java.util.Arrays;
import controlP5.*;
import java.util.*;

public class MorseCode implements Cipher {
  
  public Character[] cha={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0','.',',','?','!','\'','\"','(',')','&',':',';','/','_','=','+','-','$','@'};
  public String[] morse={".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--..",".----","..---","...--","....-",".....","-....","--...","---..","----.","-----",".-.-.-","--..--","..--..","-.-.--",".----.",".-..-.","-.--.","-.--.-",".-...","---...","-.-.-.","-..-.","..--.-","-...-",".-.-.","-....-","...-..-",".--.-."};
  
  public ControlP5 cp5;
  
  public MorseCode(ControlP5 cp5){
    this.cp5=cp5;
    elements=new ArrayList<Textlabel>();
    elements.add(cp5.addTextlabel("MCkeyLabel"));
  }
  
  public void showElements(){
    for(int i=0;i<elements.size();i++){
      elements.get(i).setValue("");
    }
    elements=new ArrayList<Textlabel>();
    elements.add(cp5.addTextlabel("MCkeyLabel"));
    elements.get(0)
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
      //println("x: "+xposition+"  y: "+yposition);
      elements.add(cp5.addTextlabel(cha[i]+""));
      elements.get(i+1)
        .setValue(value)
        .setPosition(xposition,yposition)
        .setColor(#FFFFFF)
        .setFont(createFont("Georgia", 30))
        ;
    }
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
        elements.get(1).setColor(#03FF22);
        x[i]=".-";
      }
      if(s.charAt(i)=='b'||s.charAt(i)=='B'){
        elements.get(2).setColor(#03FF22);
        x[i]="-...";
      }
      if(s.charAt(i)=='c'||s.charAt(i)=='C'){
        elements.get(3).setColor(#03FF22);
        x[i]="-.-.";
      }
      if(s.charAt(i)=='d'||s.charAt(i)=='D'){
        elements.get(4).setColor(#03FF22);
        x[i]="-..";
      }
      if(s.charAt(i)=='e'||s.charAt(i)=='E'){
        elements.get(5).setColor(#03FF22);
        x[i]=".";
      }
      if(s.charAt(i)=='f'||s.charAt(i)=='F'){
        elements.get(6).setColor(#03FF22);
        x[i]="..-.";
      }
      if(s.charAt(i)=='g'||s.charAt(i)=='G'){
        elements.get(7).setColor(#03FF22);
        x[i]="--.";
      }
      if(s.charAt(i)=='h'||s.charAt(i)=='H'){
        elements.get(8).setColor(#03FF22);
        x[i]="....";
      }
      if(s.charAt(i)=='i'||s.charAt(i)=='I'){
        elements.get(9).setColor(#03FF22);
        x[i]="..";
      }
      if(s.charAt(i)=='j'||s.charAt(i)=='J'){
        elements.get(10).setColor(#03FF22);
        x[i]=".---";
      }
      if(s.charAt(i)=='k'||s.charAt(i)=='K'){
        elements.get(11).setColor(#03FF22);
        x[i]="-.-";
      }
      if(s.charAt(i)=='l'||s.charAt(i)=='L'){
        elements.get(12).setColor(#03FF22);
        x[i]=".-..";
      }
      if(s.charAt(i)=='m'||s.charAt(i)=='M'){
        elements.get(13).setColor(#03FF22);
        x[i]="--";
      }
      if(s.charAt(i)=='n'||s.charAt(i)=='N'){
        elements.get(14).setColor(#03FF22);
        x[i]="-.";
      }
      if(s.charAt(i)=='o'||s.charAt(i)=='O'){
        elements.get(15).setColor(#03FF22);
        x[i]="---";
      }
      if(s.charAt(i)=='p'||s.charAt(i)=='P'){
        elements.get(16).setColor(#03FF22);
        x[i]=".--.";
      }
      if(s.charAt(i)=='q'||s.charAt(i)=='Q'){
        elements.get(17).setColor(#03FF22);
        x[i]="--.-";
      }
      if(s.charAt(i)=='r'||s.charAt(i)=='R'){
        elements.get(18).setColor(#03FF22);
        x[i]=".-.";
      }
      if(s.charAt(i)=='s'||s.charAt(i)=='S'){
        elements.get(19).setColor(#03FF22);
        x[i]="...";
      }
      if(s.charAt(i)=='t'||s.charAt(i)=='T'){
        elements.get(20).setColor(#03FF22);
        x[i]="-";
    }
      if(s.charAt(i)=='u'||s.charAt(i)=='U'){
        elements.get(21).setColor(#03FF22);
        x[i]="..-";
      }
      if(s.charAt(i)=='v'||s.charAt(i)=='V'){
        elements.get(22).setColor(#03FF22);
        x[i]="...-";
      }
      if(s.charAt(i)=='w'||s.charAt(i)=='W'){
        elements.get(23).setColor(#03FF22);
        x[i]=".--";
      }
      if(s.charAt(i)=='x'||s.charAt(i)=='X'){
        elements.get(24).setColor(#03FF22);
        x[i]="-..-";
      }
      if(s.charAt(i)=='y'||s.charAt(i)=='Y'){
        elements.get(25).setColor(#03FF22);
        x[i]="-.--";
      }
      if(s.charAt(i)=='z'||s.charAt(i)=='Z'){
        elements.get(26).setColor(#03FF22);
        x[i]="--..";
      }
      if(s.charAt(i)=='9'){
        elements.get(35).setColor(#03FF22);
        x[i]="----.";
      }
      if(s.charAt(i)=='8'){
        elements.get(34).setColor(#03FF22);
        x[i]="---..";
      }
      if(s.charAt(i)=='7'){
        elements.get(33).setColor(#03FF22);
        x[i]="--...";
      }
      if(s.charAt(i)=='6'){
        elements.get(32).setColor(#03FF22);
        x[i]="-....";
      }
      if(s.charAt(i)=='5'){
        elements.get(31).setColor(#03FF22);
        x[i]=".....";
      }
      if(s.charAt(i)=='4'){
        elements.get(30).setColor(#03FF22);
        x[i]="....-";
      }
      if(s.charAt(i)=='3'){
        elements.get(29).setColor(#03FF22);
        x[i]="...--";
      }
      if(s.charAt(i)=='2'){
        elements.get(28).setColor(#03FF22);
        x[i]="..---";
      }
      if(s.charAt(i)=='1'){
        elements.get(27).setColor(#03FF22);
        x[i]=".----";
      }
      if(s.charAt(i)=='0'){
        elements.get(36).setColor(#03FF22);
        x[i]="-----";
      }
      if(s.charAt(i)=='.'){
        elements.get(37).setColor(#03FF22);
        x[i]=".-.-.-";
      }
      if(s.charAt(i)==','){
        elements.get(38).setColor(#03FF22);
        x[i]="--..--";
      }
      if(s.charAt(i)=='?'){
        elements.get(39).setColor(#03FF22);
        x[i]="..--..";
      }
      if(s.charAt(i)=='!'){
        elements.get(40).setColor(#03FF22);
        x[i]="-.-.--";
      }
      if(s.charAt(i)=='\''){
        elements.get(41).setColor(#03FF22);
        x[i]=".----.";
      }
      if(s.charAt(i)=='\"'){
        elements.get(42).setColor(#03FF22);
        x[i]=".-..-.";
      }
      if(s.charAt(i)=='('){
        elements.get(43).setColor(#03FF22);
        x[i]="-.--.";
      }
      if(s.charAt(i)==')'){
        elements.get(44).setColor(#03FF22);
        x[i]="-.--.-";
      }
      if(s.charAt(i)=='&'){
        elements.get(45).setColor(#03FF22);
        x[i]=".-...";
      }
      if(s.charAt(i)==':'){
        elements.get(46).setColor(#03FF22);
        x[i]="---...";
      }
      if(s.charAt(i)==';'){
        elements.get(47).setColor(#03FF22);
        x[i]="-.-.-.";
      }
      if(s.charAt(i)=='/'){
        elements.get(48).setColor(#03FF22);
        x[i]="-..-.";
      }
      if(s.charAt(i)=='_'){
        elements.get(49).setColor(#03FF22);
        x[i]="..--.-";
      }
      if(s.charAt(i)=='='){
        elements.get(50).setColor(#03FF22);
        x[i]="-...-";
      }
      if(s.charAt(i)=='+'){
        elements.get(51).setColor(#03FF22);
        x[i]=".-.-.";
      }
      if(s.charAt(i)=='-'){
        elements.get(52).setColor(#03FF22);
        x[i]="-...-";
      }
      if(s.charAt(i)=='$'){
        elements.get(53).setColor(#03FF22);
        x[i]="...-..-";
      }
      if(s.charAt(i)=='@'){
        elements.get(54).setColor(#03FF22);
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
        elements.get(1).setColor(#03FF22);
        a="a";
      }
      if(x[i].equals("-...")){
        elements.get(2).setColor(#03FF22);
        a="b";
      }
      if(x[i].equals("-.-.")){
        elements.get(3).setColor(#03FF22);
        a="c";
      }
      if(x[i].equals("-..")){
        elements.get(4).setColor(#03FF22);
        a="d";
      }
      if(x[i].equals(".")){
        elements.get(5).setColor(#03FF22);
        a="e";
      }
      if(x[i].equals("..-.")){
        elements.get(6).setColor(#03FF22);
        a="f";
      }
      if(x[i].equals("--.")){
        elements.get(7).setColor(#03FF22);
        a="g";
      }
      if(x[i].equals("....")){
        elements.get(8).setColor(#03FF22);
        a="h";
      }
      if(x[i].equals("..")){
        elements.get(9).setColor(#03FF22);
        a="i";
      }
      if(x[i].equals(".---")){
        elements.get(10).setColor(#03FF22);
        a="j";
      }
      if(x[i].equals("-.-")){
        elements.get(11).setColor(#03FF22);
        a="k";
      }
      if(x[i].equals(".-..")){
        elements.get(12).setColor(#03FF22);
        a="l";
      }
      if(x[i].equals("--")){
        elements.get(13).setColor(#03FF22);
        a="m";
      }
      if(x[i].equals("-.")){
        elements.get(14).setColor(#03FF22);
        a="n";
      }
      if(x[i].equals("---")){
        elements.get(15).setColor(#03FF22);
        a="o";
      }
      if(x[i].equals(".--.")){
        elements.get(16).setColor(#03FF22);
        a="p";
      }
      if(x[i].equals("--.-")){
        elements.get(17).setColor(#03FF22);
        a="q";
      }
      if(x[i].equals(".-.")){
        elements.get(18).setColor(#03FF22);
        a="r";
      }
      if(x[i].equals("...")){
        elements.get(19).setColor(#03FF22);
        a="s";
      }
      if(x[i].equals("-")){
        elements.get(20).setColor(#03FF22);
        a="t";
      }
      if(x[i].equals("..-")){
        elements.get(21).setColor(#03FF22);
        a="u";
      }
      if(x[i].equals("...-")){
        elements.get(22).setColor(#03FF22);
        a="v";
      }
      if(x[i].equals(".--")){
        elements.get(23).setColor(#03FF22);
        a="w";
      }
      if(x[i].equals("-..-")){
        elements.get(24).setColor(#03FF22);
        a="x";
      }
      if(x[i].equals("-.--")){
        elements.get(25).setColor(#03FF22);
        a="y";
      }
      if(x[i].equals("--..")){
        elements.get(26).setColor(#03FF22);
        a="z";
      }
      if(x[i].equals("----.")){
        elements.get(35).setColor(#03FF22);
        a="9";
      }
      if(x[i].equals("---..")){
        elements.get(34).setColor(#03FF22);
        a="8";
      }
      if(x[i].equals("--...")){
        elements.get(33).setColor(#03FF22);
        a="7";
      }
      if(x[i].equals("-....")){
        elements.get(32).setColor(#03FF22);
        a="6";
      }
      if(x[i].equals(".....")){
        elements.get(31).setColor(#03FF22);
        a="5";
      }
      if(x[i].equals("....-")){
        elements.get(30).setColor(#03FF22);
        a="4";
      }
      if(x[i].equals("...--")){
        elements.get(29).setColor(#03FF22);
        a="3";
      }
      if(x[i].equals("..---")){
        elements.get(28).setColor(#03FF22);
        a="2";
      }
      if(x[i].equals(".----")){
        elements.get(27).setColor(#03FF22);
        a="1";
      }
      if(x[i].equals("-----")){
        elements.get(36).setColor(#03FF22);
        a="0";
      }
      if(x[i].equals(".-.-.-")){
        elements.get(37).setColor(#03FF22);
        a=".";
      }
      if(x[i].equals("--..--")){
        elements.get(38).setColor(#03FF22);
        a=",";
      }
      if(x[i].equals("..--..")){
        elements.get(39).setColor(#03FF22);
        a="?";
      }
      if(x[i].equals("-.-.--")){
        elements.get(40).setColor(#03FF22);
        a="!";
      }
      if(x[i].equals(".----.")){
        elements.get(41).setColor(#03FF22);
        a="\'";
      }
      if(x[i].equals(".-..-.")){
        elements.get(42).setColor(#03FF22);
        a="\"";
      }
      if(x[i].equals("-.--.")){
        elements.get(43).setColor(#03FF22);
        a="(";
      }
      if(x[i].equals("-.--.-")){
        elements.get(44).setColor(#03FF22);
        a=")";
      }
      if(x[i].equals(".-...")){
        elements.get(45).setColor(#03FF22);
        a="&";
      }
      if(x[i].equals("---...")){
        elements.get(46).setColor(#03FF22);
        a=":";
      }
      if(x[i].equals("-.-.-.")){
        elements.get(47).setColor(#03FF22);
        a=";";
      }
      if(x[i].equals("-..-.")){
        elements.get(48).setColor(#03FF22);
        a="/";
      }
      if(x[i].equals("..--.-")){
        elements.get(49).setColor(#03FF22);
        a="_";
      }
      if(x[i].equals("-...-")){
        elements.get(50).setColor(#03FF22);
        a="=";
      }
      if(x[i].equals(".-.-.")){
        elements.get(51).setColor(#03FF22);
        a="+";
      }
      if(x[i].equals("-...-")){
        elements.get(52).setColor(#03FF22);
        a="-";
      }
      if(x[i].equals("...-..-")){
        elements.get(53).setColor(#03FF22);
        a="$";
      }
      if(x[i].equals(".--.-.")){
        elements.get(54).setColor(#03FF22);
        a="@";
      }
      answer+=a;
    }
    return answer;
  }
  
}
