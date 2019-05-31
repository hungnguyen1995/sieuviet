{% extends 'layouts/main.volt' %}
 

{% block content %}
 	 <div class="m-content">
 		{% if this.flashSession.has('success') %}
 		<div class="alert alert-success" role="alert">
		  	<?php $this->flashSession->output() ?>
		</div>
		{% endif %}
		{% if this.flashSession.has('error') %}
 		<div class="alert alert-error" role="alert">
		  	<?php $this->flashSession->output() ?>
		</div>
		{% endif %}
		<div class="row">
			<div class="col-lg-12">
				<!--begin::Portlet-->
				<div class="m-portlet">
					<div class="m-portlet__head">
						<div class="m-portlet__head-caption">
							<div class="m-portlet__head-title">
								<span class="m-portlet__head-icon m--hide">
									<i class="la la-gear"></i>
								</span>
								<h3 class="m-portlet__head-text">
									Create Blog
								</h3>
							</div>
						</div>
					</div>

					<!--begin::Form-->
					<form class="m-form m-form--label-align-right" method="post" action="/blog/create" enctype="multipart/form-data">
						<div class="m-portlet__body">
							<div class="m-form__section m-form__section--first">
								<div class="m-form__heading">
									<h3 class="m-form__heading-title">Form</h3>
								</div>
								<div class="form-group m-form__group row">
									<label class="col-lg-2 col-form-label">Name</label>
									<div class="col-lg-8">
										<input type="text" required name="name" class="form-control m-input" placeholder="Enter Name">
										 
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label class="col-lg-2 col-form-label">avatar</label>
									<div class="col-lg-8">
										<input type="file" name="avatar" class="form-control m-input" placeholder="Enter Name">
										 
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label class="col-lg-2 col-form-label">Category</label>
									<div class="col-lg-8">
									 	<select class="form-control m-input" name="category_id">
									 		{% for index, category in categories %}
												<option  value="{{ category.id}}">{{ category.name}}</option>		
									 		{% endfor %}
									 	</select>
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label class="col-lg-2 col-form-label">Content</label>
									<div class="col-lg-8">
									 	<textarea name="content" id="summernote" class="form-control"></textarea>
									</div>
								</div>
						 
							</div>
						 
					 
						</div>
						<div class="m-portlet__foot m-portlet__foot--fit">
							<div class="m-form__actions m-form__actions">
								<div class="row">
									<div class="col-lg-2"></div>
									<div class="col-lg-8">
										<button type="submit" class="btn btn-primary">Submit</button>
										<a href="/blog/list" class="btn btn-secondary">Cancel</a>
									</div>
								</div>
							</div>
						</div>
					</form>

					<!--end::Form-->
				</div>

				<!--end::Portlet-->

	 
			</div>
		</div>
	</div>
{% endblock %}

{% block js_after %}

	 <script type="text/javascript">
	 	 $(document).ready(function() {
		  $('#summernote').summernote();
		});
	 	$('.alert').delay(3000).slideUp();
	 </script>

{% endblock %}