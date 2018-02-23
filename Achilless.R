Sys.setlocale(category = "LC_ALL", locale = "us")
install.packages("devtools")
install_github("ohdsi/SqlRender")
install_github("ohdsi/DatabaseConnector")
install_github("ohdsi/Achilles")

library(Achilles)
library(devtools)

connectionDetails <- createConnectionDetails(dbms="oracle", 
                                             server="localhost/orcl", 
                                             user="CDM_ONE_MIL",
                                             password='cdm_one_mil', 
                                             schema="CDM_ONE_MIL", 
                                             port="1521")

conn <- connect(connectionDetails)

achillesResults <- achilles(connectionDetails, cdmDatabaseSchema="CDM_ONE_MIL", 
                            resultsDatabaseSchema="CDM_ONE_MIL",  
                            cdmVersion = "5", vocabDatabaseSchema="CDM_ONE_MIL")


selectedReports <- c(
  "CONDITION",
  #                "CONDITION_ERA",
  "DASHBOARD",
  #                "DATA_DENSITY",
  "DEATH",
  #                "DRUG",
  #                "DRUG_ERA",
  #                "HEEL",
  "OBSERVATION",
  #                "OBSERVATION_PERIOD",
  "PERSON",
  #                "PROCEDURE",
  "VISIT",
  "MEASUREMENT"
  #                "META")
)


exportToJson(connectionDetails, 
             cdmDatabaseSchema = "CDM_ONE_MIL", 
             resultsDatabaseSchema = "CDM_ONE_MIL", 
             outputPath = "D:/NHIS_DATA/ORACLE/CDM/CDM_20180222", 
             cdmVersion = "5",
             reports = selectedReports,
             vocabDatabaseSchema = "CDM_ONE_MIL")
