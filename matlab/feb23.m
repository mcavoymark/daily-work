%ifft_tbrp.m 		top and bottom fill with reordering and phase correction
%			set REORDER_FULL = 1 to reorder NRF dimension for full fourier
%			set REORDER_HALF = 1 to reorder NRF dimension for half fourier
%			set PHASE_CORRECT_WHOLE = 1 for whole volume phase correction
%			set PHASE_CORRECT_FULL = 1 for full fourier phase correction
%			set PHASE_CORRECT_HALF = 1 for half fourier phase correction
%			set NO_IFFT = 1 to turn off inverse transforms
%			FILL puts an equal number of 0's on both side of the image in the
%                       NRF dimension
%			set FILL = NRF for no filling
%			ex1. FILL = 128 with NRF = 36 and FILL_FF1_HF0 = 1, puts 46 zeros above and below the image.
%                       ex2. FILL = 128 with NRF = 36 and FILL_FF1_HF0 = 0 with PAD_TO = 64,
%		             puts 60 zeros in front of the image and 32 zeros behind it.		
clear all

NO_IFFT = 0;

FILL_FF1_HF0 = 0;                       %full fourier fill = 1  half fourier fill = 0  John's half fourier fill = 2
    FILL = 128;				% No visible difference between half fourier fill and John's correct fill.
  %half fourier				% Only a couple lines have been shifted so this is not so surprising.
    PAD_TO = 64;                        % pad half fourier to 64 (NOTE: zeros precede the image)
    DELETE_FIRST_TWO_LINES = 0;

REORDER_FULL = 0;
    FLIP = 23;
REORDER_HALF = 0;

PHASE_CORRECT_WHOLE = 1; 
    HAM_NRF = 0;
    HAM_NGR = 0;
PHASE_CORRECT_FULL = 0;
    LINE = 24;  %NRF dimension
PHASE_CORRECT_HALF = 0;
    LINE_NRF = 24;
    LINE_NGR = 4;
MARGOSIAN = 0;
    NRF_CENTER_KSPACE = 3;
    NLINES = 2;
    NLINES_ROLLOFF = 5;

OFFSET = 6144;
PTS = 256;
NRF = 36;
NGR = 7;

%idir = '/home/hannah/mcavoy/matlab/feb22/raw/';
%odir = '/home/hannah/mcavoy/matlab/feb22/ifft/'; 
%image =         {'HDFF.raw'  'HDFF30.raw'  'DFFF.raw'  'DFFFB30.raw'};
%template_file = {'HDTMP.raw' 'HDTMP30.raw' 'DFTMP.raw' 'DFTMPB30.raw'};
%image =         {'HDHF.raw'  'HDHF30.raw'  'DFHF.raw'  'DFHFB30.raw'};
%template_file = {'HDTMP.raw' 'HDTMP30.raw' 'DFTMP.raw' 'DFTMPB30.raw'};

idir = '/data/petsun20/c/scatter/mcavoy/jan19/';
odir = '/home/hannah/mcavoy/matlab/jan19_ifft/'; 

%image =  {'3D-1.raw'  '3D-15-4.raw'  '3D-4.raw'  '3D-C-4.raw' '3D-C-SWP-4.raw' '3D-C-SWP-5.raw' '3D-S-SWP-5.raw' '3D-T-1.raw'};
%template_file = {'3D-T-TMP-5.raw' '3D-T-TMP-5.raw' '3D-T-TMP-5.raw' '3D-T-TMP-5.raw' '3D-T-TMP-5.raw' '3D-T-TMP-5.raw' '3D-T-TMP-5.raw' '3D-T-TMP-5.raw'};
%template_file = {'3D-TMP-5.raw' '3D-TMP-5.raw' '3D-TMP-5.raw' '3D-TMP-5.raw' '3D-TMP-5.raw' '3D-TMP-5.raw' '3D-TMP-5.raw' '3D-TMP-5.raw'};

image = {'3D-HF-1.raw' '3D-HF-C-2.raw' '3D-HF-T-2.raw' '3D-HF-T15-3.raw'};
%template_file = {'3D-HF-T15-TMP-3.raw' '3D-HF-T15-TMP-3.raw' '3D-HF-T15-TMP-3.raw' '3D-HF-T15-TMP-3.raw'};
%template_file = {'3D-HF-TMP-3.raw' '3D-HF-TMP-3.raw' '3D-HF-TMP-3.raw' '3D-HF-TMP-3.raw'};
template_file = {'3D-HF15-TMP-3.raw' '3D-HF15-TMP-3.raw' '3D-HF15-TMP-3.raw' '3D-HF15-TMP-3.raw'};



if FILL_FF1_HF0 == 1
    disp('USING FULL FOURIER FILL')
else
    disp('USING HALF FOURIER FILL')
end

data = zeros(NRF,NGR,PTS);
top_and_bottom = (FILL-NRF)/2;
half_ff_zero_fill = (FILL-PAD_TO)/2;
half_ff_pad = PAD_TO-NRF;
half_ff_fill = half_ff_zero_fill+half_ff_pad;

if REORDER_FULL & REORDER_HALF
    error('REORDER_FULL and REORDER_HALF are both set.')
end

%if PHASE_CORRECT_FULL+PHASE_CORRECT_HALF+PHASE_CORRECT_WHOLE+MARGOSIAN > 1
if PHASE_CORRECT_FULL+PHASE_CORRECT_HALF+PHASE_CORRECT_WHOLE > 1
    error('More than one type of phase correction is set.')
end

%str = int2str(FILL);
%str = '_';
str = ' ';
if FILL_FF1_HF0 == 2
    str = strcat(str,'j');
end
if DELETE_FIRST_TWO_LINES
    str = strcat(str,'d2');
end
if REORDER_HALF
    str = strcat(str,'r');
end
if REORDER_FULL
    str = strcat(str,'r',int2str(FLIP));
end
if PHASE_CORRECT_WHOLE
    str = strcat(str,'_W');
    if HAM_NRF | HAM_NGR
	str = strcat(str,'ham');
    end
    if HAM_NRF
	str = strcat(str,'RF');
    end
    if HAM_NGR
	str = strcat(str,'GR');
    end
end
if PHASE_CORRECT_FULL
    str = strcat(str,'p',int2str(LINE));
end
if PHASE_CORRECT_HALF
    str = strcat(str,'p',int2str(LINE_NRF),'-',int2str(LINE_NGR));
end

for k=1:size(image,2)
    if PHASE_CORRECT_WHOLE
        filename = char(strcat(idir,template_file(1,k)));
        fid = fopen(filename,'r');
        if fid == -1
            error(sprintf('Unable to open %s for reading.',filename))
        end
        if fseek(fid,OFFSET,'bof') == -1
            error(sprintf('Unable to seek %s',filename))
        end
        [flat,count] = fread(fid,NRF*NGR*PTS*2,'float32');
        if count ~= NRF * NGR * PTS*2
            error(sprintf('Did not read the proper number of elements for %s',filename))
        end
        if fclose(fid) == -1
            error(sprintf('Unable to close %s',filename))
        end
        template = zeros(NRF,NGR,PTS);
        q = 1;
        for m=1:NRF
            for n=1:NGR
                for p=1:PTS
                    template(m,n,p) = flat(q)-i*flat(q+1);
                    q = q + 2;
                end
            end
        end
        template = template./abs(template);
	%template = template(:,[5 4 3 2 1 6 7],:);

	if HAM_NRF | HAM_NGR
	    template = fft(template,[],3);
	    if HAM_NRF
                center_correction = NRF-NRF_CENTER_KSPACE+1;
                w = hamming(4*center_correction);
                for m=1:NRF
                    template(m,:,:) = template(m,:,:)*w(center_correction-NRF_CENTER_KSPACE+m);
                end
	    end
	    if HAM_NGR
	        w = hamming(2*NGR);
	        for n=1:NGR
		    template(:,n,:) = template(:,n,:)*w(n);
	        end
	    end
	    template = ifft(template,[],3);
	end
    end
    if PHASE_CORRECT_FULL
        filename = char(strcat(idir,template_file(1,k)));
        fid = fopen(filename,'r');
        if fid == -1
            error(sprintf('Unable to open %s for reading.',filename))
        end
        if fseek(fid,OFFSET+(LINE-1)*NGR*PTS*2,'bof') == -1
            error(sprintf('Unable to seek %s',filename))
        end
        [flat,count] = fread(fid,NGR*PTS*2,'float32');
        if count ~= NGR * PTS*2
            error(sprintf('Did not read the proper number of elements for %s',filename))
        end
        if fclose(fid) == -1
            error(sprintf('Unable to close %s',filename))
        end
        template = zeros(NGR,PTS);
        q = 1;
        for n=1:NGR
            for p=1:PTS
                template(n,p) = flat(q)-i*flat(q+1);
                q = q + 2;
            end
        end
        template = template./abs(template);
    end
    if PHASE_CORRECT_HALF
        filename = char(strcat(idir,template_file(1,k)));
        fid = fopen(filename,'r');
        if fid == -1
            error(sprintf('Unable to open %s for reading.',filename))
        end
        if fseek(fid,OFFSET+(LINE_NRF-1)*NGR*PTS*2+(LINE_NGR-1)*PTS*2,'bof') == -1
            error(sprintf('Unable to seek %s',filename))
        end
        [flat,count] = fread(fid,PTS*2,'float32');
        if count ~= PTS*2
            error(sprintf('Did not read the proper number of elements for %s',filename))
        end
        if fclose(fid) == -1
            error(sprintf('Unable to close %s',filename))
        end
        template = zeros(PTS,1);
        q = 1;
        for p=1:PTS
            template(p) = flat(q)-i*flat(q+1);
            q = q + 2;
        end
        template = template./abs(template);
    end



    filename = char(strcat(idir,image(1,k)));
    fid = fopen(filename,'r');
    if fid == -1
	error(sprintf('Unable to open %s for reading.',filename))
    end
    if fseek(fid,OFFSET,'bof') == -1
	error(sprintf('Unable to seek %s',filename))
    end
    [flat,count] = fread(fid,inf,'float32');
    if count ~= PTS*2 * NRF * NGR
	error(sprintf('Did not read the proper number of elements for %s',filename))
    end
    if fclose(fid) == -1
	error(sprintf('Unable to close %s',filename))
    end
    q = 1;
    for m=1:NRF
        for n=1:NGR
            for p=1:PTS
                data(m,n,p) = flat(q)+i*flat(q+1);
                q = q + 2;
            end
        end
    end

    if DELETE_FIRST_TWO_LINES
	data(1:2,:,:) = 0;
    end	


    if PHASE_CORRECT_WHOLE
	data = data.*template;
    end 
    if PHASE_CORRECT_FULL
        for m=1:NRF
            data(m,:,:) = squeeze(data(m,:,:)).*template;
        end
    end
    if PHASE_CORRECT_HALF
        for m=1:NRF
            for n=1:NGR
		data(m,n,:) = squeeze(data(m,n,:)).*template;
            end
        end
    end
    if MARGOSIAN
        data = fft(data,[],3);
        center_correction = NRF-NRF_CENTER_KSPACE+1;
        w = hamming(4*center_correction);
        %correction = data(NRF_CENTER_KSPACE-NLINES:NRF_CENTER_KSPACE-1,:,:);
        correction = data(1:NLINES,:,:);
        for m=1:NLINES
            %correction(m,:,:) = correction(m,:,:)*w(center_correction-NLINES+m-1);
            correction(m,:,:) = correction(m,:,:)*w(center_correction-NRF_CENTER_KSPACE+m);
        end
        volume_correction = zeros(FILL,NGR,PTS);
        %full fourier fill - see p.197 Margosian
        t_and_b = (FILL-NLINES)/2;
        volume_correction(t_and_b+1:FILL-t_and_b,:,:) = correction;
        volume_correction = ifft(volume_correction,[],3);
        volume_correction = volume_correction(:,:,[129:256,1:128]);
        volume_correction = ifft(volume_correction,[],1);
        volume_correction = ifft(volume_correction,[],2);
        volume_correction = ifftshift(volume_correction);
        volume_correction = i*imag(conj(volume_correction));

        for m=1:NLINES_ROLLOFF
            %data(m,:,:) = data(m,:,:)*w(center_correction-NLINES+m-1);
            data(m,:,:) = data(m,:,:)*w(center_correction-NRF_CENTER_KSPACE+m);
        end
        data = ifft(data,[],3);
    end


    %reorder NRF dimension
    if REORDER_FULL
        data = data([NRF:-1:FLIP,1:FLIP-1],:,:);
    end
    if REORDER_HALF
        data = data(NRF:-1:1,:,:);
    end

    %top and bottom zero filling if FILL > NRF
    volume = zeros(FILL,NGR,PTS); %need to rezero for multiple raw files
    if FILL_FF1_HF0 == 1
	volume(top_and_bottom+1:FILL-top_and_bottom,:,:) = data;
    elseif FILL_FF1_HF0 == 0
	volume(half_ff_fill+1:half_ff_fill+NRF,:,:) = data;
    else % John's half fourier fill
	volume(63:63+NRF-1,:,:) = data;
    end


    if NO_IFFT == 0
        volume = volume(:,:,[129:256,1:128]);
        volume = ifft(volume,[],1);
        volume = ifft(volume,[],2);
        volume = ifftshift(volume);
    end

    if MARGOSIAN
	volume = volume + volume_correction;
	magnitude = abs(volume);
	%filename = char(strcat(odir,strrep(image(1,k),'raw','mag'),int2str(NLINES),'MAR',str))
	filename = char(strcat(odir,strtok(char(image(1,k)),'.'),'_',strtok(char(template_file(1,k)),'.'),'.mag',int2str(NLINES),'MAR',str))
    else
        magnitude = abs(volume);
        phase = angle(volume);
	if PHASE_CORRECT_WHOLE | PHASE_CORRECT_FULL | PHASE_CORRECT_HALF
	    filename = char(strcat(odir,strtok(char(image(1,k)),'.'),'_',strtok(char(template_file(1,k)),'.'),'.mag',str))
	else
	    filename = char(strcat(odir,strrep(image(1,k),'raw','mag'),str))
	end
    end

    %template_name = strtok(char(template_file(1,k)),'.')

    fid = fopen(filename,'w');
    if fid == -1
        error(sprintf('Unable to open %s for writing.',filename))
    end
    for m=1:FILL
        for n=1:NGR
	    if fwrite(fid,magnitude(m,n,:),'float32') ~= PTS
	        error(sprintf('Did not write the proper number of elements for %s',filename))
	    end
        end
    end
    if fclose(fid) == -1
        error(sprintf('Unable to close %s',filename))
    end
if 0
    if MARGOSIAN == 0
        filename = char(strcat(odir,strrep(image(1,k),'raw','phase'),str))
        fid = fopen(filename,'w');
        if fid == -1
            error(sprintf('Unable to open %s for writing.',filename))
    	end
        for m=1:FILL
            for n=1:NGR
                if fwrite(fid,phase(m,n,:),'float32') ~= PTS
                    error(sprintf('Did not write the proper number of elements for %s',filename))
                end
            end
        end
        if fclose(fid) == -1
            error(sprintf('Unable to close %s',filename))
        end
    end
end
end
