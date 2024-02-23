/// @description Insert description here
// You can write your code in this editor

testContainer = visage_container_create();

visage_track_element(testContainer);

visage_container_set_entrance_movement_animation(testContainer, elastic_out, false);
visage_container_set_entrance_movement_timing(testContainer, 750, 0);
visage_container_set_entrance_movement_position_start(testContainer, -32, 64);
visage_container_set_entrance_movement_position_end(testContainer, 64, 64);

visage_container_set_entrance_rotation_animation(testContainer, elastic_out, false);
visage_container_set_entrance_rotation_timing(testContainer, 750, 50);
visage_container_set_entrance_rotation_start(testContainer, 90);
visage_container_set_entrance_rotation_end(testContainer, 0);

visage_container_set_entrance_scale_animation(testContainer, elastic_out, false);
visage_container_set_entrance_scale_timing(testContainer, 500, 0);
visage_container_set_entrance_scale_start(testContainer, 0);
visage_container_set_entrance_scale_end(testContainer, 1);

visage_container_set_entrance_alpha_animation(testContainer, ease_in_and_out, false);
visage_container_set_entrance_alpha_timing(testContainer, 400, 100);
visage_container_set_entrance_alpha_start(testContainer, 0.5);
visage_container_set_entrance_alpha_end(testContainer, 1);

visage_container_set_exit_movement_animation(testContainer, ease_in_and_out, false);
visage_container_set_exit_movement_timing(testContainer, 750, 0);
visage_container_set_exit_movement_position_start(testContainer, 64, 64);
visage_container_set_exit_movement_position_end(testContainer, -32, 64);

visage_container_set_exit_rotation_animation(testContainer, ease_in_and_out, false);
visage_container_set_exit_rotation_timing(testContainer, 750, 100);
visage_container_set_exit_rotation_start(testContainer, 0);
visage_container_set_exit_rotation_end(testContainer, 90);

visage_container_set_exit_scale_animation(testContainer, ease_in_and_out, false);
visage_container_set_exit_scale_timing(testContainer, 250, 400);
visage_container_set_exit_scale_start(testContainer, 1);
visage_container_set_exit_scale_end(testContainer, 0);

visage_container_set_exit_alpha_animation(testContainer, ease_in_and_out, false);
visage_container_set_exit_alpha_timing(testContainer, 250, 250);
visage_container_set_exit_alpha_start(testContainer, 1);
visage_container_set_exit_alpha_end(testContainer, 0.5);














