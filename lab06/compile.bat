masm /Zi lab6_m.asm,,,;
masm /Zi lab6_in.asm,,,;
masm /Zi lab6_bu.asm,,,;
masm /Zi lab6_bs.asm,,,;
masm /Zi lab6_du.asm,,,;
masm /Zi lab6_ds.asm,,,;
masm /Zi lab6_hs.asm,,,;
masm /Zi lab6_hu.asm,,,;
link /Co lab6_m.obj lab6_bu.obj lab6_bs.obj lab6_ds.obj lab6_du.obj lab6_hu.obj lab6_hs.obj lab6_in.obj,lab6.exe,,;