<%@page pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="css/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="css/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="css/easyui/themes/color.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>



</head>
<body>
	<h2>Row Editing in DataGrid</h2>
	<p>Click the row to start editing.</p>
	<div style="margin: 20px 0;"></div>

	<table id="dg" class="easyui-datagrid" title="Row Editing in DataGrid"
		style="width: 700px; height: auto"
		data-options="
                iconCls: 'icon-edit',
                singleSelect: true,
                toolbar: '#tb',
                url: '/struts-crud/userRetrive.do',
                method: 'get',
                onClickCell: onClickCell
            ">
		<thead>
			<tr>
				<th data-options="field:'id',width:80">id</th>
				<th data-options="field:'username',width:80,editor:'textbox'">username</th>
				<th data-options="field:'password',width:80,editor:'textbox'">password</th>
			</tr>
		</thead>
	</table>

	<div id="tb" style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="append()">Append</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">Remove</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="save()">Save</a>
	</div>

	<script type="text/javascript">
		var editIndex = undefined;
		function endEditing() {
			if (editIndex == undefined) {
				return true
			}
			if ($('#dg').datagrid('validateRow', editIndex)) {
				$('#dg').datagrid('endEdit', editIndex);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		function onClickCell(index, field) {
			if (editIndex != index) {
				// 当点击其他行时，需结束编辑之前行 
				if (endEditing()) {
					$('#dg').datagrid('selectRow', index);
					editIndex = index;
					setTimeout(function() {
						$('#dg').datagrid('beginEdit', index);
						var ed = $('#dg').datagrid('getEditor', {
							index : index,
							field : field
						});
						($(ed.target).data('textbox') ? $(ed.target).textbox(
								'textbox') : $(ed.target)).focus();
					}, 200);
				} else {
					$('#dg').datagrid('selectRow', editIndex);
				}
			}
		}
		function append() {
			if (endEditing()) {
				$('#dg').datagrid('appendRow', {
					id : "INSERT",
					username : '例子',
					password : '88'
				});
				editIndex = $('#dg').datagrid('getRows').length - 1;
				$('#dg').datagrid('selectRow', editIndex).datagrid('beginEdit',
						editIndex);
			}
		}
		function removeit() {
			if (editIndex == undefined) {
				return
			}
			var data = $('#dg').datagrid('getSelections');
			$.ajax({
				type : "POST",
				url : "/struts-crud/userDelete.do",
				data : "data=" + JSON.stringify(data),
				success : function(msg) {
					$("#dg").datagrid("reload");
					$('#dg').datagrid('cancelEdit', editIndex).datagrid('deleteRow',editIndex);
					editIndex = undefined;
				}
			}); //end ajax
		}
		function save() {
			var data;
			if (endEditing()) {
				// 执行此操作缓存将被更新，将导致getChanges 获取不到数据。 
				// $('#dg').datagrid('acceptChanges');

				data = $("#dg").datagrid("getChanges");
				// ===================================================
				// ============ 超级炫酷输出对象、查看对象 =====
				// =================================== 
				console.dir($("#dg").datagrid("getChanges"));
				$.ajax({
					type : "POST",
					url : "/struts-crud/userUpdate.do",
					data : "data=" + JSON.stringify(data),
					success : function(msg) {
						//alert(JSON.stringify(msg));
						$("#dg").datagrid("reload");
					}
				}); //end ajax
			}//end if
		}
	</script>
</body>
</html>
