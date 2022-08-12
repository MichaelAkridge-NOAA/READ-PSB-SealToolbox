
#

tagTable <- eventReactive(input$k, {
  if (input$tagtype == "research"){
  nova <- odbcConnect("nova", uid="TTS", pwd="m1les0ch5+??",believeNRows=FALSE)
#  novaNew <- DBI::dbConnect(odbc::odbc(), dsn = 'nefscdb1.nmfs.local', uid="TTS", pwd="m1les0ch5+??", SERVICE_NAME = "NEFSC_USERS")
#  sole_con <- DBI::dbConnect(odbc::odbc(), dsn = 'sole', uid="RIGHTWHALESIGHT", pwd="m1les0ch5+??")
  
  
  
    #sql <- paste("select tagnum, to_char(dateland, 'dd-MON-yyyy') as tagdate, cruisenum, spcode, ageclassdesc as ageclass, sex from directedtakes d left join ageclass a on d.ageclass=a.ageclasscode where tagnum in ('",input$txt,"')", sep="")
    sql <- paste("select * from directedtakestidy where tagnum in ('",input$txt,"')", sep="")
    
    tag<-sqlQuery(nova, sql)
    tag<-data.frame(tag, stringsAsFactors = FALSE)

  }
  else if (input$tagtype == "bycatch"){
    nova <- odbcConnect("nova", uid="MAMMAL_BYCATCH", pwd="pNESPP4b+??+",believeNRows=FALSE)
 
    sql <- paste("select tagnum1, comname, negear, year, tripid from allhauincspec where tagnum1 in ('",input$txt,"')", sep="")
    
    tag<-sqlQuery(nova, sql)
    tag<-data.frame(tag, stringsAsFactors = FALSE)  
  }
  
  return(tag)
})




# 
# #outputs
output$tagtable <- renderTable({
  tagTable()
})
#output$tagtable2 <- renderTable({
#  tagTable()
  
#})

#
#

#works
#nova <- odbcConnect(dsn="nova", uid="TTS", pwd="m1les0ch5+??",believeNRows=FALSE)
#or...
#novaDBI <- DBI::dbConnect(odbc::odbc(), dsn = 'NEFSCDB1.nmfs.local:1526/NEFSC_USERS', uid="TTS", pwd="m1les0ch5+??")

#not working
#novanew <- odbcConnect(dsn="nefscdb1.nmfs.local", dbname="NEFSC_USERS", uid="TTS", pwd="m1les0ch5+??",believeNRows=FALSE)
#novanew <- odbcConnect(dsn="NEFSC_USERS", uid="TTS", pwd="m1les0ch5+??",believeNRows=FALSE)
#novanewDBI <- DBI::dbConnect(odbc::odbc(), dsn = "nefscdb1.nmfs.local", uid="TTS", pwd="m1les0ch5+??", dbname="NEFSC_USERS")
#novanewDBI <- DBI::dbConnect(odbc::odbc(), dsn = "nefscdb1.nmfs.local", uid="TTS", pwd="m1les0ch5+??")