{% extends 'layouts/main.volt' %}
{% block subheader %}
 <div class="m-subheader ">
     {% if this.flashSession.has('success') %}
		 <div class="alert alert-success" role="alert">
			 <?php $this->flashSession->output() ?>
		 </div>
     {% endif %}
     {% if this.flashSession.has('error') %}
		 <div class="alert alert-danger" role="alert">
			 <?php $this->flashSession->output() ?>
		 </div>
     {% endif %}
						<div class="d-flex align-items-center">
							<div class="mr-auto">
								<h3 class="m-subheader__title ">Admin LTE</h3>
							</div>

						</div>
					</div>
{% endblock %}

{% block content %}
 	<div class="m-content">
 
	</div>
{% endblock %}
{% block js_after %}

	<script type="text/javascript">
        $('.alert').delay(3000).slideUp();
	</script>
{% endblock %}