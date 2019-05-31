
		<!--begin::Global Theme Bundle -->
		<script src="{{this.url.getBaseUri()}}/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
		<script src="{{this.url.getBaseUri()}}/assets/demo/default/base/scripts.bundle.js" type="text/javascript"></script>

		<!--end::Global Theme Bundle -->

		<!--begin::Page Vendors -->
		<script src="{{this.url.getBaseUri()}}/assets/vendors/custom/fullcalendar/fullcalendar.bundle.js" type="text/javascript"></script>

		<!--end::Page Vendors -->

		<!--begin::Page Scripts -->
		<script src="{{this.url.getBaseUri()}}/assets/app/js/dashboard.js" type="text/javascript"></script>

		<!--end::Page Scripts -->

		<!--begin::Page Scripts -->
        		<script src="{{this.url.getBaseUri()}}/assets/demo/default/custom/components/base/toastr.js" type="text/javascript"></script>

        <!--end::Page Scripts -->

        <script>
          var  toastr.options = {
              "closeButton": false,
              "debug": false,
              "newestOnTop": false,
              "progressBar": false,
              "positionClass": "toast-top-right",
              "preventDuplicates": false,
              "onclick": null,
              "showDuration": "300",
              "hideDuration": "1000",
              "timeOut": "5000",
              "extendedTimeOut": "1000",
              "showEasing": "swing",
              "hideEasing": "linear",
              "showMethod": "fadeIn",
              "hideMethod": "fadeOut"
            };
        </script>
		<script src="http:///cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"></script>
		<script src="http://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>