// Restoration placeholders for artwork absent from the original archive.
// Existing images are loaded unchanged. Missing decorative assets are drawn here.
HashMap<String, PImage> restoredCache = new HashMap<String, PImage>();

PImage restoredImage(String path) {
  if (restoredCache.containsKey(path)) return restoredCache.get(path);
  if (new java.io.File(dataPath(path)).exists() ||
      new java.io.File(sketchPath(path)).exists()) {
    PImage original = loadImage(path);
    if (original != null) {
      restoredCache.put(path, original);
      return original;
    }
  }
  // The map encodes rooms, so a missing map must never become a decorative image.
  if (path.equals("game/map.png")) {
    throw new RuntimeException("Missing game/map.png: extract the entire RPG folder.");
  }
  PGraphics g = createGraphics(96, 96);
  g.beginDraw();
  g.clear();
  g.stroke(24, 29, 42);
  g.strokeWeight(3);
  if (path.startsWith("wizard/")) {
    g.fill(81, 174, 224);
    g.triangle(48, 32, 22, 81, 74, 81);
    g.fill(245, 219, 177);
    g.ellipse(48, 35, 24, 26);
    g.fill(62, 119, 200);
    g.triangle(48, 5, 26, 29, 69, 29);
    g.stroke(245, 219, 177);
    g.line(76, 37, 76, 82);
    g.fill(255, 217, 106);
    g.ellipse(76, 32, 10, 10);
  } else if (path.startsWith("mushroom/")) {
    g.fill(237, 212, 173);
    g.rect(32, 42, 32, 36, 8);
    g.fill(218, 88, 91);
    g.arc(48, 47, 68, 66, PI, TWO_PI, CHORD);
    g.fill(24, 29, 42);
    g.ellipse(41, 59, 4, 6);
    g.ellipse(55, 59, 4, 6);
  } else if (path.startsWith("ranger/")) {
    g.fill(104, 177, 123);
    g.triangle(48, 15, 20, 78, 70, 78);
    g.fill(245, 219, 177);
    g.ellipse(47, 37, 20, 24);
    g.noFill();
    g.stroke(220, 177, 113);
    g.arc(66, 52, 34, 55, -HALF_PI, HALF_PI);
    g.line(66, 24, 66, 80);
  } else if (path.startsWith("portalgif/")) {
    g.noFill();
    g.stroke(115, 89, 208);
    g.strokeWeight(10);
    g.ellipse(48, 48, 67, 80);
    g.stroke(121, 231, 221);
    g.strokeWeight(3);
    g.ellipse(48, 48, 49, 65);
  } else if (path.startsWith("lose/")) {
    g.background(30, 23, 39);
    g.stroke(94, 51, 67);
    g.line(0, 0, 96, 96);
    g.line(96, 0, 0, 96);
  } else if (path.startsWith("shield/")) {
    g.fill(118, 190, 221);
    g.beginShape();
    g.vertex(18, 16); g.vertex(78, 16); g.vertex(72, 61);
    g.vertex(48, 85); g.vertex(24, 61); g.endShape(CLOSE);
    g.stroke(226, 242, 250);
    g.line(48, 25, 48, 65);
  } else if (path.startsWith("wand/")) {
    g.stroke(220, 182, 130);
    g.strokeWeight(8);
    g.line(25, 77, 63, 33);
    g.noStroke();
    g.fill(path.contains("red") ? color(240, 99, 100) :
      path.contains("blue") ? color(98, 199, 241) :
      path.contains("green") ? color(128, 221, 142) : color(242, 235, 216));
    g.quad(66, 10, 80, 27, 66, 44, 52, 27);
  } else {
    g.fill(244, 218, 121);
    g.quad(48, 12, 78, 48, 48, 84, 18, 48);
    g.fill(255);
    g.ellipse(48, 43, 12, 12);
  }
  g.endDraw();
  PImage replacement = g.get();
  g.dispose();
  restoredCache.put(path, replacement);
  return replacement;
}
