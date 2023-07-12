# Kimiko tenting case

## Context/goals

The goals of this project : build a well integrated, as low profile as possible, tenting system for Keycapsss.com's Kimiko keyboard. Secondary goals: make it as silent as possible (considering it will be 3D printed plastic... ) and make it look good.

## Status

This is an unfinished (and untested) work I finally decided to publish, in case someone wants to start from here to make a case for their keyboard.

I am releasing this under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 

The footprint of the Kimiko keyboard included in this git is @BenRoe's design, released under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.

My work is not really a derivative work of the above: you can replace the footprint by that of another keyboard and generate a fitting case for it.
## Design

This is an OpenSCAD project using a 2D SVG keyboard footprint as an input to generate a cate for the keyboard.

This case is supposed to replace the bottom plate from the Kimiko keyboard (or the keyboard you generate the case for, provided it has a similar structure), so that the PCB will directly rest on it.

Notice that the bottom actually is hollow, except for a narrow rim, and that the PCB will only rest on its borders (and the hotswap sockets just "hang", without poking lower than the case itself). I expect that the lack of a bottom surface should remove a lot of reverberation an resonances. The PCB should ideally not rest directly on this rim though, but rather on some gasket stuck on the rim. There will be no other fixation.

The tenting itself is just done thanks to two nuts and bolts (choose a long enough screw for the required angle of tenting) on the inner side. The outer side just rests on the table (add some anti-skid pads!).

Also, this case has "walls" all around the keyboard, primarily for aesthetic reasons (but it should also improve rigidity).

Last thing: the case features wrist rest supports (as an toggleable option in the SCAD file).