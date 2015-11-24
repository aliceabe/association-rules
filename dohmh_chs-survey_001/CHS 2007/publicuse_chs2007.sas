******************instructions for accessing CHS data******************

FILENAME:	chs07_publicuse.sas7bdat

1) Save the dataset and this program to your computer.
2) Change the pathnames and libname statements to reflect
where you have saved the data.

In order to correctly analyze Community Health Survey Data for 
estimates of health indicators, you MUST use computer software able
to adjust for the survey's complex design.  This program provides 
example code for using SAS-callable SUDAAN to analyze the data.
Other programs with survey-analysis modules include SAS (survey
module), STATA and SPSS. 

This program also attaches the formats to the library name.
The stratification (nesting) variable is UHF34.
The survey weight variable is wt8.
 
For more information, please contact:
NYC Department of Health & Mental Hygiene
Bureau of Epidemiology Services
EpiDatarequest@health.nyc.gov
**********************************************************************;

libname chs 'Q:\Data Available Online\Public Use Datasets\2007';

proc format;

	value sex
		1 = 'Male'
		2 = 'Female';
	value newrace
		1 = 'White'
		2 = 'Black'
		3 = 'Hispanic'
		4 = 'Asian/Pacific Islander'
		5 = 'Other';/*includes multi-race, Native American, other*/	
    value insurefive
		1 = 'Private'
		2 = 'Medicare'
		3 = 'Medicaid'
		4 = 'Other'
		5 = 'Uninsured';
	value yesno
		1 = 'Yes'
		2 = 'No';
	value health 
		1 = 'Excellent'
		2 = 'Very Good'
		3 = 'Good'
		4 = 'Fair'
		5 = 'Poor';
    value uhf34f 
	    1 = '101 Kingsbridge'
	    2 = '102 NE Bronx'		      
		3 = '103 Fordham-Bronx Pk'		  
		4 = '104 Pelham-Throgs Neck'		  
		5 = '105/106/107 South Bronx'		  
		6 = '201 Greenpoint'		  
		7 = '202 Downtown-Heights-Slope'		  
		8 = '203 Bed Stuy-Crown Heights'		  
		9 = '204 East New York'		  
	   10 = '205 Sunset Park'		  
	   11 = '206 Borough Park'		  
	   12 = '207 Flatbush'   		  
	   13 = '208 Canarsie' 		  
	   14 = '209 Bensonhurst' 		  
	   15 = '210 Coney Island'
	   16 = '211 Williamsburg-Bushwk'
	   17 = '301 Washington Heights'
	   18 = '302 Central Harlem'  	
	   19 = '303 East Harlem' 
       20 = '304 Upper West Side'
	   21 = '305/307 Upper East Side-Gramercy'
       22 = '306/308 Chelsea-Village'
	   23 = '309/310 Union Square-Lower Manhattan'
	   24 = '401 LIC, Astoria'
	   25 = '402 West Queens'
	   26 = '403 Flushing'
	   27 = '404/406 Bayside Little Neck-Fresh Meadows'
	   28 = '405 Ridgewood'
	   29 = '407 SouthWest Queens' 
	   30 = '408 Jamaica'  
	   31 = '409 SouthEast Queens'
	   32 = '410 Rockaway'
	   33 = '501/502 Northern SI'
	   34 = '503/504 Southern SI';
	value boro
		1 = 'Bronx'
		2 = 'Brooklyn'
		3 = 'Manhattan'
		4 = 'Queens'
		5 = 'Staten Island';
	value educat
		1 = 'Less than high school'
		2 = 'High school graduate'
		3 = 'Some college/technical school'
		4 = 'College graduate';
	value agegrp
		1 = '18 - 24'
		2 = '25 - 44'
		3 = '45 - 64'
		4 = '65+';
	value age50up
		1 = '50 - 64'
		2 = '65+';
    value age40new
		1 = '40 - 44'
		2 = '45 - 64'
		3 = '65+';
	value age45up
		1 = '45 - 64'
		2 = '65+';
	value poverty 
		1 = '<100% poverty'
		2 = '100% - <200% poverty'
		3 = '200% - < 400% poverty'
		4 = '400% - < 600% poverty'
		5 = '> 600% poverty'
		6 = 'Dont know';
	value born
		1 = 'US born'
		2 = 'Foreign born';
	value smoker
		1 = 'Never'
		2 = 'Current'
		3 = 'Former';
	value wt
		1 = 'Under/normal weight'
		2 = 'Over weight'
		3 = 'Obese';
	value marital 
		1 = 'Married'
		2 = 'Divorced'
		3 = 'Widowed'
		4 = 'Separated'
		5 = 'Never married'
		6 = 'A member of unmarried couple';/* in '07 choice was 'A member of an unmarried couple LIVING TOGETHER'*/
	value partner 
		1 = 'None'
		2 = 'One'
		3 = 'Two'
		4 = 'Three or more';
	value smokeage
		1 = '1 - 9 yrs'
		2 = '10 - 12 yrs'
		3 = '13 - 17 yrs'
		4 = '18 - 22 yrs'
		5 = '>= 23 yrs';	
	value taxav		
		1='Outside of NYC'
		2='In NYC'
		3='Cannot be determined';
	value insureall 
		1 = 'Continuously insured in the past 12 months'
		2 = 'Insured now but uninsured in the past 12 months'
		3 = 'Uninsured';
	value dpho
		1 = 'South Bronx'
		2 = 'East and Central Harlem'
		3 = 'North and Central Brooklyn'
		4 = 'All Other Neighborhoods';
	value employ07f
        1 = 'Employed for wages or salary'
        2 = 'Self-employed'
        3 = 'Unemployed for 1 year or more'
        4 = 'Unemployed for less than 1 year'
        5 = 'A homemaker'
        6 = 'A student'
        7 = 'Retired'
        8 = 'Unable to work';
	value howlong
		1 = '<5 yrs'
		2 = '5 - 9 yrs'
		3 = '10+ yrs';
	value athome
		1 = 'English'
		2 = 'Spanish'
		3 = 'Russian'	
		4 = 'Chinese'	/* '07 added: Chinese (includes Mandarin & Cantonese)*/
		5 = 'Indian'	/* '07 added: Indian (includes Hindi & Tamil)*/
		6 = 'Other';
	value fmds
		1 = '0 - 13 days'
		2 = '14+ days';
	value isolate
		1='At risk for social isolation'
		2='Not at risk';
	value hp
		1 = 'Mod/vig HP2010'
		2 = 'Some mod/vig but not HP2010'
		3 = 'No mod/vig PA';
	value cycl07f
		1 = 'Several times a month'
		2 = 'At least once a month'
		3 = 'A few times a year'
		4 = 'Never';
	value helmet
		1 = 'Always'
		2 = 'Most of the time'
		3 = 'Sometimes'
		4 = 'Rarely'
		5 = 'Never';
	value ndrnkcat
		1 = '>=2 sodas per day'
		2 = '<2 sodas per day';
	value sexual
		1 = 'Heterosexual'
		2 = 'Gay/Lesbian'
		3 = 'Bisexual';
	value analsex
		1 = 'Every time'
		2 = 'Some of the time'
		3 = 'Never';
    value visitdds
	    1 = 'less than 12 months ago'  
        2 = '1 year ago but less than 2 years ago'  
        3 = '2 years ago but less than 3 years ago'  
        4 = '3 years ago but less than 5 years ago, or'  
        5 = '5 or more years ago';
run;

data chs07; set chs.chs07_public;
	format 
		agegroup agegrp.
		age40new age40new.
		age50up age50up.
		age45up age45up.
		sex sex.
		newrace newrace.
		borough boro.
		dphonew06 dpho.
		education educat.
		employment07 employ07f.
		povertygroup poverty.
		usborn born.
		uhf34 uhf34f.
		howlonginus howlong.
		athomelang07 athome.
		maritalstatus07 marital.
		generalhealth health.
		fmd fmds.
		social_isolation isolate.
		weightall wt.
		
		healthus07 hp.
		tenblocks07 yesno.
		cycling07 cycl07f.
		cyclinghelmetuse helmet.
		twoplussoda  ndrnkcat.
		insure5 insurefive.
		insuredallyr insureall.
		managedcare yesno.
		pcp07 yesno.
		visitpcp12m yesno.
		anymedvisit12m yesno.
		didntgetcare07 yesno.
		didntgetdental yesno.
		visitdds07 visitdds.
		didntgetmeds yesno.
		toldhighbp07 yesno.
		toldprescription07 yesno.
		takingmeds07 yesno.
		toldhighcholesterol07 yesno.
		cholesterol5yrs07 yesno.
		colonoscopy10yr07 yesno.
		mammogram2yr07 yesno.
		paptest3yrall07 yesno.
		smoker smoker.
		triedtoquit yesno.
		taxavoid taxav.
		agesmkever smokeage.
		shswork yesno.
		heavydrink07 yesno.
		binge07 yesno.
		tolddepression yesno.
		firsttolddepression07 yesno.
		treatdepression yesno.
		everasthma yesno.
		currentasthma07 yesno.
		everhivtest07 yesno.
		hiv12months07 yesno.
		recommendedhivtest07 yesno.
		sexualid sexual.
		sexpartner partner.
		msm yesno.
		wsw yesno.
		analsexcondomuse analsex.
		ecpills yesno.
		diabetes07 yesno.
		fluvaccineshot yesno.
		acinhome yesno.;

run;

/********Instructions for analyzing CHS 2007 data*****************
Survey data needs to be analyzed using a special procedure in SAS --
proc surveymeans  - or using SUDAAN or another software package that
can handle complex survey designs.  

If you are only interested in point estimates (i.e. you do not
need standard errors/confidence intervals) using the weight
option in regular SAS procedures, will give the correct point estimates.  However,
in order to get confidence intervals you must use proc surveymeans or 
another software program capable of accounting for the complex survey design.
************************************************************************************/

**Sample code: Standard errors will not be correct with regular SAS procs, but point 
estimates will be fine. Remember to use the weight statement;
proc freq data = chs07;
	tables sex*(pcp07  generalhealth);
	weight wt8; 
run;

**Sample code for proc surveymeans - standard errors are correct.
Same point estimates as code above;
proc surveymeans data = chs07 nobs mean clm sum std clsum ;
	strata uhf34;  *survey design information;
	weight wt8; *weight statement;
	var pcp07 generalhealth; *variables you are interested in analyzing;
	class pcp07 generalhealth; *all variables in var statement that are categorical;
	domain sex;  *stratification variable;
run;

**Sample code for SUDAAN, proc descript**;
/*MUST SORT DATA BY STRATIFICATION VARIABLE FIRST*/
proc sort data=chs07; by uhf34; run;
/*NOW RUN PROC DESCRIPT*/
proc descript data=chs07 filetype=sas design=strwr;
nest uhf34; *survey strata variables*;
weight wt8; *survey weight variable*;
var    pcp07 pcp07 generalhealth generalhealth generalhealth generalhealth generalhealth; *variables you are interested in analyzing; ;
catlevel 1       2        1      2              3             4             5; *specify the levels of each variable you want *;
tables _one_ sex; *_one_ will give you the overall total for each variable: sex will produce the gender-specific estimates*;
subgroup _one_ sex agegroup; *all variables on the tables statement must also be in the subgroup statement. agegroup is needed for age-adjustment*;
levels    1     2   4; *specify the levels of the variables above*;
/*for age-adjustment of estimate: use the US 2000 Standard Population*/
stdvar agegroup; 
stdwgt 0.128810 0.401725 0.299194 0.170271;/*These weights are for agegroup total: different age adjustment weights are needed for variables that use other agegroups*/
print/style=nchs; *will print the results*;
output/filename=output07 filetype=sas tablecell=default replace; *produces a output dataset of results*;
title1 'Prevalence of Regular Health Care Provider and General Health Status, by Gender: CHS2007';
run;

/*Compute the relative standard error of the estimates:
  Estimates with RSE >=0.30 are considered unstable*/
data rsecheck; set output07; *use the output dataset created from the proc descript*;
 RSE = sepercent/percent;
 proc print;
  var SEX VARIABLE PERCENT RSE;
  where RSE>=0.3;
  run;

  /*For more details on age-adjustement, see:
  Klein RJ, Schoenborn CA. Age adjustment using the 2000 projected U.S. population. Healthy
  People Statistical Notes, no. 20. Hyattsville,Maryland: National Center for Health Statistics.
  January 2001. http://www.cdc.gov/nchs/data/statnt/statnt20.pdf */




