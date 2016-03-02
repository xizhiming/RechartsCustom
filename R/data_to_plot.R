echarts_plot <- function(id,height='400px',width='600px',option){
#option是一个包含各种tag的向量
  require(htmltools)
  option <- paste(option,sep='',collapse='')
  echarts_tags <- tags$div(id=id,
                           style=paste("height:",height,";width:",width,";",sep=""),
                           #tags$script(src="http://echarts.baidu.com/build/dist/echarts-all.js"),
                           tags$script(type="text/javascript",
                                       paste("var myChart = echarts.init(document.getElementById('",id,"'),'macarons');
                                              var option = {",option,"};
                                              myChart.setOption(option);",
                                             sep="")
                                       )
                          )
  attachDependencies(echarts_tags,
                     htmlDependency("RechartsCustom",
                                    as.character(utils::packageVersion("RechartsCustom")),
                                    c(file = system.file(package = "RechartsCustom")),
                                    #script = list("echarts-all-2.0.js")
                                    script = list("echarts.min-3.0.js","map.js","theme.js")
                                    )
                     )
}
