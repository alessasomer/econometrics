/********************************************************************************\
  Project: ECON 255 - Data Brief 1
  
  File Name: 2.create-visualizations.do

  Description: This program creates DB1 visualizations

*******************************************************************************/

	/* import data cleaned by previous do file */ 
		use "$data/data-for-analysis.dta", clear

  /* create a global macro for your working directory */
      global root "~/Desktop/econ-255-fa23/data-brief-1"

  
  /* create global macros for your data and output folders */
      global data "$root/data"
      global output "$root/output"
      global logs "$root/logs"
	   global code "$root/code"
		
		
/******************************************************************************/      
/***************************    create figure 1  ******************************/          
/******************************************************************************/	
	

/* Provide a visualization for the distribution of your measure of healthcare access */
	
 /* create histogram for "MD_PC" or # of medical doctors per 100,000 residents*/
        hist MD_PC, ///
            bin(20) frequency ///
            title("Histogram of # Medical Doctors") ///
            xtitle("Number of Medical Doctors per 100,000 residents") ///
            ytitle("Frequency") ///
            plotregion(color(white)) graphregion(color(white))


    /* export the histogram to output folder */
      graph export "$output/MD_PC_histogram.png", replace
	
	
/******************************************************************************/      
/***************************    create figure 2  ******************************/          
/******************************************************************************/


/* Provide a visualization for the for the distribution of opioid prescribing*/
	
 /* create histogram for "PCPV" /Per Capita Opioid Pill Volume*/

        hist n_bathrooms, ///
            bin(20) frequency ///
            title("Number of Bathrooms") ///
            xtitle("Number of Bathrooms") ///
            ytitle("Frequency") ///
            plotregion(color(white)) graphregion(color(white))
			
       hist n_bedrooms, ///
            bin(20) frequency ///
            title("Number of Bedrooms") ///
            xtitle("Number of Bedrooms") ///
            ytitle("Frequency") ///
            plotregion(color(white)) graphregion(color(white))



    /* export the histogram to output folder */
      graph export "$output/opioid_dist_histogram.png", replace
	
/******************************************************************************/      
/***************************    create figure 3  ******************************/          
/******************************************************************************/

/* Provide a time series plot of opioid prescribing from 2006-2014 */
preserve

	destring YR, replace

    /* collapse to annual average */
    collapse (mean) PCPV, by(YR)
	
   /* set the time series by year */
         tsset YR

        /* create a line plot of opioid shipments */
         tsline PCPV, ///
			title("Time Series Plot by Year of Opioid Perscribing") ///
			xtitle("Year") ///
		 
	/* export the time series plot to output folder */
      graph export "$output/time_series.png", replace
restore

