\name{RechartsCustom}
\alias{RechartsCustom}
\title{Echarts with shiny}
\usage{
none
}
\description{
Echarts with shiny
}
\examples{
library(RechartsCustom)
library(shiny)
library(shinydashboard)
data_line_bar <- data.frame('日期'=c('3-1','3-2','3-3','3-4','3-5'),
                            '最高'=c(35,45,40,35,55),
                            '中间'=c(25,35,30,25,45),
                            '最低'=c(15,25,20,15,35))
data_pie <- data.frame('直接访问'=1,
                       'SEO'=2,
                       'SEM'=3,
                       'REF'=1
)
data_funnel <- data.frame('点击_22222'=100,
                          '下单_111112'=30,
                          '支付1111'=20,
                          '收货565'=15)
option_value <- paste(
  tooltip_fun(),
  legend_fun(data=colnames(data)[2:4]),
  toolbox_fun(show="TRUE"),
  xAxis_fun(data=data_line_bar[,1]),
  yAxis_fun(),
  series_rectangular(data_line_bar[,c(2,3,4)],type=c('line','line','bar')),
  seq=""
)

option_value_pie <- paste(
  tooltip_fun(trigger = 'item',formatter="{b}:{c}({d}%)"),
  series_pie(data_pie),
  seq=""
)

option_value_funnel <- paste(
  tooltip_fun(trigger = 'item',formatter="{b}:{c}%"),
  series_funnel(data_funnel,gap=3),
  seq=""
)


body <- dashboardBody(
  tags$script(src="http://echarts.baidu.com/build/dist/echarts-all.js"),
  data_to_plot_fun(id="main",data=option_value),
  data_to_plot_fun(id="main_1",data=option_value_pie ),
  data_to_plot_fun(id="main_2",data=option_value_funnel)
)

ui <- dashboardPage(
  dashboardHeader(title="百度Echart测试"),
  dashboardSidebar(disable = TRUE),
  body
)

server <- function(input, output) { }

shinyApp(ui, server)

}
