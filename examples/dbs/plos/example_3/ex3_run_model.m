%Example 3
%System geometry: spherical
%Frequency distribution: Lorentzian
%Stimulation strategy: Coordinated reset

%Set to 1 to animate the time evolution of the state
ex_show_animation=0;
%Path of output video
ex_vid_path='';
%Set to 1 to write animation to video file ex_vid_path
ex_write_video=0;
%Set to 1 to visualise system
ex_show_system=0;

ex3_set_model;
ex3_set_dbs;

if ex_show_animation==1
    
    ex_animate;
    
else
    
    %Simulate model
    d1.simulate();
    ex_plot_data;
    
end

if ex_show_system==1
    
    figure
    plot_system_spherical;
    
end