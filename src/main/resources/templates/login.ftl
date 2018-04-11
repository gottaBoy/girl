<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>货运中国网</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.0.5/lib/theme-chalk/index.css" />
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <script src="http://cdn.bootcss.com/vue-resource/1.3.4/vue-resource.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue-router/3.0.1/vue-router.min.js"></script>
    <script src="https://unpkg.com/element-ui@2.0.5/lib/index.js"></script>
    <style>
        #top {
            /*background:#20A0FF;*/
            background: #DCDFE6;
            padding:5px;
            overflow:hidden
        }
        .box-card {
            width: 480px;
        }
    </style>
</head>
<body>
<div id="main">
    <el-row :gutter="20">
        <el-col :span="12" :offset="6">
            <el-card class="box-card">
                <div slot="header" class="clearfix">
                    <span>登录</span>
                </div>
                <el-form :model="loginForm" status-icon ref="loginForm" label-width="100px" class="demo-ruleForm">
                    <el-form-item label="用户名" prop="username">
                        <el-input type="text" v-model="loginForm.username" auto-complete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="密码" prop="pass">
                        <el-input type="password" v-model="loginForm.password" auto-complete="off"></el-input>
                    </el-form-item>

                    <el-form-item>
                        <el-button type="primary" @click="submitForm">登录</el-button>
                    </el-form-item>
                </el-form>
            </el-card>
        </el-col>
    </el-row>
</div>
<script>
    var vue = new Vue({
        el:"#main",
        data: {
            loginForm:{
                username:'',
                password:''
            }
        },
        methods: {
            submitForm :function () {
                debugger
                this.$http.post('/login',
                        {username:this.loginForm.username,
                            password:this.loginForm.password
                        },{emulateJSON: true}).then(function(res){
                    console.log(res);
                    if (res.status == 200) {
                        debugger;
                        location.href = "/index";
                    } else {
                       // $("#erro").html(result.message);
                    }
                },function(){
                    console.log('failed');
                });
            }
        }
    });
</script>
</body>
</html>