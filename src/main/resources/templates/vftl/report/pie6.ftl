<@i.tCargocnVue>
<div style="padding:10px;clear: both;">
    <div id="psLine" style="height:600px;"></div>
</div></div>
<script src="${request.contextPath}/js/echarts.js"></script>
<script type="text/javascript">
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
                this.$http.post('${request.contextPath}/report/getOptionPie6',
                        {},{emulateJSON: true}).then(function(res){
                    console.log(res);
                    if (res.body.code == 100) {
                        this.options = res.body.data;
                        this.psLineChar.setOption(res.body.data, true);
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