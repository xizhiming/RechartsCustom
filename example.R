library(RechartsCustom)
library(shiny)
library(shinydashboard)
library(htmltools)
#柱形图或折线图数据
data_line_bar <- data.frame('日期'=c('3-1','3-2','3-3','3-4','3-5'),
                            '最高'=c(35,45,40,35,55),
                            '中间'=c(25,35,30,25,45),
                            '最低'=c(15,25,20,15,35))
data_line_bar[,1] <- as.character(data_line_bar[,1])

data_line_bar_2 <- data.frame('日期'=c('3-1','3-2','3-3','3-4','3-5'),
                            '最高'=c(35,45,40,35,55)
                            )
data_line_bar_2[,1] <- as.character(data_line_bar_2[,1])

data_line_bar_3 <- data.frame('日期'=c('3-1'),
                            '最高'=c(35),
                            '中间'=c(25),
                            '最低'=c(15))
data_line_bar_3[,1] <- as.character(data_line_bar_3[,1])
#饼图数据
data_pie <- data.frame('直接访问'=100,
                       'SEO'=200,
                       'SEM'=180,
                       'REF'=234
)
#漏斗图数据
data_funnel <- data.frame('点击'=100,
                          '下单_111112'=50,
                          '支付1111'=20,
                          '收货565'=19)
#地图数据
data_map_SH <- data.frame("崇明县"=120)
data_map_BJ <- data.frame("密云县"=120)
##########################################################################
body <- dashboardBody(
  echarts_plot(id="line-bar",height='400px',width='800px',
               option=c(tooltip_fun(formatter="{b}:{c}"),
                        legend_fun(data=colnames(data_line_bar)[2:4]),
                        toolbox_fun(),
                        xAxis_fun(data=data_line_bar[,1]),
                        yAxis_fun(),
                        series_rectangular(data_line_bar[,c(2,3,4)],type='line')
                        )
               ),
  echarts_plot(id="line-bar_2",height='400px',width='800px',
               option=c(tooltip_fun(formatter="{b}:{c}"),
                        legend_fun(data=colnames(data_line_bar_2)[2]),
                        toolbox_fun(),
                        xAxis_fun(data=data_line_bar_2[,1]),
                        yAxis_fun(),
                        series_rectangular(data.frame("最高"=data_line_bar_2[,2]),type='line')
               )
  ),
  echarts_plot(id="line-bar_3",height='400px',width='800px',
               option=c(tooltip_fun(formatter="{b}:{c}"),
                        legend_fun(data=colnames(data_line_bar_3)[2:4]),
                        toolbox_fun(),
                        xAxis_fun(data=data_line_bar_3[,1]),
                        yAxis_fun(),
                        series_rectangular(data_line_bar_3[,2:4],type='line')
               )
  ),
  echarts_plot(id="pie",
               option=c(tooltip_fun(formatter="{b}:{c}({d}%)"),
                        series_pie(data_pie)
                        )
               ),
  echarts_plot(id="funnel",
               option=c(tooltip_fun(formatter="{b}:{c}%"),
                        series_funnel(data_funnel,gap=3)
                        )
               ),
  echarts_plot(id="map_SH",
               option=c(tooltip_fun(formatter="{b}:{c}"),
                        visualMap_fun(show=TRUE,max=150),
                        series_map(data=data_map_SH,mapType='上海')
                        )
               ),
  echarts_plot(id="map_BJ",
               option=c(tooltip_fun(formatter="{b}:{c}"),
                        visualMap_fun(max=150),
                        series_map(data=data_map_BJ,mapType='北京')
                        )
               )
)

ui <- dashboardPage(
  dashboardHeader(title="百度Echart测试"),
  dashboardSidebar(disable = TRUE),
  body
)

server <- function(input, output) { }

shinyApp(ui, server)
