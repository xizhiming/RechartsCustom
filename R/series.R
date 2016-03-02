#折线图、柱状图
series_rectangular <- function(data,type,itemStyle=FALSE){
  list_name <- colnames(data)
  colnames(data) <- NULL
  data <- as.list(data)
  #type可以使单个值line或者bar,或者是c("line","bar")
  if(length(type)==1){type <- rep(type,length(data))}
  for(i in seq(length(data))){
    #加一个0是为了保证当只有一列的时候，转jason的时候可以带上[]方括号
    data[[i]] <- list(name=list_name[i],type=type[i],data=c(data[[i]],0),
                      itemStyle=list(normal=list(label=list(show=itemStyle,formatter='{c}'))))
  }
  return(gsub(",0]","]",paste("series:",rjson::toJSON(data),sep="")))
}
#饼图
series_pie <- function(data,type='pie',radius='55%'){
  list_name <- colnames(data)
  colnames(data) <- NULL
  data <- as.list(data)
  for(i in seq(length(data))){
    data[[i]] <- list(name=list_name[i],value=data[[i]])
  }
  paste("series:",rjson::toJSON(list(list(type='pie',radius='55%',data=data))),sep="")
}
#地图
series_map <- function(data,
                       mapType,
                       itemStyle.normal=FALSE,
                       itemStyle.emphasis=FALSE){
  list_name <- colnames(data)
  colnames(data) <- NULL
  data <- as.list(data)
  for(i in seq(length(data))){
    data[[i]] <- list(name=list_name[i],value=data[[i]])
  }
  paste("series:",
        rjson::toJSON(list(list(type='map',
                                mapType=mapType,
                                data=data,
                                itemStyle=list(normal=list(label=list(show=itemStyle.normal)),
                                               emphasis=list(label=list(show=itemStyle.emphasis))
                                               )
                                ))),sep="")
}
#漏斗图
series_funnel <- function(data,type='funnel', sort='descending',
                          gap=5,width='100%',x=0,y=0){
  list_name <- colnames(data)
  colnames(data) <- NULL
  data <- as.list(data)
  for(i in seq(length(data))){
    data[[i]] <- list(name=list_name[i],value=data[[i]])
  }
  paste("series:",
        rjson::toJSON(list(list(data=data,
                                type=type,
                                sort=sort,
                                gap=gap,
                                width=width,
                                x=x,
                                y=y,
                                itemStyle=list(normal=list(label=list(show=TRUE,position='inside')))
        ))),
        sep="")
}
