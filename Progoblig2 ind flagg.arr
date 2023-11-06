use context essentials2021


fun flagg(farge1, farge2, farge3):
  
base = rectangle(250, 160, "solid", farge1)

stripe1 = rectangle(40, 160, "solid", farge2)
stripe2 = rectangle(250, 40, "solid", farge2)

ustripe1 = rectangle(250, 20, "solid", farge3)
ustripe2 = rectangle(20, 160, "solid", farge3)

step1 = overlay-xy(ustripe1, 80, -70, ustripe2)
step2 = overlay-xy(stripe2, 70, -60, stripe1)
step3 = overlay(step1, step2)
step4 = overlay(step3, base)
  
frame(step4)
  
end

#Norge
flagg("crimson", "white", "blue")

#Svergie
flagg("navy", "navy", "yellow")

#Danmark
flagg("crimson", "crimson", "white")

#Finland
flagg("white", "white", "blue")

#Færøyene
flagg("white", "blue", "crimson")

#Island
flagg("navy","white", "crimson")
  






