function outdata = CONmmsemoca(tmpdata,contype)

%%% MMSE and MOCA conversion in neurological populations 
%%% input: 
%%%     tmpdata is a vector of either MOCA or MMSE total score, 
%%%     contype indicates which conversion is desired. 
%%%     use 1 in contype to convert MMSE to MOCA, 
%%%     use 2 in contype to convert MOCA to MMSE. 
%%% output: 
%%%     outdata is a vector of converted estimated scores. 
%%%
%%% reference: 
%%%     Conversion between the Montreal Cognitive Assessment and the Mini-Mental Status Examination
%%%     Fasnacht et al., J Am Geriatr Soc, 08 November 2022, https://doi.org/10.1111/jgs.18124
%%%
%%%     by Sue-Jin Lin 2023 Nov 15th @ MNI, McGill


%%% define data
% tmpdata = DATA.MMSE;

if contype==1
    %%% convert MMSE to MOCA

    % generate matix
    tmpMMSE = [6:30]';
    tmpeMOCA = [2,2,2,3,4,5,5,6,7,8,9,10,11,12,13,14,15,16,17,19,20,21,23,25,28]';
    tmp_convertMMSE2MOCA = table(tmpMMSE,tmpeMOCA);

    outdata = nan(size(tmpdata));
    for i=1:length(tmpdata)
        [Ccon atmpdata bconver] = intersect(tmpdata(i),tmp_convertMMSE2MOCA.tmpMMSE,'stable');
        if ~isempty(bconver)
            outdata(i,1) = tmp_convertMMSE2MOCA.tmpeMOCA(bconver);
        end
    end

elseif contype==2
    %%% convert MOCA to MMSE

    % generate matrix
    tmpMOCA = [2:30]';
    tmpeMMSE = [7,9,10,12,13,14,15,16,17,18,19,20,21,22,23,24,25,25,26,27,27,28,28,29,29,30,30,30,30]';
    tmp_convertMOCA2MMSE = table(tmpMOCA,tmpeMMSE);

    outdata = nan(size(tmpdata));
    for i=1:length(tmpdata)
        [Ccon atmpdata bconver] = intersect(tmpdata(i),tmp_converMOCA2MMSE.tmpMOCA,'stable');
        if ~isempty(bconver)
            outdata(i,1) = tmp_converMOCA2MMSE.tmpeMMSE(bconver);
        end
    end
end
