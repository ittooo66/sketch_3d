void draw() {

  //draw 2D part
  background(0);
  fill(200, 200, 200);
  textSize(20);
  text("frame:"+frameNo+","+60/(framerate+1)+"fps", 40, 40);
  noFill();   

  //control play/stop & framerate
  if (start_or_stop) {
    if (frameNo<maxframe-1) {
      if (framerate<=framestack) {
        frameNo++;
        framestack=0;
      }
      else {
        framestack++;
      }
    }
  }

  //translate coordinate
  translate(width/2, height-200, scale); 

  //apply mouse changes
  rotateX(rot_h);
  rotateZ(-rot_w);

  //daiza
  stroke(255, 0, 0);
  for (int i=0;i<10;i++) {  
    rect(-200, -200, 40*i+40, 400);//x,y,xwidth,ywidth
    rect(-200, -200, 400, 40*i+40);
  }
  sphere(2);
  noStroke();  

  //draw markers
  for (int i=0;i<maxmark;i++) {
    boolean drawmark=true;//for null marker

    //decide marker color
    if (markRGB[frameNo][i]==1) {
      fill(0, 255, 64);
    }
    else if (markRGB[frameNo][i]==2) {
      fill(0, 64, 255);
    }
    else {
      fill(255, 64, 0);
      for (int j=0;j<i;j++) {
        if (markRGB[frameNo][j]!=0) {
          drawmark=false;//for null marker
        }
      }
    }

    if (drawmark) {

      //keep previous coordinate in stack
      pushMatrix();

      //change coordinate to markerXYZ
      translate(data_X[frameNo][i]/5, data_Y[frameNo][i]/5, data_Z[frameNo][i]/5);

      //draw marker
      sphere(3);

      //draw text
      rotateX(-rot_h);//adjust text position
      rotateY(-rot_w);//adjust text position
      textSize(10);
      text(i, 5, 0, 0);//num,x,y,z

      //get previous coordinate from stack
      popMatrix();
    }
  }
}

