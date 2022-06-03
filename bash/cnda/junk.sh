#!/bin/bash
 
#i=26-ep2d_boldWU__EYES_OPEN_
i="26-ep2d_boldWU  EYES_OPEN "
echo ${i}END

            str="${i%% }"          #remove trailing space
            str="${str//(}"
            str="${str//)}"
            str="${str// /_}"
            #str="${str//+( )/ }"
            str=$(echo ${str} | tr -s "_")
echo ${str}END



