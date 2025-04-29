-- Recod Count: Determine the total number of records in the dataset
SELECT inter_dom, COUNT(*) AS Total_Rows
FROM mental_health_data
group by inter_dom;

-- Data Exploration and cleaning
SELECT *
FROM mental_health_data
where
	`index` IS NULL OR
    inter_dom IS NULL OR
	region	 IS NULL OR
    gender	 IS NULL OR
    academic  IS NULL OR
	age  IS NULL OR
    age_cate  IS NULL OR
	stay IS NULL OR
    stay_cate  IS NULL OR
	japanese  IS NULL OR
	japanese_cate  IS NULL OR
    english  IS NULL OR
	english_cate IS NULL OR 
    intimate  IS NULL OR
	religion  IS NULL OR
	suicide  IS NULL OR
    dep  IS NULL OR
	deptype  IS NULL OR
    todep  IS NULL OR
	depsev  IS NULL OR
	tosc  IS NULL OR
	apd  IS NULL OR
	ahome IS NULL OR
	aph	 IS NULL OR
    afear  IS NULL OR
	acs  IS NULL OR
	aguilt  IS NULL OR
	amiscell  IS NULL OR
	toas  IS NULL OR
    partner  IS NULL OR
	friends  IS NULL OR
	parents  IS NULL OR
	relative  IS NULL OR
	profess  IS NULL OR
	phone  IS NULL OR
	doctor  IS NULL OR
	reli  IS NULL OR
	alone  IS NULL OR
	others  IS NULL OR
	internet  IS NULL OR
	partner_bi  IS NULL OR
	friends_bi  IS NULL OR
	parents_bi  IS NULL OR
	relative_bi  IS NULL OR
	professional_bi  IS NULL OR
	phone_bi  IS NULL OR
	doctor_bi  IS NULL OR
	religion_bi  IS NULL OR
	alone_bi  IS NULL OR
	others_bi  IS NULL OR
	internet_bi  IS NULL;
    
    

