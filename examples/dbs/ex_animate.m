if exist('ex_write_video','var')==0
    ex_write_video=0;
end

if ex_write_video==1
    
    M1=[];
    myvideo=VideoWriter(ex_vid_path,'MPEG-4');
    myvideo.Quality=100;
    myvideo.FrameRate=30;
    open(myvideo);
    
end

%Update animation every [update_rate] samples
update_rate=400;
%Simulate model

for j=1:nsamples
    
    ct=j/fs;
    d1.update();
    d1.stimulate();
    
    if mod(j,update_rate)==0
       
        
        for m=1:npop
            plot_config_sp(d1.model.theta{m});
            hold on
        end
        
        title(['t=',num2str(ct)]);
        pause(0.00001);
        hold off
        
        if ex_write_video==1
            writeVideo(myvideo,getframe(gcf));
        end
        
    end
    
end


if ex_write_video==1
    close(myvideo);
end
