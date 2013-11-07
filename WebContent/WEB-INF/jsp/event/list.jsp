	
	<%@ include file="/header.jsp" %>
	
	<div class="col-lg-11" id="content-toolbar">
		<div class="col-lg-3 pull-left" id="content-toolbar-buttons-left">
			
			<a id="new-event" href="#" class="btn btn-bgsys btn-blue-bgsys">
				<span class="glyphicon glyphicon-plus-sign"></span>
				Nova ocorr�ncia
			</a>
			
		</div>
		<div class="col-lg-3 pull-right" id="content-toolbar-buttons-right"></div>
	</div>
	<div class="col-lg-11" id="content-body">
		<table class="table table-bgsys" id="tableEvent">
			<thead>
				<tr>
					<th width="20%">Tipo</th>
					<th width="20%">Projeto</th>
					<th width="20%">Status</th>
					<th width="20%">Respons�vel</th>
					<th width="20%">A��es</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${eventList}" var="event">
					<tr>
						<td class="id-hidden">${event.id}</td>
					    <td></td>
					    <td></td>
						<td></td>
						<td>
							<div class="btn-group">
							  <a class="btn btn-link editEvent" href="<c:url value="/event/${event.id}"/>">
							  	 <span class="glyphicon glyphicon-edit"></span> Editar
							  </a>
							  <a data-toggle="modal" class="btn btn-link deleteClient" href="${event.id}">
							  	 <span class="glyphicon glyphicon-remove"></span> Excluir
							  </a>
							</div>
						</td>
					</tr>
				</c:forEach>
			
			</tbody>
		</table>
	</div>
	
	 <!-- Modal confirm delete event -->
	  <div class="modal fade" id="modal-excluir" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	          <h4 class="modal-title">Confirma��o</h4>
	        </div>
	        <div class="modal-body">
	          <p>Deseja realmente excluir a ocorr�ncia selecionada?</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default cancel" data-dismiss="modal">Cancelar</button>
	          <button type="button" class="btn btn-primary confirm">Confirmar</button>
	        </div>
	      </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	  </div><!-- /.modal -->
 					
  <%@ include file="/footer.jsp" %>
  
  <script type="text/javascript" src="<c:url value="/js/event.js"/>"></script>
					
	