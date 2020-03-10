# MC_collect
Results of determination of CR density and anisotropy variations during the time moments of passage of magnetic cloud through the Earth

The moments of passage of magnetic clouds by the Earth are listed in 'MC_DATE_ZHANG.txt'.

The fortran code '0-ROTATE_CS.f90' converts the results of the global survey method (GSM).
The fortran code '1-MC_MAIN.f90' creates a 'FFFR000' files that contains a data on direct measurements of interplanetary space by OMNI Web database (https://omniweb.gsfc.nasa.gov/form/dx1.html) and GSM results. 
The fortran codes '2-CASES.f90', '3-FILTER_GS_RES.f90' and '4-STATISTICS.f90' not for general use.

The calculated by the GSM data are in the archived file 'INITIAL_DATA.zip'
The results are stored in the archived file 'RESULTS.zip'
