package com.gottaboy.girl.web.controller;

import com.github.abel533.echarts.Label;
import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.axis.*;
import com.github.abel533.echarts.code.*;
import com.github.abel533.echarts.data.Data;
import com.github.abel533.echarts.data.PointData;
import com.github.abel533.echarts.feature.MagicType;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Line;
import com.github.abel533.echarts.series.Pie;
import com.github.abel533.echarts.style.ItemStyle;
import com.gottaboy.girl.utils.EnhancedOption;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/report")
public class ReportController {

    @RequestMapping(value="/bar1")
    public String bar1(){
        return "report/bar1";
    }

    @RequestMapping(value="/getOptionBar1")
    @ResponseBody
    public Map<String, Object> optionBar1(){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code",100);
        map.put("message","成功");
        map.put("data",getOptionBar1());
        return map;
    }

    @RequestMapping(value="/bar2")
    public String bar2(){
        return "report/bar2";
    }

    @RequestMapping(value="/getOptionBar2")
    @ResponseBody
    public Map<String, Object> optionBar2(){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code",100);
        map.put("message","成功");
        map.put("data",getOptionBar2());
        return map;
    }

    @RequestMapping(value="/line5")
    public String line5(){
        return "report/line5";
    }

    @RequestMapping(value="/getOptionLine5")
    @ResponseBody
    public Map<String, Object> optionLine5(){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code",100);
        map.put("message","成功");
        map.put("data",getOptionLine5());
        return map;
    }

    @RequestMapping(value="/pie6")
    public String pie6(){
        return "report/pie6";
    }

    @RequestMapping(value="/getOptionPie6")
    @ResponseBody
    public Map<String, Object> optionPie6(){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code",100);
        map.put("message","成功");
        map.put("data",getOptionPie6());
        return map;
    }

    public Option getOptionBar1() {
        //地址：http://echarts.baidu.com/doc/example/bar1.html
        EnhancedOption option = new EnhancedOption();
        option.title().text("某地区蒸发量和降水量").subtext("纯属虚构");
        option.tooltip().trigger(Trigger.axis);
        option.legend("蒸发量", "降水量");
        option.toolbox().show(true).feature(Tool.mark, Tool.dataView, new MagicType(Magic.line, Magic.bar).show(true), Tool.restore, Tool.saveAsImage);
        option.calculable(true);
        option.xAxis(new CategoryAxis().data("1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"));
        option.yAxis(new ValueAxis());

        Bar bar = new Bar("蒸发量");
        bar.data(2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3);
        bar.markPoint().data(new PointData().type(MarkType.max).name("最大值"), new PointData().type(MarkType.min).name("最小值"));
        bar.markLine().data(new PointData().type(MarkType.average).name("平均值"));

        Bar bar2 = new Bar("降水量");
        List<Double> list = Arrays.asList(2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3);
        bar2.setData(list);
        bar2.markPoint().data(new PointData("年最高", 182.2).xAxis(7).yAxis(183).symbolSize(18), new PointData("年最低", 2.3).xAxis(11).yAxis(3));
        bar2.markLine().data(new PointData().type(MarkType.average).name("平均值"));

        option.series(bar, bar2);
//        option.exportToHtml("bar1.html");
//        option.view();
        return option;
    }

    public Option getOptionBar2() {
        EnhancedOption option = new EnhancedOption();
        option.title("ECharts2 vs ECharts1","Chrome下测试数据");
        option.tooltip(Trigger.axis);
        option.legend( "ECharts1 - 2k数据", "ECharts1 - 2w数据", "ECharts1 - 20w数据", "",
                "ECharts2 - 2k数据", "ECharts2 - 2w数据", "ECharts2 - 20w数据");
        option.toolbox().show(true).feature(Tool.mark, Tool.dataView,
                new MagicType(Magic.line, Magic.bar),
                Tool.restore, Tool.saveAsImage);
        option.calculable(true);
        option.grid().y(70).y2(30).x2(20);
        option.xAxis(
                new CategoryAxis().data("Line", "Bar", "Scatter", "K", "Map"),
                new CategoryAxis()
                        .axisLine(new AxisLine().show(false))
                        .axisTick(new AxisTick().show(false))
                        .axisLabel(new AxisLabel().show(false))
                        .splitArea(new SplitArea().show(false))
                        .axisLine(new AxisLine().show(false))
                        .data("Line", "Bar", "Scatter", "K", "Map")
        );
        option.yAxis(new ValueAxis().axisLabel(new AxisLabel().formatter("{value} ms")));

        Bar b1 = new Bar("ECharts2 - 2k数据");
        b1.itemStyle().normal().color("rgba(193,35,43,1)").label().show(true);
        b1.data(40, 155, 95, 75, 0);

        Bar b2 = new Bar("ECharts2 - 2w数据");
        b2.itemStyle().normal().color("rgba(181,195,52,1)").label().show(true).textStyle().color("#27727B");
        b2.data(100, 200, 105, 100, 156);

        Bar b3 = new Bar("ECharts2 - 20w数据");
        b3.itemStyle().normal().color("rgba(252,206,16,1)").label().show(true).textStyle().color("#E87C25");
        b3.data(906, 911, 908, 778, 0);

        Bar b4 = new Bar("ECharts1 - 2k数据");
        b4.itemStyle().normal().color("rgba(193,35,43,0.5)").label().show(true).formatter("function(a,b,c){return c>0 ? (c +'\n'):'';}");
        b4.data(96, 224, 164, 124, 0).xAxisIndex(1);

        Bar b5 = new Bar("ECharts1 - 2w数据");
        b5.itemStyle().normal().color("rgba(181,195,52,0.5)").label().show(true);
        b5.data(491, 2035, 389, 955, 347).xAxisIndex(1);

        Bar b6 = new Bar("ECharts1 - 20w数据");
        b6.itemStyle().normal().color("rgba(252,206,16,0.5)").label().show(true).formatter("function(a,b,c){return c>0 ? (c +'+'):'';}");
        b6.data(3000, 3000, 2817, 3000, 0, 1242).xAxisIndex(1);

        option.series(b1, b2, b3, b4, b5, b6);
//        option.exportToHtml("bar12.html");
//        option.view();
        return option;
    }

    public Option getOptionLine5() {
        //地址:http://echarts.baidu.com/doc/example/line5.html
        Option option = new Option();
        option.legend("高度(km)与气温(°C)变化关系");

        option.toolbox().show(true).feature(Tool.mark, Tool.dataView, new MagicType(Magic.line, Magic.bar), Tool.restore, Tool.saveAsImage);

        option.calculable(true);
        option.tooltip().trigger(Trigger.axis).formatter("Temperature : <br/>{b}km : {c}°C");

        ValueAxis valueAxis = new ValueAxis();
        valueAxis.axisLabel().formatter("{value} °C");
        option.xAxis(valueAxis);

        CategoryAxis categoryAxis = new CategoryAxis();
        categoryAxis.axisLine().onZero(false);
        categoryAxis.axisLabel().formatter("{value} km");
        categoryAxis.boundaryGap(false);
        categoryAxis.data(0, 10, 20, 30, 40, 50, 60, 70, 80);
        option.yAxis(categoryAxis);

        Line line = new Line();
        line.smooth(true).name("高度(km)与气温(°C)变化关系").data(15, -50, -56.5, -46.5, -22.1, -2.5, -27.7, -55.7, -76.5).itemStyle().normal().lineStyle().shadowColor("rgba(0,0,0,0.4)");
        option.series(line);
        return option;
    }

    public Option getOptionPie6() {
        //地址：http://echarts.baidu.com/doc/example/pie6.html
        ItemStyle dataStyle = new ItemStyle();
        dataStyle.normal().label(new Label().show(false)).labelLine().show(false);

        ItemStyle placeHolderStyle = new ItemStyle();
        placeHolderStyle.normal().color("rgba(0,0,0,0)").label(new Label().show(false)).labelLine().show(false);
        placeHolderStyle.emphasis().color("rgba(0,0,0,0)");

        Option option = new Option();
        option.title().text("你幸福吗？")
                .subtext("From ExcelHome")
                .sublink("http://e.weibo.com/1341556070/AhQXtjbqh")
                .x(X.center)
                .y(Y.center)
                .itemGap(20)
                .textStyle().color("rgba(30,144,255,0.8)")
                .fontFamily("微软雅黑")
                .fontSize(35)
                .fontWeight("bolder");
        option.tooltip().show(true).formatter("{a} <br/>{b} : {c} ({d}%)");
        option.legend().orient(Orient.vertical)
                .x("(function(){return document.getElementById('psLine').offsetWidth / 2;})()")
                .y(56)
                .itemGap(12)
                .data("68%的人表示过的不错", "29%的人表示生活压力很大", "3%的人表示“我姓曾”");
        option.toolbox().show(true).feature(Tool.mark, Tool.dataView, Tool.restore, Tool.saveAsImage);

        Pie p1 = new Pie("1");
        p1.clockWise(false).radius(125, 150).itemStyle(dataStyle)
                .data(new Data("68%的人表示过的不错", 68), new Data("invisible", 32).itemStyle(placeHolderStyle));

        Pie p2 = new Pie("2");
        p2.clockWise(false).radius(100, 125).itemStyle(dataStyle)
                .data(new Data("29%的人表示生活压力很大", 29), new Data("invisible", 71).itemStyle(placeHolderStyle));

        Pie p3 = new Pie("3");
        p3.clockWise(false).radius(75, 100).itemStyle(dataStyle)
                .data(new Data("3%的人表示“我姓曾”", 3), new Data("invisible", 97).itemStyle(placeHolderStyle));

        option.series(p1, p2, p3);
        return option;
    }
}
