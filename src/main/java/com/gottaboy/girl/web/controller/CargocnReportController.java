package com.gottaboy.girl.web.controller;

import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.axis.*;
import com.github.abel533.echarts.code.*;
import com.github.abel533.echarts.data.PointData;
import com.github.abel533.echarts.feature.MagicType;
import com.github.abel533.echarts.series.Bar;
import com.gottaboy.girl.utils.EnhancedOption;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cargocn")
public class CargocnReportController {

//    http://www.echartsjs.com/gallery/view.html?c=doc-example/bar-media-timeline&edit=1&reset=1
    @RequestMapping(value="/shippers")
    public String shippers(){
        return "cargocn/shippers";
    }

    @RequestMapping(value="/month_all")
    public String month_all(){
        return "cargocn/month_all";
    }

    @RequestMapping(value="/getOption_month_all")
    @ResponseBody
    public Map<String, Object> optionMonth_all(){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code",100);
        map.put("message","成功");
        map.put("data",getOption_month_all());
        return map;
    }

    @RequestMapping(value="/shipper")
    public String bar1(){
        return "cargocn/shipper";
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

    public Option getOption_month_all() {
        //地址：http://echarts.baidu.com/doc/example/bar1.html
        EnhancedOption option = new EnhancedOption();
        option.title().text("2018年月收入报表").subtext("运营月收入");
        option.tooltip().trigger(Trigger.axis);
        option.legend("货运中国网");
        option.toolbox().show(true).feature(Tool.mark, Tool.dataView, new MagicType(Magic.line, Magic.bar).show(true), Tool.restore, Tool.saveAsImage);
        option.calculable(true);
        option.xAxis(new CategoryAxis().data("1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"));
        option.yAxis(new ValueAxis());

//        Bar bar = new Bar("蒸发量");
//        bar.data(2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3);
//        bar.markPoint().data(new PointData().type(MarkType.max).name("最大值"), new PointData().type(MarkType.min).name("最小值"));
//        bar.markLine().data(new PointData().type(MarkType.average).name("平均值"));

        Bar bar2 = new Bar("货运中国网");
//        List<Double> list = Arrays.asList(2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3);
        List<Double> list = Arrays.asList(20000.6, 50000.9, 90000.0, 260000.4, 280000.7, 700000.7, 1750000.6, 1820000.2, 480000.7, 180000.8, 60000.0, 20000.3);
        bar2.setData(list);
        bar2.markPoint().data(new PointData("年最高", 1820000.2).xAxis(7).yAxis(1830000).symbolSize(18), new PointData("年最低", 20000.3).xAxis(11).yAxis(30000));
        bar2.markLine().data(new PointData().type(MarkType.average).name("平均值"));

        option.series(bar2);
//        option.series(bar, bar2);
//        option.exportToHtml("bar1.html");
//        option.view();
        return option;
    }

    public Option getOptionBar1() {
        //地址：http://echarts.baidu.com/doc/example/bar1.html
        EnhancedOption option = new EnhancedOption();
        option.title().text("XX货主月报表").subtext("运营月收入");
        option.tooltip().trigger(Trigger.axis);
        option.legend("XX货主");
        option.toolbox().show(true).feature(Tool.mark, Tool.dataView, new MagicType(Magic.line, Magic.bar).show(true), Tool.restore, Tool.saveAsImage);
        option.calculable(true);
        option.xAxis(new CategoryAxis().data("1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"));
        option.yAxis(new ValueAxis());

//        Bar bar = new Bar("蒸发量");
//        bar.data(2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3);
//        bar.markPoint().data(new PointData().type(MarkType.max).name("最大值"), new PointData().type(MarkType.min).name("最小值"));
//        bar.markLine().data(new PointData().type(MarkType.average).name("平均值"));

        Bar bar2 = new Bar("XX货主");
//        List<Double> list = Arrays.asList(2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3);
        List<Double> list = Arrays.asList(20000.6, 50000.9, 90000.0, 260000.4, 280000.7, 700000.7, 1750000.6, 1820000.2, 480000.7, 180000.8, 60000.0, 20000.3);
        bar2.setData(list);
        bar2.markPoint().data(new PointData("年最高", 1820000.2).xAxis(7).yAxis(1830000).symbolSize(18), new PointData("年最低", 20000.3).xAxis(11).yAxis(30000));
        bar2.markLine().data(new PointData().type(MarkType.average).name("平均值"));

        option.series(bar2);
//        option.series(bar, bar2);
//        option.exportToHtml("bar1.html");
//        option.view();
        return option;
    }
}
