<@i.tCargocnVue>
<div style="margin-top:15px">
    <div align="center">
        <el-card class="box-card">

        </el-card>
    </div>
    <div class="custom-tree-container">
        <div class="block">
            <p>使用 render-content</p>
            <el-tree
                    :data="tableData"
                    show-checkbox
                    node-key="id"
                    default-expand-all
                    :expand-on-click-node="false"
                    :render-content="renderContent">
            </el-tree>
        </div>
    </div>
</div>

<el-dialog title="新增" :visible.sync="addFormVisible">
    <el-form :model="addForm" size="small" label-width="80px">
        <el-form-item label="用户名">
            <el-input v-model="addForm.username" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="姓名">
            <el-input v-model="addForm.realname" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="密码">
            <el-input v-model="addForm.password" auto-complete="off"></el-input>
        </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
        <el-button size="small" @click="addFormVisible = false">取 消</el-button>
        <el-button size="small" type="primary" @click="add">确 定</el-button>
    </div>
</el-dialog>

<el-dialog title="修改" :visible.sync="updateFormVisible">
    <el-form :model="updateForm" size="small" label-width="80px">
        <el-form-item label="用户名">
            <el-input v-model="updateForm.username" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="姓名">
            <el-input v-model="updateForm.realname" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="密码">
            <el-input v-model="updateForm.password" auto-complete="off"></el-input>
        </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
        <el-button size="small" @click="updateFormVisible = false">取 消</el-button>
        <el-button size="small" type="primary" @click="update">确 定</el-button>
    </div>
</el-dialog>
<el-dialog title="详情" :visible.sync="detailFormVisible">
    <el-form :model="detailForm" size="small" label-width="80px">
        <el-form-item label="用户名" >
            <el-input v-model="detailForm.username" :disabled="true" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="姓名">
            <el-input v-model="detailForm.realname" :disabled="true" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="密码">
            <el-input v-model="detailForm.password" :disabled="true" auto-complete="off"></el-input>
        </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
        <el-button size="small" @click="detailFormVisible = false">关 闭</el-button>
    </div>
</el-dialog>


</div>

<script>
    var vue = new Vue({
        el:"#main",
        data: {
            //表格当前页数据
            tableData: [],
            //请求的URL
            url:'/user/query',
            //默认每页数据量
            pagesize: 10,
            //当前页码
            currentPage: 1,
            //查询的页码
            start: 1,
            //默认数据总数
            totalCount: 1000,
            //默认高亮行数据id
            highlightId: -1,
            //多选数组
            multipleSelection: [],
            //默认总重量
            totalWeight:0,
            //添加对话框默认可见性
            addFormVisible: false,
            //修改对话框默认可见性
            updateFormVisible: false,
            //详情对话框默认可见性
            detailFormVisible: false,
            //查询表单
            searchForm: {
                username:'',
                realname:'',
                locked:null
            },
            //提交的表单
            addForm: {
                username: '',
                realname: '',
                password: '',
            },
            updateForm: {
                username: '',
                realname: '',
                password: '',
            },
            detailForm: {
                username: '',
                realname: '',
                password: '',
            }
        },

        methods: {
            handleStartLoading:function () {
                this.loading = this.$loading({
                    lock: true,
                    text: 'Loading',
                    spinner: 'el-icon-loading',
                    background: 'rgba(0, 0, 0, 0.7)'
                });
            },
            handleStopLoading:function () {
                setTimeout(() => {
                    this.loading.close();
            }, 1000);
            },
            //多选响应
            handleSelectionChange: function(val) {
                this.multipleSelection = val;
            },
            //点击行响应
            handleclick: function(row, event, column){
                this.highlightId = row.id;
            },
            //改变当前点击的行的class，高亮当前行
            tableRowClassName: function(row, index){
                if(row.id == this.highlightId)
                {
                    return 'info-row';
                }
            },
            //从服务器读取数据
            loadData: function(pageNum, pageSize){
                this.tableData = [{
                    id: 1,
                    label: '一级 1',
                    children: [{
                        id: 4,
                        label: '二级 1-1',
                        children: [{
                            id: 9,
                            label: '三级 1-1-1'
                        }, {
                            id: 10,
                            label: '三级 1-1-2'
                        }]
                    }]
                }, {
                    id: 2,
                    label: '一级 2',
                    children: [{
                        id: 5,
                        label: '二级 2-1'
                    }, {
                        id: 6,
                        label: '二级 2-2'
                    }]
                }, {
                    id: 3,
                    label: '一级 3',
                    children: [{
                        id: 7,
                        label: '二级 3-1'
                    }, {
                        id: 8,
                        label: '二级 3-2'
                    }]
                }];
                return;
                this.handleStartLoading();
                this.$http.post('/user/query?' + 'pageNum=' +  pageNum + '&pageSize=' + pageSize,
                        {username: this.searchForm.username,
                            realname: this.searchForm.realname, locked: this.searchForm.locked}
                        ,{emulateJSON: true}).then(function(res){
                    console.log(res)
                    if(res.status == 200){
                        this.tableData = res.body.rows;
                        this.totalCount = res.body.total;
                    }else{

                    }
                    this.handleStopLoading();

                },function(){
                    console.log('failed');
                    this.handleStopLoading();
                });
            },
            append:function(data) {
                const newChild = { id: id++, label: 'testtest', children: [] };
                if (!data.children) {
                    this.$set(data, 'children', []);
                }
                data.children.push(newChild);
            },
            remove: function(node, data) {
                const parent = node.parent;
                const children = parent.data.children || parent.data;
                const index = children.findIndex(d => d.id === data.id);
                children.splice(index, 1);
            },
            renderContent: function(h, { node, data, store }) {
                return node.label;
            },
//            renderContent: function(h, { node, data, store }) {
//                return ( <span class="custom-tree-node">
//                        <span>{node.label}</span>
//                    <span>
//                    <el-button size="mini" type="text" on-click={ () => this.append(data) }>Append</el-button>
//                    <el-button size="mini" type="text" on-click={ () => this.remove(node, data) }>Delete</el-button>
//                    </span>
//                </span>);
//            },
            // showDate
            dateFormat: function(row, column) {
                var date = row[column.property];
                if (date != null) {
                    if (date.length >= 10) {
                        return date.substr(0,10);
                    }
                } else {
                    return '';
                }
                return date;
            },
            // showOrderStatusByLogistics
            statusFormat: function(row, column) {
                var s = row[column.property];
                if (s == true) return "锁定";
                if (s == false) return "未锁定";
                return s;
            },
            //搜索
            search: function(){
                console.log(this.searchForm);
                this.loadData(this.currentPage, this.pagesize);
            },
            showMessage:function (type,text) {
                this.message = this.$message({
                    message: text,
                    type: type
                });
            },
            //弹出对话框
            handleAdd: function(){
                this.addFormVisible = true;
            },
            //添加
            add: function(){
//                this.$prompt('请输入名称', '提示', {
//                    confirmButtonText: '确定',
//                    cancelButtonText: '取消',
//                }).then(({ value }) => {
                if(this.addForm.username==''){
                    this.showMessage('warning',"用户名不能为空");
                    return;
                }
                if(this.addForm.realname==''){
                    this.showMessage('warning',"姓名不能为空");
                    return;
                }
                if(this.addForm.password==''){
                    this.showMessage('warning',"密码不能为空");
                    return;
                }
                this.$http.post('/user/add',{"username":this.addForm.username,"name":this.addForm.realname,"password":this.addForm.password},{emulateJSON: true}).then(function(res){
                    this.loadData(this.currentPage, this.pagesize);
                    this.addFormVisible = false;
                },function(){
                    console.log('failed');
                });
//                }).catch(() => {
//
//                });
            },

            //更新
            handleUpdate: function(index, row){
                console.log(row)
                this.updateFormVisible = true;
                this.updateForm.username = row.username;
                this.updateForm.realname = row.realname;
                this.updateForm.password = row.password;
            },
            //更新任务
            update: function(){
                this.$http.post('user/update/'+ row.id ,
                        {"username":this.updateForm.username,
                            "realname":this.updateForm.realname,
                            "password":this.updateForm.password
                        },{emulateJSON: true}
                ).then(function(res){
                    this.loadData(this.currentPage, this.pagesize);
                    this.updateFormVisible = false;
                },function(){
                    console.log('failed');
                });

            },
            //查看详情
            handleDetail: function(index, row){
                console.log(row)
                this.detailFormVisible = true;
                this.detailForm.username = row.username;
                this.detailForm.realname = row.realname;
                this.detailForm.password = row.password;
            },
            //单行删除
            handleDelete: function(index, row) {
                this.$confirm('此操作将永久删除, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.$http.post('user/delete/'+ row.id ,{},{emulateJSON: true}).then(function(res){
                    this.showMessage('success',"删除成功!");
                    this.loadData( this.currentPage, this.pagesize);
                },function(){
                    console.log('failed');
                });
            }).catch(() => {
                    this.showMessage('info',"已取消删除!");
            });
            },
            //暂停
            handlePause: function(index, row){
                this.$http.post('userInfo/pauseUser',{},{emulateJSON: true}).then(function(res){
                    this.loadData( this.currentPage, this.pagesize);
                },function(){
                    console.log('failed');
                });
            },

            //恢复
            handleResume: function(index, row){
                this.$http.post('userInfo/resumeUser',{},{emulateJSON: true}).then(function(res){
                    this.loadData( this.currentPage, this.pagesize);
                },function(){
                    console.log('failed');
                });
            },
            //每页显示数据量变更
            handleSizeChange: function(val) {
                this.pagesize = val;
                this.loadData(this.currentPage, this.pagesize);
            },

            //页码变更
            handleCurrentChange: function(val) {
                this.currentPage = val;
                this.loadData(this.currentPage, this.pagesize);
            },
        },
    });

    //载入数据
    vue.loadData(vue.currentPage, vue.pagesize);
</script>
</@i.tCargocnVue>