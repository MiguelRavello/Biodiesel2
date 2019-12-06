close all
clear h

function update_plot (obj, init = false)

  ## gcbo holds the handle of the control
  h = guidata (obj);

  switch (gcbo)
    case {h.edit_matrix_A}
      v = get (h.edit_matrix_A, "string");
      set (h.salida_matrix_R1,"string", v);
    case {h.boton_leverrier}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      [V,D]=algoritmoLeverrier(A);
      V = num2str(V);
      D = num2str(D);
      set (h.label_matrix_R1, "string", "Eigen Vectores")
      set (h.salida_matrix_R1,"string",V);
      set (h.label_matrix_R2, "string", "Matriz Diagonal")
      set (h.salida_matrix_R2,"string",D);
    case {h.boton_descomposicionCholesky}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      [G,Gt]=descomposicionCholesky(A);
      G = num2str(G);
      Gt = num2str(Gt);
      set (h.label_matrix_R1, "string", "Matrix G")
      set (h.salida_matrix_R1,"string",G);
      set (h.label_matrix_R2, "string", "Matrix Gt")
      set (h.salida_matrix_R2,"string",Gt);
    case {h.boton_solucionCholesky}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      B = get (h.edit_matrix_B, "string");
      B = str2num(B);
      X=solucionCholesky(A,B);
      X=num2str(X);
      set (h.label_matrix_R1, "string", "Vector solucion")
      set (h.salida_matrix_R1,"string",X);
    case {h.boton_cambio_de_Base}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      B = get (h.edit_matrix_B, "string");
      B = str2num(B);
      M12=cambioBase12(A,B);
      M12 = num2str(M12);
      set (h.label_matrix_R1, "string", "Matriz cambio de base 1 a 2")
      set (h.salida_matrix_R1,"string",M12);
  endswitch
  
endfunction

%%%% datos de entrada %%%%%%%%%%%%%
h.label_matrix_A = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Matrix A",
                                "horizontalalignment", "left",
                                "position", [0.05 0.92 0.4 0.05]);

h.edit_matrix_A = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "Please fill me! (edit)",
                               "callback", @update_plot,
                               "position", [0.05 0.75 0.45 0.1725]);

h.label_matrix_B = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Matrix B",
                                "horizontalalignment", "left",
                                "position", [0.05 0.7 0.4 0.05]);

h.edit_matrix_B = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "Please fill me! (edit)",
                               "callback", @update_plot,
                               "position", [0.05 0.55 0.45 0.15]);                               
%%%%% datos de salida %%%%%%%%%%%%%%%%%%%%%%%%                               
h.label_matrix_R1 = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Matrix Rpta",
                                "horizontalalignment", "left",
                                "position", [0.05 0.5 0.4 0.05]);

h.salida_matrix_R1 = uicontrol ("style", "text",
                               "units", "normalized",
                               "string", "Matrix de salida R1",
                               "callback", @update_plot,
                               "position", [0.05 0.3 0.45 0.2]);

h.label_matrix_R2 = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Matrix Rpta",
                                "horizontalalignment", "left",
                                "position", [0.05 0.25 0.4 0.05]);

h.salida_matrix_R2 = uicontrol ("style", "text",
                               "units", "normalized",
                               "string", "Matrix de salida R2",
                               "callback", @update_plot,
                               "position", [0.05 0.05 0.45 0.2]);              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%%%%% Funciones en Botones :: operador unario :: Matrix A %%%%%%%
h.label_unario = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Operaciones\nUnarias",
                                "horizontalalignment", "left",
                                "position", [0.5 0.9 0.24 0.09]);
h.boton_leverrier = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Leverrier",
                                "callback", @update_plot,
                                "position", [0.51 0.8 0.24 0.09]);
h.boton_descomposicionCholesky = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "descomposicion\nCholesky",
                                "callback", @update_plot,
                                "position", [0.51 0.7 0.24 0.09]);                                
                                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Funciones en Botones :: operador binario :: Matrix A %%%%%%%
h.label_binario = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Operaciones\nBinarias",
                                "horizontalalignment", "left",
                                "position", [0.75 0.9 0.24 0.09]);
h.boton_cambio_de_Base = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "cambio de\nBase 1 a 2",
                                "callback", @update_plot,
                                "position", [0.75 0.8 0.24 0.09]);                                
h.boton_solucionCholesky = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Solucion por\nCholesky",
                                "callback", @update_plot,
                                "position", [0.75 0.7 0.24 0.09]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                               
set (gcf, "color", get(0, "defaultuicontrolbackgroundcolor"))
guidata (gcf, h)
update_plot (gcf, true)                           