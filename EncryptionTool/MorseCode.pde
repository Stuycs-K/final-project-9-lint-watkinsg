import java.util.Arrays;
import controlP5.*;
import java.util.*;

public class MorseCode implements Cipher {
  
  public Character[] cha={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0','.',',','?','!','\'','\"','(',')','&',':',';','/','_','=','+','-','$','@'};
  public String[] morse={".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--..",".----","..---","...--","....-",".....","-....","--...","---..","----.","-----",".-.-.-","--..--","..--..","-.-.--",".----.",".-..-.","-.--.","-.--.-",".-...","---...","-.-.-.","-..-.","..--.-","-...-",".-.-.","-....-","...-..-",".--.-."};
  
  public Textlabel[] keyContent=new Textlabel[morse.length];
  public ControlP5 cp5;
  
  public MorseCode(ControlP5 cp5){
    this.cp5=cp5;
    elements=new ArrayList<Textlabel>();
    elements.add(cp5.addTextlabel("MCkeyLabel"));
  }
  
  public void showElements(){
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
        keyContent[0].setColor(#03FF22);
        x[i]=".-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[0]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='b'||s.charAt(i)=='B'){
        keyContent[1].setColor(#03FF22);
        x[i]="-...";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[1]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='c'||s.charAt(i)=='C'){
        keyContent[2].setColor(#03FF22);
        x[i]="-.-.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[2]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='d'||s.charAt(i)=='D'){
        keyContent[3].setColor(#03FF22);
        x[i]="-..";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[3]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='e'||s.charAt(i)=='E'){
        keyContent[4].setColor(#03FF22);
        x[i]=".";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[4]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='f'||s.charAt(i)=='F'){
        keyContent[5].setColor(#03FF22);
        x[i]="..-.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[5]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='g'||s.charAt(i)=='G'){
        keyContent[6].setColor(#03FF22);
        x[i]="--.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[6]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='h'||s.charAt(i)=='H'){
        keyContent[7].setColor(#03FF22);
        x[i]="....";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[7]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='i'||s.charAt(i)=='I'){
        keyContent[8].setColor(#03FF22);
        x[i]="..";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[8]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='j'||s.charAt(i)=='J'){
        keyContent[9].setColor(#03FF22);
        x[i]=".---";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[9]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='k'||s.charAt(i)=='K'){
        keyContent[10].setColor(#03FF22);
        x[i]="-.-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[10]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='l'||s.charAt(i)=='L'){
        keyContent[11].setColor(#03FF22);
        x[i]=".-..";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[11]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='m'||s.charAt(i)=='M'){
        keyContent[12].setColor(#03FF22);
        x[i]="--";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[12]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='n'||s.charAt(i)=='N'){
        keyContent[13].setColor(#03FF22);
        x[i]="-.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[13]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='o'||s.charAt(i)=='O'){
        keyContent[14].setColor(#03FF22);
        x[i]="---";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[14]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='p'||s.charAt(i)=='P'){
        keyContent[15].setColor(#03FF22);
        x[i]=".--.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[15]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='q'||s.charAt(i)=='Q'){
        keyContent[16].setColor(#03FF22);
        x[i]="--.-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[16]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='r'||s.charAt(i)=='R'){
        keyContent[17].setColor(#03FF22);
        x[i]=".-.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[17]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='s'||s.charAt(i)=='S'){
        keyContent[18].setColor(#03FF22);
        x[i]="...";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[18]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='t'||s.charAt(i)=='T'){
        keyContent[19].setColor(#03FF22);
        x[i]="-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[19]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='u'||s.charAt(i)=='U'){
        keyContent[20].setColor(#03FF22);
        x[i]="..-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[20]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='v'||s.charAt(i)=='V'){
        keyContent[21].setColor(#03FF22);
        x[i]="...-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[21]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='w'||s.charAt(i)=='W'){
        keyContent[22].setColor(#03FF22);
        x[i]=".--";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[22]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='x'||s.charAt(i)=='X'){
        keyContent[23].setColor(#03FF22);
        x[i]="-..-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[23]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='y'||s.charAt(i)=='Y'){
        keyContent[24].setColor(#03FF22);
        x[i]="-.--";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[24]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='z'||s.charAt(i)=='Z'){
        keyContent[25].setColor(#03FF22);
        x[i]="--..";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[25]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='9'){
        keyContent[34].setColor(#03FF22);
        x[i]="----.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[34]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='8'){
        keyContent[33].setColor(#03FF22);
        x[i]="---..";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[33]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='7'){
        keyContent[32].setColor(#03FF22);
        x[i]="--...";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[32]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='6'){
        keyContent[31].setColor(#03FF22);
        x[i]="-....";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[31]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='5'){
        keyContent[30].setColor(#03FF22);
        x[i]=".....";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[30]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='4'){
        keyContent[29].setColor(#03FF22);
        x[i]="....-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[29]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='3'){
        keyContent[28].setColor(#03FF22);
        x[i]="...--";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[28]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='2'){
        keyContent[27].setColor(#03FF22);
        x[i]="..---";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[27]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='1'){
        keyContent[26].setColor(#03FF22);
        x[i]=".----";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[26]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='0'){
        keyContent[35].setColor(#03FF22);
        x[i]="-----";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[35]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='.'){
        keyContent[36].setColor(#03FF22);
        x[i]=".-.-.-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[36]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)==','){
        keyContent[37].setColor(#03FF22);
        x[i]="--..--";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[37]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='?'){
        keyContent[38].setColor(#03FF22);
        x[i]="..--..";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[38]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='!'){
        keyContent[39].setColor(#03FF22);
        x[i]="-.-.--";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[39]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='\''){
        keyContent[40].setColor(#03FF22);
        x[i]=".----.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[40]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='\"'){
        keyContent[41].setColor(#03FF22);
        x[i]=".-..-.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[41]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='('){
        keyContent[42].setColor(#03FF22);
        x[i]="-.--.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[42]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)==')'){
        keyContent[43].setColor(#03FF22);
        x[i]="-.--.-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[43]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='&'){
        keyContent[44].setColor(#03FF22);
        x[i]=".-...";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[44]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)==':'){
        keyContent[45].setColor(#03FF22);
        x[i]="---...";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[45]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)==';'){
        keyContent[46].setColor(#03FF22);
        x[i]="-.-.-.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[46]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='/'){
        keyContent[47].setColor(#03FF22);
        x[i]="-..-.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[47]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='_'){
        keyContent[48].setColor(#03FF22);
        x[i]="..--.-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[48]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='='){
        keyContent[49].setColor(#03FF22);
        x[i]="-...-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[49]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='+'){
        keyContent[50].setColor(#03FF22);
        x[i]=".-.-.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[50]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='-'){
        keyContent[51].setColor(#03FF22);
        x[i]="-...-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[51]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='$'){
        keyContent[52].setColor(#03FF22);
        x[i]="...-..-";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[52]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(s.charAt(i)=='@'){
        keyContent[53].setColor(#03FF22);
        x[i]=".--.-.";
        cp5.addTextlabel("input "+i+"")
          .setValue(cha[53]+"")
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
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
        keyContent[0].setColor(#03FF22);
        a="a";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[0])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-...")){
        keyContent[1].setColor(#03FF22);
        a="b";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[1])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-.-.")){
        keyContent[2].setColor(#03FF22);
        a="c";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[2])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-..")){
        keyContent[3].setColor(#03FF22);
        a="d";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[3])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".")){
        keyContent[4].setColor(#03FF22);
        a="e";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[4])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("..-.")){
        keyContent[5].setColor(#03FF22);
        a="f";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[5])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("--.")){
        keyContent[6].setColor(#03FF22);
        a="g";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[6])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("....")){
        keyContent[7].setColor(#03FF22);
        a="h";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[7])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("..")){
        keyContent[8].setColor(#03FF22);
        a="i";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[8])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".---")){
        keyContent[9].setColor(#03FF22);
        a="j";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[9])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-.-")){
        keyContent[10].setColor(#03FF22);
        a="k";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[10])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".-..")){
        keyContent[11].setColor(#03FF22);
        a="l";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[11])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("--")){
        keyContent[12].setColor(#03FF22);
        a="m";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[12])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-.")){
        keyContent[13].setColor(#03FF22);
        a="n";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[13])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("---")){
        keyContent[14].setColor(#03FF22);
        a="o";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[14])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".--.")){
        keyContent[15].setColor(#03FF22);
        a="p";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[15])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("--.-")){
        keyContent[16].setColor(#03FF22);
        a="q";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[16])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".-.")){
        keyContent[17].setColor(#03FF22);
        a="r";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[17])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("...")){
        keyContent[18].setColor(#03FF22);
        a="s";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[18])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-")){
        keyContent[19].setColor(#03FF22);
        a="t";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[19])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("..-")){
        keyContent[20].setColor(#03FF22);
        a="u";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[20])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("...-")){
        keyContent[21].setColor(#03FF22);
        a="v";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[21])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".--")){
        keyContent[22].setColor(#03FF22);
        a="w";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[22])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-..-")){
        keyContent[23].setColor(#03FF22);
        a="x";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[23])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-.--")){
        keyContent[24].setColor(#03FF22);
        a="y";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[24])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("--..")){
        keyContent[25].setColor(#03FF22);
        a="z";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[25])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("----.")){
        keyContent[34].setColor(#03FF22);
        a="9";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[34])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("---..")){
        keyContent[33].setColor(#03FF22);
        a="8";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[33])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("--...")){
        keyContent[32].setColor(#03FF22);
        a="7";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[32])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-....")){
        keyContent[31].setColor(#03FF22);
        a="6";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[31])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".....")){
        keyContent[30].setColor(#03FF22);
        a="5";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[30])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("....-")){
        keyContent[29].setColor(#03FF22);
        a="4";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[29])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("...--")){
        keyContent[28].setColor(#03FF22);
        a="3";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[28])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("..---")){
        keyContent[27].setColor(#03FF22);
        a="2";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[27])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".----")){
        keyContent[26].setColor(#03FF22);
        a="1";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[26])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-----")){
        keyContent[35].setColor(#03FF22);
        a="0";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[35])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".-.-.-")){
        keyContent[36].setColor(#03FF22);
        a=".";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[36])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("--..--")){
        keyContent[37].setColor(#03FF22);
        a=",";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[37])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("..--..")){
        keyContent[38].setColor(#03FF22);
        a="?";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[38])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-.-.--")){
        keyContent[39].setColor(#03FF22);
        a="!";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[39])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".----.")){
        keyContent[40].setColor(#03FF22);
        a="\'";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[40])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".-..-.")){
        keyContent[41].setColor(#03FF22);
        a="\"";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[41])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-.--.")){
        keyContent[42].setColor(#03FF22);
        a="(";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[42])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-.--.-")){
        keyContent[43].setColor(#03FF22);
        a=")";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[43])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".-...")){
        keyContent[44].setColor(#03FF22);
        a="&";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[44])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("---...")){
        keyContent[45].setColor(#03FF22);
        a=":";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[45])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-.-.-.")){
        keyContent[46].setColor(#03FF22);
        a=";";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[46])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-..-.")){
        keyContent[47].setColor(#03FF22);
        a="/";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[47])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("..--.-")){
        keyContent[48].setColor(#03FF22);
        a="_";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[48])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-...-")){
        keyContent[49].setColor(#03FF22);
        a="=";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[49])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".-.-.")){
        keyContent[50].setColor(#03FF22);
        a="+";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[50])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("-...-")){
        keyContent[51].setColor(#03FF22);
        a="-";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[51])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals("...-..-")){
        keyContent[52].setColor(#03FF22);
        a="$";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[52])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      if(x[i].equals(".--.-.")){
        keyContent[53].setColor(#03FF22);
        a="@";
        cp5.addTextlabel("input "+i+"")
          .setValue(morse[53])
          .setPosition(100+(i+1)*50,520)
           .setColor(#03ff22)
          .setFont(createFont("arial", 30))
          ;
      }
      answer+=a;
    }
    return answer;
  }
  
}
