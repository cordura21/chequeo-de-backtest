library(readr)
library(stringr)
hf_list <- readr::read_csv('barclay_admin_file.csv')
hf_names <- unique(hf_list$Fund_Name)
hf_fields <- c('Fund_Name','Fund_AUM_USD','Fund_Management_Fee','Fund_Inception_Date')

tf_wizards <- vector()
hf_names[str_detect(hf_names,'Campbell')]

tf_wizards <- c(tf_wizards,"Campbell & Co. (Trend Following)")

hf_list[str_detect(hf_names,'Abraham'),hf_fields]
tf_wizards <- c(tf_wizards,"Abraham Trading Company")

hf_list[str_detect(hf_names,'Altis'),hf_fields]
tf_wizards <- c(tf_wizards,"Altis Partners (GFP Composite)")

hf_list[str_detect(hf_names,'Aspect'),hf_fields]
tf_wizards <- c(tf_wizards,"Aspect Capital (Div. Fund)")

hf_list[str_detect(hf_names,'Beach'),hf_fields]
tf_wizards <- c(tf_wizards,"Beach Horizon LLP")

hf_list[str_detect(hf_names,'Chesap'),hf_fields] 
tf_wizards <- c(tf_wizards,"Chesapeake Capital Corp. (Divers.)")

hf_list[str_detect(hf_names,'Clarke'),hf_fields] 
tf_wizards <- c(tf_wizards,"Clarke Cap'l Mgmt. (Worldwide)")

hf_list[str_detect(hf_names,'Coven'),hf_fields] 
tf_wizards <- c(tf_wizards,"Covenant Capital Mgmt (Original)")

hf_list[str_detect(hf_names,'Drury'),hf_fields] 
tf_wizards <- c(tf_wizards,"Drury Capital (Diversified)")

hf_list[str_detect(hf_names,'DUNN'),hf_fields] 
tf_wizards <- c(tf_wizards,"DUNN Capital Mgmt. (WMA)")

hf_list[str_detect(hf_names,'Eckh'),hf_fields] 
tf_wizards <- c(tf_wizards,"Eckhardt Trading (Standard)")

hf_list[str_detect(hf_names,'EMC'),hf_fields] 
tf_wizards <- c(tf_wizards,"EMC Capital Advisors (Classic)")

hf_list[str_detect(hf_names,'Estland'),hf_fields] 
tf_wizards <- c(tf_wizards,"Estlander & Partners (Alpha Trend)")

hf_list[str_detect(hf_names,'Graham'),hf_fields] 
tf_wizards <- c(tf_wizards,"Graham Capital Mgmt (K4D-15V)")

hf_list[str_detect(hf_names,'Hawks'),hf_fields] 
tf_wizards <- c(tf_wizards,"Hawksbill Capital Mgmt. (Gl. Divers.)")

hf_list[str_detect(hf_names,'Hyman'),hf_fields] 
tf_wizards <- c(tf_wizards,"Hyman Beck (Global)")

hf_list[str_detect(hf_names,'ISAM'),hf_fields] 
tf_wizards <- c(tf_wizards,"ISAM Systematic - USD")

hf_list[str_detect(hf_names,'Lynx'),hf_fields]
tf_wizards <- c(tf_wizards,"Lynx Asset Mgmt (Lynx)") 

hf_list[str_detect(hf_names,'AHL'),hf_fields]
tf_wizards <- c(tf_wizards,"Man (AHL Div. plc)")

hf_list[str_detect(hf_names,'Walsh'),hf_fields]
tf_wizards <- c(tf_wizards,"Walsh, Mark J. & Co. (Standard)")

hf_list[str_detect(hf_names,'Millburn'),hf_fields]
tf_wizards <- c(tf_wizards,"Millburn Ridgefield Corp (Divers.)")

hf_list[str_detect(hf_names,'Mulvaney'),hf_fields]
tf_wizards <- c(tf_wizards,"Mulvaney Capital Mgmt. (Gl. Markets)")

hf_list[str_detect(hf_names,'Quantica'),hf_fields]
tf_wizards <- c(tf_wizards,"Quantica Capl (Managed Futures)")

hf_list[str_detect(hf_names,'Rabar'),hf_fields]
tf_wizards <- c(tf_wizards,"Rabar Market Research (Diversified)")

hf_list[str_detect(hf_names,'Saxon'),hf_fields]
tf_wizards <- c(tf_wizards,"Saxon Invest. Corp. (Aggress. Divers)")

hf_list[str_detect(hf_names,'Sunrise'),hf_fields]
tf_wizards <- c(tf_wizards,"Sunrise Cap'l Partners (Evolution)")

hf_list[str_detect(hf_names,'Tactical'),hf_fields]
tf_wizards <- c(tf_wizards,"Tactical Invest. Mgmt. (Inst'l Comm)")

hf_list[str_detect(hf_names,'Transtr'),hf_fields] 
tf_wizards <- c(tf_wizards,"Transtrend (DTP/Enhanced Risk - USD)")

hf_list[str_detect(hf_names,'Winton'),hf_fields]
tf_wizards <- c(tf_wizards,"Winton Capital Mgmt. (Futures Fund)")

hf_list[str_detect(hf_names,'BlueTr'),hf_fields]
tf_wizards <- c(tf_wizards,"Systematica (BlueTrend Fund)")

# data.frame(tf_wizards) %>% View()

