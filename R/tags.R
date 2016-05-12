#提示框组件,鼠标选中后展示的内容
tooltip_fun <- function(show=TRUE,trigger='item',formatter=NULL){
  #axis显示系列之，item显示单项值
  paste("tooltip:",
        jsonlite::toJSON(list(show=show,trigger=trigger,formatter=formatter),auto_unbox=TRUE),
        ",",sep="")
  }
#图例组件,图例组件展现了不同系列的标记(symbol)，颜色和名字。可以通过点击图例控制哪些系列不显示。
legend_fun <- function(data,orient='horizontal',x='center',y='top'){
  #orient,布局方式:horizontal为水平放置，vertical为垂直放置
  #x,水平安放位置:'center'为全图居中，可选为'center'|'left'|'right'|{..px}
  #y,垂直安放位置:'top'为全图顶端，可选为'top'|'bottom'|'center'|{..px}
  paste("legend:",
        jsonlite::toJSON(list(data=as.character(data),orient=orient,x=x,y=y),auto_unbox=TRUE),
        ",",sep="")
}
#工具箱。内置有导出图片，数据视图，动态类型切换，数据区域缩放，重置五个工具。
toolbox_fun <- function(show="true",orient='vertical',magicType.type=c('line', 'bar')){
  paste("toolbox:",
        jsonlite::toJSON(list(show=show,
                           orient=orient,
                           feature=list(
                             restore=list(show="true"),
                             magicType=list(show="true",type=magicType.type),
                             saveAsImage=list(show="true")
                             )),auto_unbox=TRUE),
        ",",sep="")
  }
#直角坐标系的X轴
xAxis_fun <- function(data,type="category",boundaryGap='false',position="bottom"){
  paste("xAxis:",
        jsonlite::toJSON(list(list(type=unbox(type),
                                   boundaryGap=unbox(boundaryGap),
                                   position=unbox(position),
                                   data=as.character(data))
        ),auto_unbox=FALSE),
        ",",sep="")
  }
#直角坐标系的y轴
yAxis_fun <- function(type="value",position="left"){
  paste("yAxis:",
        jsonlite::toJSON(list(list(type=type,position=position)),auto_unbox=TRUE),
        ",",sep="")
}
#地图的图例
#2.0版本的dataRange update to 3.0 版本的visualMap
visualMap_fun <- function(show=FALSE,
                          min=0,
                          max,
                          left='left',
                          top='bottom',
                          calculable='false',
                          text=c("高","低")){
  paste("visualMap:",
        jsonlite::toJSON(list(show=show,
                           min=min,
                           max=max,
                           left=left,
                           top=top,
                           text=text,
                           calculable=calculable
                           ),auto_unbox=TRUE),
        ",",sep="")
}
