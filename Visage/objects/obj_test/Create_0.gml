/// @description Insert description here
// You can write your code in this editor

testContainer = visage_container_create();

visage_track_element(testContainer);

visage_container_set_entrance_movement_animation(testContainer, ease_in_and_out, false);
visage_container_set_entrance_movement_timing(testContainer, 5000, 0);
visage_container_set_entrance_movement_position_start(testContainer, 1920, 0);
visage_container_set_entrance_movement_position_end(testContainer, 1920/2, 1080/2);

visage_container_set_entrance_alpha_animation(testContainer, ease_in_and_out, false);
visage_container_set_entrance_alpha_timing(testContainer, 200, 0);
visage_container_set_entrance_alpha_start(testContainer, 1);
visage_container_set_entrance_alpha_end(testContainer, 1);

visage_container_set_exit_movement_animation(testContainer, elastic_out, true);
visage_container_set_exit_movement_timing(testContainer, 500, 0);
visage_container_set_exit_movement_position_start(testContainer, 50, 250);
visage_container_set_exit_movement_position_end(testContainer, -50, 250);

visage_container_set_exit_alpha_animation(testContainer, ease_in_and_out, false);
visage_container_set_exit_alpha_timing(testContainer, 100, 0);
visage_container_set_exit_alpha_start(testContainer, 1);
visage_container_set_exit_alpha_end(testContainer, 0);
















