Dungeon Crawl - restored prototype

![Dungeon Crawl gameplay](gameplay.png)

RUN
1. Extract this entire ZIP first.
2. Open RPG/RPG.pde in Processing, using Java mode.
3. Press Run, then click PLAY inside the game.
4. The original instruction sequence lasts roughly 20 seconds at 60 FPS.

Keep all PDE tabs and asset folders together inside RPG.
No JavaFX library is required by this restored version.

CONTROLS
WASD: move
Mouse: aim
Space: shoot
1-4: select weapons as they unlock
Click PAUSE: open the pause/upgrade interface

RESTORATION CHANGES
- Removed the JavaFX import and renderer dependency; uses default Java2D.
- Added RestoredAssets.pde to draw simple placeholders for absent wizard,
  ranger, mushroom, turret, portal, defeat-screen, wand and shield graphics.
- Kept existing artwork, fonts, map and gameplay code where possible.
- Reset the full game state when clicking AGAIN, including enemies and items.

VALIDATION
Compiled successfully with Processing 3.5.4 on Linux.
