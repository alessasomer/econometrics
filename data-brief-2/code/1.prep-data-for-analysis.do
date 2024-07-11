/********************************************************************************\
  Project: ECON 255 - Data Brief 2

  File Name: prep-data-for-analysis.do

  Description: This program prepares the household pulse data for analysis

			  
  Data source: https://www.census.gov/programs-surveys/household-pulse-survey/datasets.html
*******************************************************************************/


	/* import raw csv of household pulse data */
		import delimited "$data/raw/household-pulse/pulse2023_puf_62.csv", clear
		
		

/******************************************************************************/      
/************************    clean the data  **********************************/          
/******************************************************************************/


	/* only keep data for states in the Appalacia region */
	/* keep if F12424 == "OH" | F12424 == "WV" | F12424 == "KY" | F12424 == "PA" | F12424 == "MD" */

	/*Employment status variable: 'anywork' - 1) yes 2) no -99) question seeen but on answered 88)not seen */
	order anywork
	
	/* Food security variable: 'CURFOODSUF' - household food sufficiency for last 7 days. 1- "enough of the kinds of food (I/we wanted to eat)" 2- "Enough but not always the kinds of food (I/we wanted to eat)" 3- "sometimes not enough to eat" 4- "often not enough to eat" -99-"question seen but category not selected" -88 - "missing/did not report" */
	
	order curfoodsuf
	keep if curfoodsuf == 1 | curfoodsuf == 2 | curfoodsuf == 3 | curfoodsuf == 4 
	
	/* Housing security variable: 'evict' - eviction in next two months 1) very likely 2) somewhat likely 3) not very likely 4) not likely at all -99) question seen but category not selected -88) missing/ did not report */
	 
	 order evict
	/*Housing security variable: 'rentcur' - caught up on rent - 1) yes 2)no -99) question seen but category not selected -88) missing / did not report */
	order rentcur
	
	/* Housing security variable: 'expns_dif' - difficulty with expenses - "in the last 7 days, how difficult has it been for your household to pay for usual household expenses, including but not limited to food, rent, or mortgage, car payments, medicail expensises and so on? 1) not at all difficult 2) a little difficult 3)somewhat difficult 4) very difficult -99) question seen but category not selected -88) missing /did not report */
	order expns_dif
	/* get rid of missing data for expns_dif */ 
	keep if expns_dif == 1 | expns_dif == 2 | expns_dif == 3 | expns_dif == 4 
	
	/* Access to Healthcare variable: 'HLTHINS1' - Health Insurance Coverage- Insurance through a current or former employer or union (through yourself or another family member) 1) yes 2) no -99) saw no answer -88) didnt see */
	order hlthins1
	gen health_security = (hlthins1 == 1)
	
	/* create binary variable for employment */
  gen employed = (anywork == 1)
  order employed
  
   gen rent_yes = (rentcur == 1)
   order rent_yes
   
   /* to calculate age: 2023- birthdayer*/
	gen age = 2023 - tbirth_year
	order age
		
	/* save the cleaned data */ 
		save "$data/data-for-analysis.dta", replace
			
			
			
			
			