<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
</head>
<body>
	<%@ page errorPage="/view/list_quanao.jsp"%>
	<div style="padding: 22px 32px;">	
		<div class="text">
			<h1>
				<center>THÔNG TIN SẢN PHẨM</center>
			</h1>
			</br>
			<button class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#addModal">Thêm Mới</button>

			<div class="panel-body">
				<table id="productTable"
					class="table table-responsive table-bordered" cellpadding="0"
					width="100%">
					<thead >
						<tr >
							<th>ID</th>
							<th>Tên Sản Phẩm</th>
							<th>Size</th>
							<th>Giá Bán </th>
							<th>Số Lượng</th>
							<th>Mô Tả</th>
							<th>Cập Nhật</th>
							<th>Xoá </th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="sp" items="${quanaoList}" varStatus="status">
							<tr>
								<td><c:out value="${status.index + 1}" /></td>
								<td><c:out value="${sp.ten_QA}" /></td>
								<td><c:out value="${sp.size}" /></td>
								<td><c:out value="${sp.giaBan}" /></td>
								<td><c:out value="${sp.soLuong}" /></td>
								<td><c:out value="${sp.moTa}" /></td>
								<td>
								
								</td>
								<td>
									
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- Add Product Modal -->
			<div class="modal fade" id="addModal" tabindex="-1"
				aria-labelledby="addModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="addModalLabel">Thêm Sản Phẩm</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="addsp" method="POST">
								<div class="mb-3">
									<label for="tensp" class="form-label">Tên Quần Áo</label> <input
										type="text" class="form-control" id="tensp" name="tensp">
								</div>
								<div class="mb-3">
									<label for="size" class="form-label">Size</label> <input
										type="text" class="form-control" id="size"
										name="size">
								</div>
								<div class="mb-3">
									<label for="giaban" class="form-label">Giá Bán</label> <input
										type="text" class="form-control" id="giaban" name="giaban">
								</div>
								<div class="mb-3">
									<label for="soluong class="form-label">Số Lượng</label> <input
										type="text" class="form-control" id="soluong" name="soluong">
								</div>
								<div class="mb-3">
									<label for="mota" class="form-label">Mô Tả</label>
									<textarea class="form-control" id="mota" name="mota"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Đóng</button>
									<button type="submit" class="btn btn-primary">Thêm sản
										phẩm</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal -->
			<c:forEach var="sp" items="${quanaoList}">
				<div class="modal fade" id="editModal${sp.iD_QA}" tabindex="-1"
					aria-labelledby="editModalLabel${sp.iD_QA}" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="editModalLabel${sp.iD_QA}">
									Chỉnh Sửa Thông Tin Sản Phẩm</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="uppdatesp" method="POST">
									<input type="hidden" name="iD_QAStr" value="${nsx.iD_QA}">
									<div class="mb-3">
										<label for="ten_nhasx_${nsx.iD_QA}" class="form-label">Tên
											quần áo</label> <input type="text" class="form-control"
											id="ten_nhasx_${nsx.iD_QA}" name="ten_nhasx_${nsx.iD_QA}"
											value="${nsx.ten_QA}">
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Đóng</button>
										<button type="submit" class="btn btn-primary">Lưu</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<style>
th {
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

th:last-child {
	border-right: none;
}

td {
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.table-bordered {
	border: 1px solid #ccc;
}

.table-bordered th, .table-bordered td {
	border: 1px solid #ccc;
}

.table-bordered th:last-child, .table-bordered td:last-child {
	border-right: none;
}
</style>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('#productTable').DataTable();
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>