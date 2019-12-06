

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
%%%%% datos de salida %%%%%%%%%%%%%%%%%%%%%%%%                               
h.label_matrix_R1 = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Matrix Rpta",
                                "horizontalalignment", "left",
                                "position", [0.05 0.55 0.4 0.05]);

h.edit_matrix_R1 = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "Please fill me! (edit)",
                               "callback", @update_plot,
                               "position", [0.05 0.325 0.4 0.225]);

h.label_matrix_R2 = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Matrix Rpta",
                                "horizontalalignment", "left",
                                "position", [0.05 0.275 0.4 0.05]);

h.edit_matrix_R2 = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "Please fill me! (edit)",
                               "callback", @update_plot,
                               "position", [0.05 0.05 0.4 0.225]);                               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                               