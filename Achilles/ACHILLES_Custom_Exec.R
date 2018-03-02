.libPaths('D:\\dev\\RTOOLS\\RLibs')
Sys.setlocale(category = "LC_ALL", locale = "us")
library(SqlRender)
library(DatabaseConnector)
library(rjson)
library(utils)
library(devtools)
library(Achilles)

#Setting
cdmDatabaseSchema <-"CDM"
vocabDatabaseSchema <-"CDM_VOCA"
resultsDatabaseSchema <-"BESTCARE_RESULT"
oracleTempSchema <-resultsDatabaseSchema

connectionDetails <- createConnectionDetails(dbms="oracle", server="172.28.40.243/SNUHOS", user="BESTCARE_RESULT", password='bestcare_result', schema=resultsDatabaseSchema, port="1521")


achillesFile <- "Achilles_v5.sql"
heelFile <- "AchillesHeel_v5.sql"
hierarchyFile = "ConceptHierarchy_v5.sql"


outputPath <- "C:\\AchillesData\\20180220"
outputFolder= outputPath
sourceName = "my source name"
createTable = TRUE
smallcellcount = 5
validateSchema = FALSE
runCostAnalysis = FALSE


analysisIds = getAnalysisDetails()$ANALYSIS_ID

#Setting End


######## ######## ######## ######## achillesSql Start!! ######## ######## ######## ######## ######## ######## ######## 

achillesSql <- SqlRender::loadRenderTranslateSql(sqlFilename = achillesFile,
                                                 packageName = "Achilles",
                                                 dbms = connectionDetails$dbms,
                                                 oracleTempSchema = oracleTempSchema,
                                                 # cdm_database = cdmDatabase,
                                                 cdm_database_schema = cdmDatabaseSchema,
                                                 # results_database = resultsDatabase,
                                                 results_database_schema = resultsDatabaseSchema,
                                                 source_name = sourceName,
                                                 list_of_analysis_ids = analysisIds,
                                                 createTable = createTable,
                                                 smallcellcount = smallcellcount,
                                                 validateSchema = validateSchema,
                                                 # vocab_database = vocabDatabase,
                                                 # vocab_database_schema = vocabDatabaseSchema,
                                                 runCostAnalysis = runCostAnalysis)

conn <- DatabaseConnector::connect(connectionDetails)
writeLines("Executing multiple queries. This could take a while")
#SqlRender::writeSql(achillesSql, 'c:\\achillesDebug.sql');
DatabaseConnector::executeSql(conn,achillesSql)
writeLines(paste("Done. Achilles results can now be found in",resultsDatabaseSchema)) 

######## ######## ######## ######## achillesSql End!!  ######## ######## ######## ######## ######## ######## ######## 





######## ######## ######## ######## achillesHeels Start!! ######## ######## ######## ######## ######## ######## ######## 
heelSql <- SqlRender::loadRenderTranslateSql(sqlFilename = heelFile,
                                             packageName = "Achilles",
                                             dbms = connectionDetails$dbms,
                                             oracleTempSchema = oracleTempSchema,
                                             cdm_database_schema = cdmDatabaseSchema,
                                             # results_database = resultsDatabase,
                                             results_database_schema = resultsDatabaseSchema,
                                             source_name = sourceName, 
                                             #list_of_analysis_ids = analysisIds,
                                             createTable = createTable,
                                             smallcellcount = smallcellcount,
                                             # vocab_database = vocabDatabase,
                                             vocab_database_schema = vocabDatabaseSchema
)


writeLines("Executing Achilles Heel. This could take a while")
DatabaseConnector::executeSql(conn,heelSql)
writeLines(paste("Done. Achilles Heel results can now be found in",resultsDatabaseSchema)) 
######## ######## ######## ######## achillesHeels End!!  ######## ######## ######## ########  ######## ######## ########



######## ######## ######## ######## hierarchy End!!  ######## ######## ######## ########  ######## ######## ########
hierarchySql <- SqlRender::loadRenderTranslateSql(sqlFilename = hierarchyFile,
                                                  packageName = "Achilles",
                                                  dbms = connectionDetails$dbms,
                                                  oracleTempSchema = oracleTempSchema,
                                                  results_database_schema = resultsDatabaseSchema,
                                                  vocab_database_schema = vocabDatabaseSchema)




writeLines("Executing Concept Hierarchy creation. This could take a while")
DatabaseConnector::executeSql(conn,hierarchySql)
writeLines(paste("Done. Concept Hierarchy table can now be found in",resultsDatabaseSchema))   
######## ######## ######## ######## hierarchy End!!  ######## ######## ######## ########  ######## ######## ########



######## ######## ######## ######## indicesSql End!!  ######## ######## ######## ########  ######## ######## ########

indicesSql <- createIndices(connectionDetails = connectionDetails,
                            resultsDatabaseSchema = resultsDatabaseSchema,
                            cdmVersion = cdmVersion)
######## ######## ######## ######## indicesSql End!!  ######## ######## ######## ########  ######## ######## ########



######## ######## ######## ######## Finish Achilles Process Start ######## ######## ######## ######## ######## ######## 
DatabaseConnector::disconnect(conn)

resultsConnectionDetails <- connectionDetails
resultsConnectionDetails$schema = resultsDatabaseSchema
result <- list(resultsConnectionDetails = resultsConnectionDetails, 
               resultsTable = "ACHILLES_results",
               resultsDistributionTable ="ACHILLES_results_dist",
               analysis_table = "ACHILLES_analysis",
               sourceName = sourceName,
               analysisIds = analysisIds,
               AchillesSql = achillesSql,
               HeelSql = heelSql, #if runHeel is false -  this assignment fails - causes error of the  whole function  (adding else)
               call = match.call())
class(result) <- "achillesResults"
result

######## ######## ######## ######## Finish Achilles Process Start ######## ######## ######## ######## ######## ######## 