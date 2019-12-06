close all
clear h

function update_plot (obj, init = false)

  ## gcbo holds the handle of the control
  h = guidata (obj);

  switch (gcbo)
    case {h.edit_matrix_A}
      v = get (h.edit_matrix_A, "string");
      set (h.salida_matrix_R1,"string", v);
    case {h.boton_determinante}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      det=determinante(A);
      det = num2str(det);
      set (h.label_matrix_R1, "string", "Determinante");
      set (h.salida_matrix_R1,"string",det);
    case {h.boton_inversa}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      inv=inversa(A);
      inv = num2str(inv);
      set (h.label_matrix_R1, "string", "Inversa");
      set (h.salida_matrix_R1,"string",inv);
    case {h.boton_gram_Schmith}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      u=gramSchmith(A);
      u = num2str(u);
      set (h.label_matrix_R1, "string", "Matriz ortonormalizada");
      set (h.salida_matrix_R1,"string",u);
    case {h.boton_leverrier}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      [V,D]=algoritmoLeverrier(A);
      V = num2str(V);
      D = num2str(D);
      set (h.label_matrix_R1, "string", "Eigen Vectores");
      set (h.salida_matrix_R1,"string",V);
      set (h.label_matrix_R2, "string", "Matriz Diagonal");
      set (h.salida_matrix_R2,"string",D);
    case {h.boton_descomposicionCholesky}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      [G,Gt]=descomposicionCholesky(A);
      G = num2str(G);
      Gt = num2str(Gt);
      set (h.label_matrix_R1, "string", "Matrix G");
      set (h.salida_matrix_R1,"string",G);
      set (h.label_matrix_R2, "string", "Matrix Gt");
      set (h.salida_matrix_R2,"string",Gt);
    case {h.boton_solucionCholesky}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      B = get (h.edit_matrix_B, "string");
      B = str2num(B);
      X=solucionCholesky(A,B);
      X=num2str(X);
      set (h.label_matrix_R1, "string", "Vector solucion");
      set (h.salida_matrix_R1,"string",X);
    case {h.boton_cambio_de_Base}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      B = get (h.edit_matrix_B, "string");
      B = str2num(B);
      M12=cambioBase12(A,B);
      M12 = num2str(M12);
      set (h.label_matrix_R1, "string", "Matriz cambio de base 1 a 2");
      set (h.salida_matrix_R1,"string",M12);
    case {h.boton_descomposicionLU}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      [L,U]=descomposicionLU(A);
      L = num2str(L);
      U = num2str(U);
      set (h.label_matrix_R1, "string", "Matrix L");
      set (h.salida_matrix_R1,"string",L);
      set (h.label_matrix_R2, "string", "Matrix U");
      set (h.salida_matrix_R2,"string",U);
    case {h.boton_solucionLU}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      B = get (h.edit_matrix_B, "string");
      B = str2num(B);
      X=solucionLU(A,B);
      X=num2str(X);
      set (h.label_matrix_R1, "string", "Vector solucion");
      set (h.salida_matrix_R1,"string",X);
    case {h.boton_descomposicionPLU}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      [P,L,U]=descomposicionPLU(A);
      P = num2str(P);
      L = num2str(L);
      U = num2str(U);
      set (h.label_matrix_R1, "string", "Matrix P");
      set (h.salida_matrix_R1,"string",P);
      set (h.label_matrix_R2, "string", "Matrix L");
      set (h.salida_matrix_R2,"string",L);
      set (h.label_matrix_R3, "string", "Matrix U");
      set (h.salida_matrix_R3,"string",U);
    case {h.boton_solucionPLU}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      B = get (h.edit_matrix_B, "string");
      B = str2num(B);
      X=solucionPLU(A,B);
      X=num2str(X);
      set (h.label_matrix_R1, "string", "Vector solucion");
      set (h.salida_matrix_R1,"string",X);
    case {h.boton_descomposicionQR}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      [Q,R]=descomposicionQR(A);
      Q = num2str(Q);
      R = num2str(R);
      set (h.label_matrix_R1, "string", "Matrix Q");
      set (h.salida_matrix_R1,"string",Q);
      set (h.label_matrix_R2, "string", "Matrix R");
      set (h.salida_matrix_R2,"string",R);
    case {h.boton_elim_gausiana_progresiva}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      B = get (h.edit_matrix_B, "string");
      B = str2num(B);
      X=elim_gauss_progresivo(A,B);
      X=num2str(X);
      set (h.label_matrix_R1, "string", "Vector solucion");
      set (h.salida_matrix_R1,"string",X);
    case {h.boton_elim_gausiana_regresiva}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      B = get (h.edit_matrix_B, "string");
      B = str2num(B);
      X=elim_gauss_regresivo(A,B);
      X=num2str(X);
      set (h.label_matrix_R1, "string", "Vector solucion");
      set (h.salida_matrix_R1,"string",X);
    case {h.boton_regresion_N}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      B = get (h.edit_matrix_B, "string");
      B = str2num(B);
      n = get (h.edit_n, "string");
      n = str2num(n);
      coef = regresionNat(A,B,n);
      coef = num2str(coef);
      set (h.label_matrix_R1, "string", "Coeficientes :: a0+a1X+...+anX^n");
      set (h.salida_matrix_R1,"string",coef);
    case {h.boton_regresion_QR}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      B = get (h.edit_matrix_B, "string");
      B = str2num(B);
      n = get (h.edit_n, "string");
      n = str2num(n);
      coef = regresionQR(A,B,n);
      coef = num2str(coef);
      set (h.label_matrix_R1, "string", "Coeficientes :: a0+a1X+...+anX^n");
      set (h.salida_matrix_R1,"string",coef);
    case {h.boton_rango}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      c = rango(A);
      c = num2str(c);
      set (h.label_matrix_R1, "string", "Rango de la Matrix");
      set (h.salida_matrix_R1,"string",c);
    case {h.boton_rango_aumentada}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      B = get (h.edit_matrix_B, "string");
      B = str2num(B);
      [v1,v2] = rango_aumentado(A,B);
      if(v1)
        if(v2)
          set (h.label_matrix_R1, "string", "El sistema tiene:");
          set (h.salida_matrix_R1,"string", "solucion unica");
        else
          set (h.label_matrix_R1, "string", "El sistema tiene:");
          set (h.salida_matrix_R1,"string", "infita soluciones");
        endif
      else
        set (h.label_matrix_R1, "string", "El sistema tiene:");
        set (h.salida_matrix_R1,"string", "no tiene solucion");
      endif
    case {h.boton_suma}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      B = get (h.edit_matrix_B, "string");
      B = str2num(B);
      X=suma(A,B);
      X=num2str(X);
      set (h.label_matrix_R1, "string", "A+B");
      set (h.salida_matrix_R1,"string",X);
    case {h.boton_producto}
      A = get (h.edit_matrix_A, "string");
      A = str2num(A);
      B = get (h.edit_matrix_B, "string");
      B = str2num(B);
      X=producto(A,B);
      X=num2str(X);
      set (h.label_matrix_R1, "string", "A*B");
      set (h.salida_matrix_R1,"string",X);
    case {h.boton_limpiar}
      set (h.edit_matrix_A,"string", " ");
      set (h.edit_matrix_B,"string", " ");
      set (h.edit_n,"string", " ");
      set (h.salida_matrix_R1,"string", " ");
      set (h.salida_matrix_R2,"string", " ");
      set (h.salida_matrix_R3,"string", " ");
  endswitch
  
endfunction

%%%% datos de entrada %%%%%%%%%%%%%
h.label_matrix_A = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Matrix A",
                                "horizontalalignment", "left",
                                "position", [0.05 0.95 0.4 0.05]);
h.edit_matrix_A = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "Please fill me! (edit)",
                               "callback", @update_plot,
                               "position", [0.05 0.9 0.45 0.05]);
h.label_matrix_B = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Matrix B",
                                "horizontalalignment", "left",
                                "position", [0.05 0.85 0.4 0.05]);
h.edit_matrix_B = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "Please fill me! (edit)",
                               "callback", @update_plot,
                               "position", [0.05 0.8 0.45 0.05]);
h.label_n = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "regresion polinomial orden n:",
                                "horizontalalignment", "left",
                                "position", [0.05 0.75 0.3 0.05]);
h.edit_n = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "-",
                               "callback", @update_plot,
                               "position", [0.36 0.75 0.1 0.047]);                             
%%%%% datos de salida %%%%%%%%%%%%%%%%%%%%%%%%                               
h.label_matrix_R1 = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Matrix Rpta",
                                "horizontalalignment", "left",
                                "position", [0.05 0.7 0.4 0.05]);
h.salida_matrix_R1 = uicontrol ("style", "text",
                               "units", "normalized",
                               "string", "Matrix de salida R1",
                               "callback", @update_plot,
                               "position", [0.05 0.5 0.45 0.2]);
h.label_matrix_R2 = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Matrix Rpta",
                                "horizontalalignment", "left",
                                "position", [0.05 0.45 0.4 0.05]);
h.salida_matrix_R2 = uicontrol ("style", "text",
                               "units", "normalized",
                               "string", "Matrix de salida R2",
                               "callback", @update_plot,
                               "position", [0.05 0.25 0.45 0.2]);
h.label_matrix_R3 = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Matrix Rpta",
                                "horizontalalignment", "left",
                                "position", [0.05 0.2 0.4 0.05]);
h.salida_matrix_R3 = uicontrol ("style", "text",
                               "units", "normalized",
                               "string", "Matrix de salida R3",
                               "callback", @update_plot,
                               "position", [0.05 0.0 0.45 0.2]);                         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%%%%% Funciones en Botones :: operador unario :: Matrix A %%%%%%%
h.label_unario = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Operaciones\nUnarias",
                                "horizontalalignment", "left",
                                "position", [0.51 0.91 0.24 0.09]);
h.boton_descomposicionCholesky = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "descomposicion\nCholesky",
                                "callback", @update_plot,
                                "position", [0.51 0.8 0.24 0.09]); 
h.boton_descomposicionLU = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "descomposicion\nLU",
                                "callback", @update_plot,
                                "position", [0.51 0.7 0.24 0.09]);                                   
h.boton_descomposicionQR = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "descomposicion\nQR",
                                "callback", @update_plot,
                                "position", [0.51 0.6 0.24 0.09]);
h.boton_descomposicionPLU = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "descomposicion\nPLU",
                                "callback", @update_plot,
                                "position", [0.51 0.5 0.24 0.09]);                                
h.boton_determinante = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "determinante",
                                "callback", @update_plot,
                                "position", [0.51 0.45 0.24 0.045]);
h.boton_inversa = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "inversa",
                                "callback", @update_plot,
                                "position", [0.51 0.4 0.24 0.045]);
h.boton_gram_Schmith = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Gram Schmith",
                                "callback", @update_plot,
                                "position", [0.51 0.35 0.24 0.045]);
h.boton_leverrier = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Leverrier",
                                "callback", @update_plot,
                                "position", [0.51 0.3 0.24 0.045]);
h.boton_regresion_N = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Regresion\npolinomica",
                                "callback", @update_plot,
                                "position", [0.51 0.2 0.24 0.09]);
h.boton_rango = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Rango de la\nMatriz",
                                "callback", @update_plot,
                                "position", [0.51 0.1 0.24 0.09]);  
h.boton_limpiar = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Limpiar",
                                "callback", @update_plot,
                                "position", [0.51 0.02 0.24 0.07]);                                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Funciones en Botones :: operador binario :: Matrix A %%%%%%%
h.label_binario = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Operaciones\nBinarias",
                                "horizontalalignment", "left",
                                "position", [0.75 0.91 0.24 0.09]);
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
h.boton_solucionLU = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Solucion por\nLU",
                                "callback", @update_plot,
                                "position", [0.75 0.6 0.24 0.09]);
h.boton_solucionPLU = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Solucion por\nPLU",
                                "callback", @update_plot,
                                "position", [0.75 0.5 0.24 0.09]);                                
h.boton_elim_gausiana_progresiva = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Eliminacion de Gauss\nprogresiva",
                                "callback", @update_plot,
                                "position", [0.75 0.4 0.24 0.09]);
h.boton_elim_gausiana_regresiva = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Eliminacion de Gauss\nregresiva",
                                "callback", @update_plot,
                                "position", [0.75 0.3 0.24 0.09]);
h.boton_regresion_QR = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Regresion\nQR",
                                "callback", @update_plot,
                                "position", [0.75 0.2 0.24 0.09]);  
h.boton_rango_aumentada = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Rango Matriz\nAumentada",
                                "callback", @update_plot,
                                "position", [0.75 0.1 0.24 0.09]);
h.boton_suma = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "+",
                                "callback", @update_plot,
                                "position", [0.75 0.02 0.1 0.07]);                               
h.boton_producto = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "*",
                                "callback", @update_plot,
                                "position", [0.85 0.02 0.1 0.07]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                               
set (gcf, "color", get(0, "defaultuicontrolbackgroundcolor"))
guidata (gcf, h)
update_plot (gcf, true)                           