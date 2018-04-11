<@i.tCargocnVue>
<div style="padding:10px;clear: both;">
    <div id="psLine"  style="width:700px;height: 600px;"></div>
    </div></div>
<#--<script src="${request.contextPath}/js/timelineGDP.js"></script>-->
<script src="${request.contextPath}/js/shippers.js"></script>
<script src="${request.contextPath}/js/draggerable.js"></script>
<script src="${request.contextPath}/js/echarts.js"></script>
<script type="text/javascript">
//var categoryData = [
//    '北京','天津','河北','山西','内蒙古','辽宁','吉林','黑龙江',
//    '上海','江苏','浙江','安徽','福建','江西','山东','河南',
//    '湖北','湖南','广东','广西','海南','重庆','四川','贵州',
//    '云南','西藏','陕西','甘肃','青海','宁夏','新疆'
//];
function getCategoryData() {
    var arrData = [];
    for(var i=0;i<31;i++){
        arrData.push('货主'+ i);
    }
    return arrData;
}
var categoryData = getCategoryData();

var option = {
    baseOption: {
        timeline: {
            axisType: 'category',
            autoPlay: true,
            playInterval: 1000,
            data: [
                '2002-01-01', '2003-01-01', '2004-01-01',
                '2005-01-01', '2006-01-01', '2007-01-01',
                '2008-01-01', '2009-01-01', '2010-01-01',
                '2011-01-01', '2012-01-01', '2013-01-01',
                '2014-01-01', '2015-01-01', '2016-01-01',
                '2017-01-01', '2018-01-01' ,'2019-01-01'
            ],
            label: {
                formatter : function(s) {
                    return (new Date(s)).getFullYear();
                }
            }
        },
        title: {
            subtext: '年收入'
        },
        tooltip: {
            trigger:'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        xAxis: {
            type: 'value',
            name: '收入（万元）',
            max: 60000,
            data: null
        },
        yAxis: {
            type: 'category',
            data: categoryData,
            axisLabel: {interval: 0},
            splitLine: {show: false}
        },
        legend: {
            data: ['第一季度', '第二季度', '第三季度', 'GDP', '金融', '房地产'],
            selected: {
                'GDP': false, '金融': false, '房地产': false
            }
        },
        calculable : true,
        series: [
            {name: 'GDP', type: 'bar'},
            {name: '金融', type: 'bar'},
            {name: '房地产', type: 'bar'},
            {name: '第一季度', type: 'bar'},
            {name: '第二季度', type: 'bar'},
            {name: '第三季度', type: 'bar'},
            {name: '收入占比', type: 'pie'}
        ]
    },
    media: [
        {
            option: {
                legend: {
                    orient: 'horizontal',
                    left: 'right',
                    itemGap: 10
                },
                grid: {
                    left: '10%',
                    top: 80,
                    right: 90,
                    bottom: 100
                },
                xAxis: {
                    nameLocation: 'end',
                    nameGap: 10,
                    splitNumber: 5,
                    splitLine: {
                        show: true
                    }
                },
                timeline: {
                    orient: 'horizontal',
                    inverse: false,
                    left: '20%',
                    right: '20%',
                    bottom: 10,
                    height: 40
                },
                series: [
                    {name: '收入占比', center: ['75%', '30%'], radius: '28%'}
                ]
            }
        },
        {
            query: {maxWidth: 670, minWidth: 550},
            option: {
                legend: {
                    orient: 'horizontal',
                    left: 200,
                    itemGap: 5
                },
                grid: {
                    left: '10%',
                    top: 80,
                    right: 90,
                    bottom: 100
                },
                xAxis: {
                    nameLocation: 'end',
                    nameGap: 10,
                    splitNumber: 5,
                    splitLine: {
                        show: true
                    }
                },
                timeline: {
                    orient: 'horizontal',
                    inverse: false,
                    left: '20%',
                    right: '20%',
                    bottom: 10,
                    height: 40
                },
                series: [
                    {name: '收入占比', center: ['75%', '30%'], radius: '28%'}
                ]
            }
        },
        {
            query: {maxWidth: 550},
            option: {
                legend: {
                    orient: 'vertical',
                    left: 'right',
                    itemGap: 5
                },
                grid: {
                    left: 55,
                    top: '32%',
                    right: 100,
                    bottom: 50
                },
                xAxis: {
                    nameLocation: 'middle',
                    nameGap: 25,
                    splitNumber: 3
                },
                timeline: {
                    orient: 'vertical',
                    inverse: true,
                    right: 10,
                    top: 150,
                    bottom: 10,
                    width: 55
                },
                series: [
                    {name: '收入占比', center: ['45%', '20%'], radius: '28%'}
                ]
            }
        }
    ],
    options: [
        {
            title: {text: '2002货主收入报表'},
            series: [
                {data: dataMap.dataGDP['2002']},
                {data: dataMap.dataFinancial['2002']},
                {data: dataMap.dataEstate['2002']},
                {data: dataMap.dataPI['2002']},
                {data: dataMap.dataSI['2002']},
                {data: dataMap.dataTI['2002']},
                {data: [
                    {name: '第一季度', value: dataMap.dataPI['2002sum']},
                    {name: '第二季度', value: dataMap.dataSI['2002sum']},
                    {name: '第三季度', value: dataMap.dataTI['2002sum']}
                ]}
            ]
        },
        {
            title : {text: '2003货主收入报表'},
            series : [
                {data: dataMap.dataGDP['2003']},
                {data: dataMap.dataFinancial['2003']},
                {data: dataMap.dataEstate['2003']},
                {data: dataMap.dataPI['2003']},
                {data: dataMap.dataSI['2003']},
                {data: dataMap.dataTI['2003']},
                {data: [
                    {name: '第一季度', value: dataMap.dataPI['2003sum']},
                    {name: '第二季度', value: dataMap.dataSI['2003sum']},
                    {name: '第三季度', value: dataMap.dataTI['2003sum']}
                ]}
            ]
        },
        {
            title : {text: '2004货主收入报表'},
            series : [
                {data: dataMap.dataGDP['2004']},
                {data: dataMap.dataFinancial['2004']},
                {data: dataMap.dataEstate['2004']},
                {data: dataMap.dataPI['2004']},
                {data: dataMap.dataSI['2004']},
                {data: dataMap.dataTI['2004']},
                {data: [
                    {name: '第一季度', value: dataMap.dataPI['2004sum']},
                    {name: '第二季度', value: dataMap.dataSI['2004sum']},
                    {name: '第三季度', value: dataMap.dataTI['2004sum']}
                ]}
            ]
        },
        {
            title : {text: '2005货主收入报表'},
            series : [
                {data: dataMap.dataGDP['2005']},
                {data: dataMap.dataFinancial['2005']},
                {data: dataMap.dataEstate['2005']},
                {data: dataMap.dataPI['2005']},
                {data: dataMap.dataSI['2005']},
                {data: dataMap.dataTI['2005']},
                {data: [
                    {name: '第一季度', value: dataMap.dataPI['2005sum']},
                    {name: '第二季度', value: dataMap.dataSI['2005sum']},
                    {name: '第三季度', value: dataMap.dataTI['2005sum']}
                ]}
            ]
        },
        {
            title : {text: '2006货主收入报表'},
            series : [
                {data: dataMap.dataGDP['2006']},
                {data: dataMap.dataFinancial['2006']},
                {data: dataMap.dataEstate['2006']},
                {data: dataMap.dataPI['2006']},
                {data: dataMap.dataSI['2006']},
                {data: dataMap.dataTI['2006']},
                {data: [
                    {name: '第一季度', value: dataMap.dataPI['2006sum']},
                    {name: '第二季度', value: dataMap.dataSI['2006sum']},
                    {name: '第三季度', value: dataMap.dataTI['2006sum']}
                ]}
            ]
        },
        {
            title : {text: '2007货主收入报表'},
            series : [
                {data: dataMap.dataGDP['2007']},
                {data: dataMap.dataFinancial['2007']},
                {data: dataMap.dataEstate['2007']},
                {data: dataMap.dataPI['2007']},
                {data: dataMap.dataSI['2007']},
                {data: dataMap.dataTI['2007']},
                {data: [
                    {name: '第一季度', value: dataMap.dataPI['2007sum']},
                    {name: '第二季度', value: dataMap.dataSI['2007sum']},
                    {name: '第三季度', value: dataMap.dataTI['2007sum']}
                ]}
            ]
        },
        {
            title : {text: '2008货主收入报表'},
            series : [
                {data: dataMap.dataGDP['2008']},
                {data: dataMap.dataFinancial['2008']},
                {data: dataMap.dataEstate['2008']},
                {data: dataMap.dataPI['2008']},
                {data: dataMap.dataSI['2008']},
                {data: dataMap.dataTI['2008']},
                {data: [
                    {name: '第一季度', value: dataMap.dataPI['2008sum']},
                    {name: '第二季度', value: dataMap.dataSI['2008sum']},
                    {name: '第三季度', value: dataMap.dataTI['2008sum']}
                ]}
            ]
        },
        {
            title : {text: '2009货主收入报表'},
            series : [
                {data: dataMap.dataGDP['2009']},
                {data: dataMap.dataFinancial['2009']},
                {data: dataMap.dataEstate['2009']},
                {data: dataMap.dataPI['2009']},
                {data: dataMap.dataSI['2009']},
                {data: dataMap.dataTI['2009']},
                {data: [
                    {name: '第一季度', value: dataMap.dataPI['2009sum']},
                    {name: '第二季度', value: dataMap.dataSI['2009sum']},
                    {name: '第三季度', value: dataMap.dataTI['2009sum']}
                ]}
            ]
        },
        {
            title : {text: '2010货主收入报表'},
            series : [
                {data: dataMap.dataGDP['2010']},
                {data: dataMap.dataFinancial['2010']},
                {data: dataMap.dataEstate['2010']},
                {data: dataMap.dataPI['2010']},
                {data: dataMap.dataSI['2010']},
                {data: dataMap.dataTI['2010']},
                {data: [
                    {name: '第一季度', value: dataMap.dataPI['2010sum']},
                    {name: '第二季度', value: dataMap.dataSI['2010sum']},
                    {name: '第三季度', value: dataMap.dataTI['2010sum']}
                ]}
            ]
        },
        {
            title : {text: '2011货主收入报表'},
            series : [
                {data: dataMap.dataGDP['2011']},
                {data: dataMap.dataFinancial['2011']},
                {data: dataMap.dataEstate['2011']},
                {data: dataMap.dataPI['2011']},
                {data: dataMap.dataSI['2011']},
                {data: dataMap.dataTI['2011']},
                {data: [
                    {name: '第一季度', value: dataMap.dataPI['2011sum']},
                    {name: '第二季度', value: dataMap.dataSI['2011sum']},
                    {name: '第三季度', value: dataMap.dataTI['2011sum']}
                ]}
            ]
        },
        {
            title : {text: '2012货主收入报表'},
            series : [
                {data: dataMap.dataGDP['2012']},
                {data: dataMap.dataFinancial['2012']},
                {data: dataMap.dataEstate['2012']},
                {data: dataMap.dataPI['2012']},
                {data: dataMap.dataSI['2012']},
                {data: dataMap.dataTI['2012']},
                {data: [
                    {name: '第一季度', value: dataMap.dataPI['2012sum']},
                    {name: '第二季度', value: dataMap.dataSI['2012sum']},
                    {name: '第三季度', value: dataMap.dataTI['2012sum']}
                ]}
            ]
        }
    ]
}
var vue = new Vue({
    el:"#main",
    data: {
        options:{},
        psLineChar:{}
    },
    methods: {
        init:function () {
            //图表
            this.psLineChar = echarts.init(document.getElementById('psLine'));
            //载入图表
            this.initData();
        },
        initData :function () {
            this.psLineChar.clear();
            this.psLineChar.showLoading({text: '正在努力的读取数据中...'});
            this.$http.post('${request.contextPath}/cargocn/getOptionBar1',
                {},{emulateJSON: true}).then(function(res){
                console.log(res);
                if (res.body.code == 100) {
                    // this.options = res.body.data;
                    // this.psLineChar.setOption(res.body.data, true);
                    this.options = option;
                    this.psLineChar.setOption(option, true);
                    this.psLineChar.hideLoading();
                }
            },function(){
                console.log('failed');
            });
        }
    }
});
vue.init();
</script>
</@i.tCargocnVue>