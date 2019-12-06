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
                               "position", [0.05 0.75 0.4 0.1725]);

h.label_matrix_B = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Matrix B",
                                "horizontalalignment", "left",
                                "position", [0.05 0.7 0.4 0.05]);

h.edit_matrix_B = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "Please fill me! (edit)",
                               "callback", @update_plot,
                               "position", [0.05 0.55 0.4 0.15]);                               
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
                               "position", [0.05 0.3 0.4 0.2]);

h.label_matrix_R2 = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Matrix Rpta",
                                "horizontalalignment", "left",
                                "position", [0.05 0.25 0.4 0.05]);

h.salida_matrix_R2 = uicontrol ("style", "text",
                               "units", "normalized",
                               "string", "Matrix de salida R2",
                               "callback", @update_plot,
                               "position", [0.05 0.05 0.4 0.2]);              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%%%%% Funciones en Botones :: operador unario :: Matrix A %%%%%%%
h.boton_leverrier = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Leverrier",
                                "callback", @update_plot,
                                "position", [0.6 0.45 0.35 0.09]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set (gcf, "color", get(0, "defaultuicontrolbackgroundcolor"))
guidata (gcf, h)
update_plot (gcf, true)                           