//grobal
boolean start_or_stop=false;//false:stop,true:start
int framerate=1;
int framestack=1;

void keyPressed(){
  if(key == 'w'){
    if(framerate>0)framerate--;
  }else if(key == 'a'){
    if(frameNo>0)frameNo--;
  }else if(key == 's'){
    framerate++;
  }else if(key == 'd'){
    if(frameNo<maxframe-1)frameNo++;
  }else if(key == 'r'){
    start_or_stop=false;
    frameNo=0;
  }else if(key == ' '){
    if(start_or_stop)start_or_stop=false;
    else start_or_stop=true;
  }else if(keyCode == SHIFT){
    framerate=1;
  }else if(keyCode == LEFT){
    rot_w=rot_w-PI/20;
  }else if(keyCode == RIGHT){
    rot_w=rot_w+PI/20;
  }else if(keyCode == UP){
    rot_h=rot_h+PI/20;
  }else if(keyCode == DOWN){
    rot_h=rot_h-PI/20;
  }
}
