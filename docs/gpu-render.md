# The board view on the video card

`BoardView` is a `QOpenGLWidget` (OpenGL 3.3 core, 4x multisampling, a stencil). The QPainter drawing it replaced
(a picture kept between frames, drawn in bands in parallel) is in the branch `qpainter-render`.

## Scenes: one record an object

`src/gui/gl/Scene.{h,cpp}` — no OpenGL. `SceneBuilder` turns objects into `SceneData`:

| Record | What | In the shader |
|---|---|---|
| `SegmentRec` | a straight wire, a line, a net line; a disc when its ends are one point (a via, a round pad) | distance to the segment: round ends, the edge antialiased over a pixel |
| `ArcRec` | an arc of a wire or of a drawing, a circle: centre, radius, the direction of its middle, half its sweep | distance to the circle within the sweep, to the nearer end beyond it |
| `FillVertex` | the triangles of a polygon's contours (a pour, a pad's core, a filled figure, a keepout, glyphs) | the stencil; a triangle of an arc side keeps what is in the circle, one of a quadratic curve what is inside the curve (Loop and Blinn) |
| `SegmentRec` in `holes` | a drilled hole or slot | the background dotted from the hole's middle, a thin contour |
| `MarkerRec` | a DRC violation | a ring with a cross, in pixels |

Nothing is cut into chords: an arc is an arc at any zoom. A pad grown by its rounding (`Shape::polygon(poly, r)`) is its
core polygon and a capsule on every side. What is still a polygon in the model stays one: a pour (boost, 5 um chords,
until its computation moves to `geo`), a pad stack's detail with some corners rounded (`rectCornersOutline`), a slanted
oval detail.

Coordinates are whole nanometres (`ivec2`). The shader takes the view's centre off as integers and only then goes to
floats (`view.glsl`): a float from the board's origin is 30 nm coarse, and far in the picture would shake.

A stroke's width on screen: `Stroke{half nm, min px, max px, dash}` — a line of a pixel is `{0, 0.5}`.

## Fills: the stencil, then one rectangle a colour

A contour is halved again and again (`SceneBuilder::fan`): a triangle on the ends and the middle of a run of points,
then the same for the two halves. The triangles' windings are counted in the stencil (front faces up, back faces down),
and one rectangle over the batch is coloured where the count is not zero. No triangulation; a fractured polygon's seams
and holes need no care. (A fan from one point covered a pour of thousands of points thousands of times: 17 ms a frame.)
A batch is the polygons of one colour added between two `flush()` calls; a polygon is turned to the positive way, so
that two lying over one another do not cancel. Curved triangles are shaded sample by sample (OpenGL 4.0, where it is).

## Order, and what is over what

`SceneBuilder::flush()` puts out the fills, then the segments, then the arcs of what was added since the last one:
flush between what must lie over one another. `gui/BoardScene.cpp` builds three scenes:

- the board, in the order it was always painted (bottom mechanical layers, copper from the bottom up with the active
  one last, vias, top mechanical and documenting layers, outline, keepouts, component bounds, holes, net lines);
- the marks: the dimming, the selected and the highlighted brighter, the DRC's marks — built alone when the
  selection changes (`refreshMarks`);
- the tool's work in hand (the route being laid and the way suggested, the figure being drawn), anew every frame.

QPainter draws over the frame only what is in pixels: the labels (`QStaticText`, laid out once), the handles, the
selection frame, the ruler.

The board and the marks as drawn are kept in a texture while the view stands (`Renderer::keep`, `restore`): a frame of
the cursor moved puts them back and draws the tool's work over them.

## Copper transparency

«Прозрачность меди» (`AppSettings::copperTransparency`, a setting of the program): a copper layer's steps carry
`Blend::Copper` or `Blend::ActiveCopper`; such a run is drawn into a multisampled framebuffer of its own and laid over
the picture whole with its transparency (the active layer half as much), so what overlaps within a layer does not show.

## Tests and measuring

`QWidget::grab()` does not reach an OpenGL widget that is not on screen; the tests read `BoardView::picture()` (the
framebuffer) and are skipped where no context can be made (`XR_NEEDS_GL`). `BoardView::boardScene()` gives the records
without a context.

`XR_PROF=1 xrtopor --render-bench 30 <board>`: frames of the whole board (the scene built anew), zoomed in, panned,
the cursor moved, each drawn to its last pixel (`glFinish`). At 1830x1060, ms, the QPainter picture -> now:

| Board | whole | zoomed in | panned | cursor |
|---|---|---|---|---|
| RMT19M_A68U_V4_ | 97 -> 9 | 28 -> 12 | 25 -> 8 | 2.2 -> 0.9 |
| AMK310_MCU_V2 | 31 -> 7 | 16 -> 7 | 8 -> 2.7 | 1.7 -> 0.7 |

Of a frame of RMT19M_A68U_V4_: the scene's build 5 ms (on an edit only), the labels 2 ms, the rest the video card.

The benchmark also has `wheel` (a step of the wheel) and `drag` (a component pressed and moved: the edit and the
frame of each step), and repeats the series with the copper 65 % transparent (`/t65`). RMT19M_A8SWA_V5 (four pours
filled), 1829x1060, Radeon 780M, ms: whole 5.5, wheel 6, zoomed in 12, panned 7; with the transparency +1-2.
A step of a drag was 138: not the picture but the connectivity computed anew for the ratsnest at every move, 128 of
it the pours' fills measured side by side against every item of their nets. With the fills' sides in a grid
(`geom/PolyIndex`) a step is 16-25.
