float[][] vertices = {
  {-1.0, -1.0, -1.0, -1.0}, 
  {1.0, -1.0, -1.0, -1.0}, 
  {-1.0, 1.0, -1.0, -1.0}, 
  {1.0, 1.0, -1.0, -1.0}, 
  {-1.0, -1.0, 1.0, -1.0}, 
  {1.0, -1.0, 1.0, -1.0}, 
  {-1.0, 1.0, 1.0, -1.0}, 
  {1.0, 1.0, 1.0, -1.0}, 
  {-1.0, -1.0, -1.0, 1.0}, 
  {1.0, -1.0, -1.0, 1.0}, 
  {-1.0, 1.0, -1.0, 1.0}, 
  {1.0, 1.0, -1.0, 1.0}, 
  {-1.0, -1.0, 1.0, 1.0}, 
  {1.0, -1.0, 1.0, 1.0}, 
  {-1.0, 1.0, 1.0, 1.0}, 
  {1.0, 1.0, 1.0, 1.0}
};

float[][] vertices_const = {
  {-1.0, -1.0, -1.0, -1.0}, 
  {1.0, -1.0, -1.0, -1.0}, 
  {-1.0, 1.0, -1.0, -1.0}, 
  {1.0, 1.0, -1.0, -1.0}, 
  {-1.0, -1.0, 1.0, -1.0}, 
  {1.0, -1.0, 1.0, -1.0}, 
  {-1.0, 1.0, 1.0, -1.0}, 
  {1.0, 1.0, 1.0, -1.0}, 
  {-1.0, -1.0, -1.0, 1.0}, 
  {1.0, -1.0, -1.0, 1.0}, 
  {-1.0, 1.0, -1.0, 1.0}, 
  {1.0, 1.0, -1.0, 1.0}, 
  {-1.0, -1.0, 1.0, 1.0}, 
  {1.0, -1.0, 1.0, 1.0}, 
  {-1.0, 1.0, 1.0, 1.0}, 
  {1.0, 1.0, 1.0, 1.0}
};

int vertexCount = 16;

int[][] connections = {
  {1, 2, 4, 8}, 
  {3, 5, 9, -1}, 
  {3, 6, 10, -1}, 
  {7, 11, -1, -1}, 
  {5, 6, 12, -1}, 
  {7, 13, -1, -1}, 
  {7, 14, -1, -1}, 
  {15, -1, -1, -1}, 
  {9, 10, 12, -1}, 
  {11, 13, -1, -1}, 
  {11, 14, -1, -1}, 
  {15, -1, -1, -1}, 
  {13, 14, -1, -1}, 
  {15, -1, -1, -1}, 
  {15, -1, -1, -1}, 
  {-1, -1, -1, -1}, 
};

float rotateXY = 0;
float rotateXZ = 0;
float rotateYZ = 0;
float rotateXW = 0;
float rotateYW = 0;
float rotateZW = 0;

float constRotate = radians(1);
float constMove = 4.5;
float constAngle = radians(2);
float scaleMulLeft = 120;
float scaleMulCenter = 60;
float scaleMulRight = 60;
float cameraX = 0.0;
float cameraY = 0.0;
float cameraZ = 0.0;
float cameraW = 0.0;
float angleX = 0.0;
float angleY = 0.0;
float angleZ = 0.0;
float lookAtX = 0.0;
float lookAtY = 0.0;
float lookAtZ = 0.0;

boolean[] keys = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
char[] keyMap = {'r', 'f', 't', 'g', 'y', 'h', 'u', 'j', 'i', 'k', 'o', 'l', 'a', 'd', 's', 'w', 'e', 'q', 'z', 'x', '4', '6', '2', '8'};

void rotYZ(int i) {
  float sinX = sin(rotateYZ);
  float cosX = cos(rotateYZ);
  float y = vertices[i][1];
  float z = vertices[i][2];
  vertices[i][1] = y * cosX + z * sinX;
  vertices[i][2] = z * cosX + y * -sinX;
}

void rotXZ(int i) {
  float sinY = sin(rotateXZ);
  float cosY = cos(rotateXZ);
  float x = vertices[i][0];
  float z = vertices[i][2];
  vertices[i][0] = x * cosY + z * -sinY;
  vertices[i][2] = z * cosY + x * sinY;
}

void rotXY(int i) {
  float sinZ = sin(rotateXY);
  float cosZ = cos(rotateXY);
  float x = vertices[i][0];
  float y = vertices[i][1];
  vertices[i][0] = x * cosZ + y * -sinZ;
  vertices[i][1] = y * cosZ + x * sinZ;
}

void rotXW(int i) {
  float sinY = sin(rotateXW);
  float cosY = cos(rotateXW);
  float x = vertices[i][0];
  float w = vertices[i][3];
  vertices[i][0] = x * cosY + w * sinY;
  vertices[i][3] = w * cosY + x * -sinY;
}

void rotYW(int i) {
  float sinX = sin(rotateYW);
  float cosX = cos(rotateYW);
  float y = vertices[i][1];
  float w = vertices[i][3];
  vertices[i][1] = y * cosX + w * -sinX;
  vertices[i][3] = w * cosX + y * sinX;
}

void rotZW(int i) {
  float sinX = sin(rotateZW);
  float cosX = cos(rotateZW);
  float z = vertices[i][2];
  float w = vertices[i][3];
  vertices[i][2] = z * cosX + w * -sinX;
  vertices[i][3] = w * cosX + z * sinX;
}

void RotateVertex(int i) {
  rotXY(i);
  rotXZ(i);
  rotXW(i);
  rotXY(i);
  rotYW(i);
  rotYZ(i);
  rotZW(i);
}

void setup() {
  size(1280, 760, P3D);
  cameraX = 0.0;
  cameraY = -600;
  cameraZ = 0.0;
  cameraW = 0.0;
  lookAtX = 0.0;
  lookAtY = 0.0;
  lookAtZ = 0.0;
  angleX = 0.0;
  angleY = 0.0;
  angleZ = 0.0;
  background(0);
}

void draw() {
  clear();
  pushMatrix();
  camera(cameraX, cameraY, cameraZ, lookAtX, lookAtY, lookAtZ, 0, 0, 1);
  stroke(255);
  ambientLight(128, 128, 128);
  directionalLight(160, 160, 160, 1, 1, -1);
  pushMatrix();
  noFill();
  for (int i = 0; i < vertexCount; i++) {
    for (int j = 0; j < 4; j++) {
      vertices[i][j] = vertices_const[i][j];
    }
  }
  for (int i = 0; i < vertexCount; i++) {
    RotateVertex(i);
  }
  popMatrix();
  pushMatrix();
  translate(-300, 0, 0);
  for (int i = 0; i < vertexCount; i++) {
    float x = vertices[i][0];
    float y = vertices[i][1];
    float z = vertices[i][2];
    float w = vertices[i][3];
    float x1 = x+(w/3);
    float y1 = y+(w/3);
    float z1 = z+(w/3);
    x1 = x1*scaleMulRight;
    y1 = y1*scaleMulRight;
    z1 = z1*scaleMulRight;
    for (int j = 0; j < 4; j++) {
      int cnt = connections[i][j];
      if (cnt != -1) {
        float x2 = vertices[cnt][0];
        float y2 = vertices[cnt][1];
        float z2 = vertices[cnt][2];
        float w2 = vertices[cnt][3];
        float x3 = x2+(w2/3);
        float y3 = y2+(w2/3);
        float z3 = z2+(w2/3);
        x3 = x3*scaleMulRight;
        y3 = y3*scaleMulRight;
        z3 = z3*scaleMulRight;
        if (i > 7 && cnt > 7) { 
          stroke(255, 48, 48);
        } else if ((i > 7) != (cnt > 7)) { 
          stroke(48, 255, 48);
        } else if (i < 8 && cnt < 8) {
          stroke(48, 48, 255);
        }
        line(x1, y1, z1, x3, y3, z3);
      }
    }
  }
  popMatrix();
  pushMatrix();
  translate(0, 0, 0);
  float[][] endpoints = new float[vertexCount*4][3];
  int epIndex = 0;
  for (int i = 0; i < vertexCount; i++) {
    float[] v1 = vertices[i];
    float w1 = v1[3]*scaleMulCenter;
    for (int j = 0; j < 4; j++) {
      int cnt = connections[i][j];
      if (cnt != -1) {
        float[] v2 = vertices[cnt];
        float w2 = v2[3]*scaleMulCenter;
        if ((w1 < cameraW) != (w2 < cameraW) || w1 == cameraW || w2 == cameraW) {
          if (w1 == cameraW) {
            endpoints[epIndex][0] = v1[0]*scaleMulCenter;
            endpoints[epIndex][1] = v1[1]*scaleMulCenter;
            endpoints[epIndex][2] = v1[2]*scaleMulCenter;
            epIndex = epIndex + 1;
          } else if (w2 == cameraW) {
            endpoints[epIndex][0] = v2[0]*scaleMulCenter;
            endpoints[epIndex][1] = v2[1]*scaleMulCenter;
            endpoints[epIndex][2] = v2[2]*scaleMulCenter;
            epIndex = epIndex + 1;
          } else {
            float x1 = v1[0]*scaleMulCenter;
            float y1 = v1[1]*scaleMulCenter;
            float z1 = v1[2]*scaleMulCenter;
            float x2 = v2[0]*scaleMulCenter;
            float y2 = v2[1]*scaleMulCenter;
            float z2 = v2[2]*scaleMulCenter;
            float s = (cameraW-w1)/(w2-w1);
            float dx = s*(x2-x1);
            float dy = s*(y2-y1);
            float dz = s*(z2-z1);
            endpoints[epIndex][0] = x1+dx;
            endpoints[epIndex][1] = y1+dy;
            endpoints[epIndex][2] = z1+dz;
            epIndex = epIndex + 1;
          }
        }
      }
    }
  }
  popMatrix();
  pushMatrix();
  translate(0, 0, 0);
  fill(48, 255, 48);
  noStroke();
  beginShape(TRIANGLES);
  for (int i = 0; i < epIndex; i++) {
    for (int j = i+1; j < epIndex; j++) {
      for (int k = j+1; k < epIndex; k++) {
        vertex(endpoints[i][0], endpoints[i][1], endpoints[i][2]);
        vertex(endpoints[j][0], endpoints[j][1], endpoints[j][2]);
        vertex(endpoints[k][0], endpoints[k][1], endpoints[k][2]);
      }
    }
  }
  endShape(CLOSE);
  popMatrix();
  pushMatrix();
  translate(300, 0, 0);
  noFill();
  for (int i = 0; i < vertexCount; i++) {
    float x = vertices[i][0];
    float y = vertices[i][1];
    float z = vertices[i][2];
    float w = vertices[i][3];
    float x1 = x*(1.0-(w/3.0));
    float y1 = y*(1.0-(w/3.0));
    float z1 = z*(1.0-(w/3.0));
    x1 = x1*scaleMulRight;
    y1 = y1*scaleMulRight;
    z1 = z1*scaleMulRight;
    for (int j = 0; j < 4; j++) {
      int cnt = connections[i][j];
      if (cnt != -1) {
        float x2 = vertices[cnt][0];
        float y2 = vertices[cnt][1];
        float z2 = vertices[cnt][2];
        float w2 = vertices[cnt][3];
        float x3 = x2*(1.0-(w2/3.0));
        float y3 = y2*(1.0-(w2/3.0));
        float z3 = z2*(1.0-(w2/3.0));
        x3 = x3*scaleMulRight;
        y3 = y3*scaleMulRight;
        z3 = z3*scaleMulRight;
        if (i > 7 && cnt > 7) { 
          stroke(255, 48, 48);
        } else if ((i > 7) != (cnt > 7)) { 
          stroke(48, 255, 48);
        } else if (i < 8 && cnt < 8) {
          stroke(48, 48, 255);
        }
        line(x1, y1, z1, x3, y3, z3);
      }
    }
  }
  popMatrix();
  pushMatrix();
  if (keys[0] == true) {
    rotateXY = rotateXY + constRotate;
    if (rotateXY > PI*2) { 
      rotateXY = rotateXY - PI*2;
    }
  }
  if (keys[1] == true) {
    rotateXY = rotateXY - constRotate;
    if (rotateXY < 0.0) { 
      rotateXY = rotateXY + PI*2;
    }
  }
  if (keys[2] == true) {
    rotateXZ = rotateXZ + constRotate;
    if (rotateXZ > PI*2) { 
      rotateXZ = rotateXZ - PI*2;
    }
  }
  if (keys[3] == true) {
    rotateXZ = rotateXZ - constRotate;
    if (rotateXZ < 0.0) { 
      rotateXZ = rotateXZ + PI*2;
    }
  }
  if (keys[4] == true) {
    rotateYZ = rotateYZ + constRotate;
    if (rotateYZ > PI*2) { 
      rotateYZ = rotateYZ - PI*2;
    }
  }
  if (keys[5] == true) {
    rotateYZ = rotateYZ - constRotate;
    if (rotateYZ < 0.0) { 
      rotateYZ = rotateYZ + PI*2;
    }
  }
  if (keys[6] == true) {
    rotateXW = rotateXW + constRotate;
    if (rotateXW > PI*2) { 
      rotateXW = rotateXW - PI*2;
    }
  }
  if (keys[7] == true) {
    rotateXW = rotateXW - constRotate;
    if (rotateXW < 0.0) { 
      rotateXW = rotateXW + PI*2;
    }
  }
  if (keys[8] == true) {
    rotateYW = rotateYW + constRotate;
    if (rotateYW > PI*2) { 
      rotateYW = rotateYW - PI*2;
    }
  }
  if (keys[9] == true) {
    rotateYW = rotateYW - constRotate;
    if (rotateYW < 0.0) { 
      rotateYW = rotateYW + PI*2;
    }
  }
  if (keys[10] == true) {
    rotateZW = rotateZW + constRotate;
    if (rotateZW > PI*2) { 
      rotateZW = rotateZW - PI*2;
    }
  }
  if (keys[11] == true) {
    rotateZW = rotateZW - constRotate;
    if (rotateZW < 0.0) { 
      rotateZW = rotateZW + PI*2;
    }
  }
  if (keys[12] == true) {
    cameraX = cameraX - constMove;
  }
  if (keys[13] == true) {
    cameraX = cameraX + constMove;
  }
  if (keys[14] == true) {
    cameraY = cameraY - constMove;
  }
  if (keys[15] == true) {
    cameraY = cameraY + constMove;
  }
  if (keys[16] == true) {
    cameraZ = cameraZ - constMove;
  }
  if (keys[17] == true) {
    cameraZ = cameraZ + constMove;
  }
  if (keys[18] == true) {
    cameraW = cameraW - constMove/4.0;
  }
  if (keys[19] == true) {
    cameraW = cameraW + constMove/4.0;
  }
  if (keys[20] == true) {
    angleZ = angleZ - constAngle;
  }
  if (keys[21] == true) {
    angleZ = angleZ + constAngle;
  }
  if (keys[22] == true) {
    angleX = angleX + constAngle;
    if (angleX > radians(60.0)) { 
      angleX = radians(60.0);
    }
  }
  if (keys[23] == true) {
    angleX = angleX - constAngle;
    if (angleX < radians(-60.0)) { 
      angleX = radians(-60.0);
    }
  }
  lookAtX = cameraX + sin(angleZ);
  lookAtY = cameraY + cos(angleZ);
  lookAtZ = cameraZ + sin(angleX);
  popMatrix();
  popMatrix();
  noLights();
  stroke(255);
  noFill();
  textSize(16);
  text("XY: ", width/4, height-144);
  text("XZ: ", width/4, height-120);
  text("YZ: ", width/4, height-96);
  text("XW: ", width/4, height-72);
  text("YW: ", width/4, height-48);
  text("ZW: ", width/4, height-24);
  text("Camera X: ", 3*width/4-96, height-120);
  text("Camera Y: ", 3*width/4-96, height-96);
  text("Camera Z: ", 3*width/4-96, height-72);
  text("Camera W: ", 3*width/4-96, height-48);
  text(degrees(rotateXY), width/4+24, height-144);
  text(degrees(rotateXZ), width/4+24, height-120);
  text(degrees(rotateYZ), width/4+24, height-96);
  text(degrees(rotateXW), width/4+24, height-72);
  text(degrees(rotateYW), width/4+24, height-48);
  text(degrees(rotateZW), width/4+24, height-24);
  text(cameraX, 3*width/4, height-120);
  text(cameraY, 3*width/4, height-96);
  text(cameraZ, 3*width/4, height-72);
  text(cameraW, 3*width/4, height-48);
}

void keyPressed() {
  for (int i = 0; i < 24; i++) {
    if (key == keyMap[i]) {
      keys[i] = true;
    }
  }
  if (key == ' ') {
    rotateXY = 0.0;
    rotateXZ = 0.0;
    rotateYZ = 0.0;
    rotateXW = 0.0;
    rotateYW = 0.0;
    rotateZW = 0.0;
    cameraX = 0.0;
    cameraY = -600.0;
    cameraZ = 0.0;
    cameraW = 0.0;
    angleX = 0.0;
    angleY = 0.0;
    angleZ = 0.0;
  }
}

void keyReleased() {
  for (int i = 0; i < 24; i++) {
    if (key == keyMap[i]) {
      keys[i] = false;
    }
  }
}
