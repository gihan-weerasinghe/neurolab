classdef mp_km < handle
    
    properties
        
        %Time index within buffer
        n double;
        %Number of samples in buffer
        nsamples double;
        %Time index
        n_t double;
        %Number of oscillators per population (vector)
        nperpop double;
        %Number of populations
        npop double;
        %Total number of oscillators
        noscillators double;
        %Sampling rate
        fs double;
        
        %Time vector
        tvec double;
        %Global oscillation
        osc double;
        %Global amplitude
        rho double;
        %Global phase
        psi double;
        %Population oscillation
        osc_s double;
        %Population amplitude
        rho_s double;
        %Population phase
        psi_s double;
        %Phases of ensemble
        theta cell;
        %Voltage at population
        Vpp double;
        
        %Weights for connecting neural activity with global oscillation
        wvec double;
        %Phase response function Cosine coefficients
        zA double;
        %Phase response function Sine coefficients
        zB double;
        %Coupling Matrix
        kmat double;
        %Vector of noise coefficients
        sigma double;
        
        
        %Natural frequency distribution: 'normal or 'cauchy'.
        nat_freq_dist char;
        %Natural Frequencies of ensemble
        omega0 cell;
        %Average of natural frequency distribution
        w0 double;
        %Width of natural frequency distribution.
        gamma double;
        
    end
    
    methods
        
        
        function set_kmat(obj,val)
            
            obj.kmat=zeros(obj.npop,obj.npop)+val;
            
        end
        
        function set_prc(obj,zA,zB)
            
            obj.zA=zeros(obj.npop,2);
            obj.zB=zeros(obj.npop,2);
            
            for j=1:obj.npop
                
                obj.zA(j,:)=zA;
                obj.zB(j,:)=zB;
                
            end
            
        end
        
        
        function plot_osc(obj)
            
            obj.disp_splash();
            
            plot(obj.tvec,obj.osc);
            xlabel('Time (s)');
            
        end
        
        function plot_osc_s(obj)
            
            
            obj.disp_splash();
            
            px=zeros(1,obj.npop);
            
            for j=1:obj.npop
                px(j)=subplot( obj.npop,1,j );
                plot(obj.tvec,obj.osc_s(j,:));
            end
            xlabel('Time (s)');
            linkaxes(px,'x');
            
        end
        
        
        function update(obj)
            
            
            if obj.n>obj.nsamples
                
                obj.n=0;
                
            end
            
            obj.n=obj.n+1;
            obj.n_t=obj.n_t+1;
            
            n=obj.n;
            dt=1/obj.fs;
            r_s=zeros(1,obj.npop);
            csum=zeros(1,obj.npop);
            
            for m=1:obj.npop
                
                r_s(m)=mean(exp(1i*obj.theta{m}));
                csum(m)=real(r_s(m));
                obj.osc_s(m,n)=csum(m);
                obj.rho_s(m,n)=abs(r_s(m));
                obj.psi_s(m,n)=mod(angle(r_s(m)),2*pi);
                
            end
            
            r=sum(obj.wvec.*r_s);
            obj.osc(n)=real(r);
            obj.rho(n)=abs(r);
            obj.psi(n)=mod(angle(r),2*pi);
            
            for m=1:obj.npop
                
                dw=normrnd(0,(dt^0.5),[1,obj.nperpop(m)]);
                cp_vec=calc_kmat_coupling(obj.kmat(m,:),obj.rho_s(:,n),obj.psi_s(:,n),obj.wvec,obj.theta{m});
                dtheta=obj.omega0{m}+cp_vec+obj.Vpp(m)*prf(obj.theta{m},obj.zA(m,:),obj.zB(m,:));
                obj.theta{m}=mod(obj.theta{m}+dtheta*dt+obj.sigma(m)*dw,2*pi);
                obj.Vpp(m)=0;
                
            end
            
            
        end
        
        function simulate(obj)
            
            obj.disp_splash();
            
            for j=obj.n+1:obj.nsamples
                
                obj.update();
                
            end
            
        end
        
        function gen_nat_freq(obj)
            
            
            x0=strcmp(obj.nat_freq_dist,'cauchy');
            
            if x0==1
                
                for j=1:obj.npop
                    
                    obj.omega0{j}=cauchyrnd(obj.w0,obj.gamma,[1,obj.nperpop(j)]);
                    
                end
                
                
            else
                
                for j=1:obj.npop
                    
                    obj.omega0{j}=normrnd(obj.w0,obj.gamma,1,obj.nperpop(j));
                    
                end
                
            end
            
        end
        
        function gen_phases(obj)
            
            psi0=random_real([0,2*pi],[1,obj.npop]);
            
            for j=1:obj.npop
                
                obj.theta{j}=pearsrnd(psi0(j),pi*0.8,0,3,1,obj.nperpop(j));
                
            end
            
        end
        
        function initialise_parameters(obj)
            
            obj.wvec=zeros(1,obj.npop);
            obj.zA=zeros(obj.npop,2);
            obj.zB=zeros(obj.npop,2);
            obj.kmat=zeros(obj.npop,obj.npop);
            obj.sigma=zeros(1,obj.npop);
            obj.omega0=cell(1,obj.npop);
            
            for j=1:obj.npop
                obj.wvec(j)=obj.nperpop(j)/(obj.noscillators);
            end
            
            for j=1:obj.npop
                
                obj.omega0{j}=zeros(1,obj.nperpop(j));
                
            end
            
        end
        
        function initialise_arrays(obj)
            
            obj.tvec=zeros(1,obj.nsamples);
            obj.osc=zeros(1,obj.nsamples);
            obj.rho=zeros(1,obj.nsamples);
            obj.psi=zeros(1,obj.nsamples);
            
            obj.osc_s=zeros(obj.npop,obj.nsamples);
            obj.rho_s=zeros(obj.npop,obj.nsamples);
            obj.psi_s=zeros(obj.npop,obj.nsamples);
            
            obj.theta=cell(1,obj.npop);
            obj.Vpp=zeros(1,obj.npop);
            
            obj.n=0;
            obj.n_t=0;
            
            obj.tvec=linspace(0,obj.nsamples/obj.fs,obj.nsamples);
            
            for j=1:obj.npop
                
                obj.theta{j}=zeros(1,obj.nperpop(j));
                
            end
            
            obj.gen_phases();
            
        end
        
        function disp_splash(obj)
            
            global nl_tinitialised;
            show_splash=0;
            
            if isempty(nl_tinitialised)==1
                show_splash=1;
                nl_tinitialised=datetime;
                
            else
                
                t2=datetime;
                
                if hours(t2-nl_tinitialised)>5
                    show_splash=1;
                    nl_tinitialised=t2;
                end
                
            end
            
            
            if show_splash==1
                
                disp(' ');
                disp(' ***********************************************************************')
                disp(' *                                                                     *')
                disp(' *         ----|   | N | e | u | r | O | L | A | B |  )                *');
                disp(' *                                                                     *')
                disp(' *                  Neural Oscillation Toolbox v1.01                   *');
                disp(' *                         Gihan Weerasinghe                           *');
                disp(' *                                                                     *');
                disp(' *                     University of Oxford 2021                       *');
                disp(' *                                                                     *');
                disp(' *                       FOR ACADEMIC USE ONLY                         *');
                disp(' *                                                                     *');
                disp(' *                                                                     *');
                disp(' *    Please cite: PLOS Computational Biology 17.8 (2021): e1009281    *');
                disp(' *           in any publications which make use of NeurOLAB            *');
                disp(' *                                                                     *');
                disp(' *                                                                     *');
                disp(' *         For more information on licensing see license.txt           *');
                disp(' *                                                                     *');
                disp(' ***********************************************************************');
                disp(' ');
                
            end
            
            
        end
        
        function obj = mp_km(nsamples,npop,nperpop,fs)
            
            obj.disp_splash();
            
            obj.nsamples=nsamples;
            obj.npop=npop;
            obj.nat_freq_dist='normal';
            
            if length(nperpop)==1
                obj.nperpop=zeros(1,npop)+nperpop;
            else
                obj.nperpop=nperpop;
            end
            
            obj.noscillators=sum(obj.nperpop);
            obj.fs=fs;
            obj.initialise_arrays();
            obj.initialise_parameters();
            
        end
        
        
    end
    
end

