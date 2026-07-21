$fn = $preview ? 30 : 100;

clearance = 0.25;
eps = 0.02;

/* assembly / shelf / wall */
part = "shelf";

shelf_d = 80;
shelf_w = 240;
shelf_sep = 80;
shelf_t = 6;

wall_cut = 25;
wall_t = 10;

joint_depth = 4; // penetración vertical en el muro
joint_neck = 4; // anchura en la entrada superior
joint_head = 6; // anchura en el fondo
back_stop = 5; // material cerrado al final de la ranura
joint_length = shelf_d - back_stop;
