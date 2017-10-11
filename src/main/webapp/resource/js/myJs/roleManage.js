var role_manage ={
		data:{
			
		},
		operate:{
			getRoles:function(){
				$.post(getRootPath()+"/roleManage/getRoles.do", {}, function(data, textStatus, req) {
					if(textStatus == "success"){
						data = eval(data)
						$("#tbody_user").empty();

						$.each(data, function(i, role) {
							var html = "<tr><td>"+role.id+"</td>"+
						"<td>"+role.roleName+"</td>"+
						"<td><div class=\"button-group\">"+
						"<a class=\"button border-main\" href=\"#control\" " +
						"onclick=\"return role_manage.operate.transferRole("+role.id+",'"+role.roleName+"')\">"+
						"<span class=\"icon-edit\"></span> 修改</a>"+ 
						"<a class=\"button border-yellow\" href=\"#control\" onclick=\"role_manage.operate.showPrivilege()\">"+
						"<span	class=\"icon-lock\"></span> 设置权限</a>"+
						"<a class=\"button border-red\"	href=\"javascript:void(0)\" onclick=\"return role_manage.operate.delRole("+role.id+")\">"+
						"<span class=\"icon-trash-o\"></span> 删除</a></div></td></tr>";
							$("#tbody_user").append(html);
						});

					}
				},'json')
			},
			transferRole:function(roleId,roleName){
				$("#strong_edit").parent().removeClass("hidden");
				$("#add_or_edit_panel").removeClass("hidden");
				$("#btn_save").removeClass("hidden");
				$("#div_privilege_panel").addClass("hidden");
				$("#strong_add").parent().addClass("hidden");
				$("#btn_add").addClass("hidden");
				$("#strong_set_privilege").parent().addClass("hidden");
				$("#input_role_id").val(roleId);
				$("#input_role_name").val(roleName);
				$("#btn_save").on('click', function() {
					var roleId = $("#input_role_id").val();
					var roleName = $("#input_role_name").val();
					role_manage.operate.updateRole(roleId,roleName);
				});
			},
			updateRole:function(roleId,roleName){
				$.post(getRootPath()+"/roleManage/updateRole.do", {roleId,roleName}, function(data, textStatus, req) {
					if(textStatus == 'success'){
						toastr.success(eval(data))
						role_manage.operate.getRoles();
					}else{
						toastr.error("修改角色失败")
					}
				})
			},
			addRole:function(roleName){
				$.post(getRootPath()+"/roleManage/addRole.do", {roleName}, function(data, textStatus, req) {
					if(textStatus == 'success'){
						toastr.success(eval(data))
						role_manage.operate.getRoles();
					}else{
						toastr.error("增加角色失败")
					}
				})
			},
			delRole:function(roleId){
				$.post(getRootPath()+"/roleManage/delRoleById.do", {roleId}, function(data, textStatus, req) {
					if(textStatus == 'success'){
						toastr.success(eval(data))
						role_manage.operate.getRoles();
					}else{
						toastr.error("删除角色失败")
					}
				})
			},
			showPrivilege:function(){
				role_manage.operate.ztree.loadPrivilegeTree();
				$("#strong_edit").parent().addClass("hidden");
				$("#add_or_edit_panel").addClass("hidden");
				$("#btn_save").addClass("hidden");
				$("#div_privilege_panel").removeClass("hidden");
				$("#strong_add").parent().addClass("hidden");
				$("#btn_add").addClass("hidden");
				$("#strong_set_privilege").parent().removeClass("hidden");
			},
			ztree:{
				zTreePlugin:'',
				settings:{
					data:{
						simpleData: {
							enable: true,
							idKey: "id",
							pIdKey: "parentId",
							rootPId: 0
						},
						key: {
							name: "privilegeName"
						}
					 },
					view: {
						fontCss : {color:"blue"},
						showLine: false
					},
					check: {
						enable: true
					},
					/**
					 * 声明事件
					 */
					callback:{
						change:function(event, treeId, treeNode){
							
						}
					}
				},
				loadPrivilegeTree:function(){
					$.post(getRootPath()+"/privilegeManage/getPrivileges.do", {}, function(data, textStatus, req) {
						role_manage.operate.ztree.zTreePlugin = $.fn.zTree.init($("#privilege_tree"),role_manage.operate.ztree.settings,eval(data));
						$('#img_loading').addClass('hidden')
					},'json')
				}
			}
		},
		init:function(){
			role_manage.operate.getRoles();
			$("#btn_add_role").on('click',function(){
				$("#strong_edit").parent().addClass("hidden");
				$("#add_or_edit_panel").removeClass("hidden");
				$("#btn_save").addClass("hidden");
				$("#div_privilege_panel").addClass("hidden");
				$("#strong_add").parent().removeClass("hidden");
				$("#btn_add").removeClass("hidden");
				$("#strong_set_privilege").parent().addClass("hidden");	
			});
			$("#btn_add").on('click', function() {
				var roleName = $("#input_role_name").val();
				role_manage.operate.addRole(roleName);
			});
		}
};
$().ready(function() {
	role_manage.init();
})