<!DOCTYPE html>

<html lang="en">

	<!-- begin::Head -->
	<head>
		<meta charset="utf-8" />
		<title>Admin LTE</title>
		<meta name="description" content="Latest updates and statistic charts">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">

		{% include 'include/css.volt' %}
        {%- block css_head %} {% endblock -%}
        {% include 'include/js_head.volt' %}
		{%- block js_head %} {% endblock -%}
	</head>

	<!-- end::Head -->

	<!-- begin::Body -->
	<!-- begin::Body -->
	<body class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">

		<!-- begin:: Page -->
		<div class="m-grid m-grid--hor m-grid--root m-page">
			
			<!-- BEGIN: Header -->
				{% include 'include/header.volt' %}				
			<!-- END: Header -->

			<!-- begin::Body -->
			<div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body" >

				<!-- BEGIN: Left Aside -->
				<button class="m-aside-left-close  m-aside-left-close--skin-dark " id="m_aside_left_close_btn"><i class="la la-close"></i></button>
				<div id="m_aside_left" class="m-grid__item	m-aside-left  m-aside-left--skin-dark " style="background-color: #010205" >
					{% include 'include/sidebar.volt' %}		

					<!-- END: Aside Menu -->
				</div>

				<!-- END: Left Aside -->
				<div class="m-grid__item m-grid__item--fluid m-wrapper">

					<!-- BEGIN: Subheader -->
					{%- block subheader %} {% endblock -%}
					<!-- END: Subheader -->
					 {%- block content %} {% endblock -%}
				</div>
			</div>

			<!-- end:: Body -->

			<!-- begin::Footer -->
				
			{% include 'include/footer.volt' %}		
			<!-- end::Footer -->
		</div>

		<!-- end:: Page -->

		<!-- begin::Quick Sidebar -->
		 
			 {%- block quicksidebar %} {% endblock -%}
		<!-- end::Quick Sidebar -->

		<!-- begin::Scroll Top -->
		<div id="m_scroll_top" class="m-scroll-top">
			<i class="la la-arrow-up"></i>
		</div>

		<!-- end::Scroll Top -->

		<!-- begin::Quick Nav -->
	 
		 {%- block quicknav %} {% endblock -%}

		<!-- begin::Quick Nav -->
		{% include 'include/js_after.volt' %}		
		 
		 {%- block js_after %} {% endblock -%}
	</body>
		
	<!-- end::Body -->

	<!-- end::Body -->
</html>

