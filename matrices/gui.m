%calculadora de matrices

f=figure;
p=uipanel("title","Matrix","position",[0.25 0.25 0.8 0.5]);
b1=uicontrol("parent", p,
             "style", "edit",
             "units", "normalized",
             "string", "Please fill me! (edit)",
             "position", [0.6 0.85 0.35 0.08]);
