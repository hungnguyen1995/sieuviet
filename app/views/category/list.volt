{% extends 'layouts/main.volt' %}
{% block content %}
    <div class="m-content">
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
        <div class="m-portlet m-portlet--mobile">
            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <div class="m-portlet__head-title">
                        <h3 class="m-portlet__head-text">
                            Danh Mục
                        </h3>
                    </div>
                </div>
            </div>
            <div class="m-portlet__body">

                <!--begin: Datatable -->
                <div id="m_table_1_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <div class="row">
                        <div class="col-sm-12">
                            <table class="table table-striped- table-bordered table-hover table-checkable dataTable no-footer dtr-inline collapsed"
                                   id="m_table_1" role="grid" aria-describedby="m_table_1_info" style="width: 974px;">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Parent</th>
                                    <th>Created_at</th>
                                    <th>Update_at</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                {% for index,category  in categories %}
                                    <tr data-id="{{ category['id'] }}">
                                        <td>{{ index+1 }}</td>
                                        <td>
                                            {#{% for cate in category['level'] %}#}
                                            {#{% if %}#}
                                            {#{% endfor %}#}

                                            <?php for($i = 0 ; $i < $category['level']; $i++  ){
									if($i == 0  ){
									continue;
								}						
							 		echo "==>";
                                            } ?> {{ category['name'] }}</td>
                                        <td>
                                            <span>{{ category['parent'] == 0 ? 'Danh Mục Cha' : categories[category['parent']]['name'] }} </span>
                                        </td>
                                        <td>{{ category['created_at'] }}</td>
                                        <td>{{ category['updated_at'] }}</td>
                                        <td>
                                            <a class="edit btn btn-default"
                                               href="/blog/category/edit/{{ category['id'] }}"><i
                                                        class="fa fa-edit"></i></a>
                                            <button class="delete btn-default btn" data-id="{{ category['id'] }}"><i
                                                        class="fa fa-minus-circle"></i></button>
                                        </td>

                                    </tr>
                                {% endfor %}
                                </tbody>
                            </table>


                        </div>
                    </div>
                    <a href="/blog/category/create" class="btn btn-primary">
							<span>
								<i class="fa fa-edit"></i>
								<span>Tạo Danh Mục</span>
							</span>
                    </a>

                </div>
            </div>
        </div>

        <!-- END EXAMPLE TABLE PORTLET-->
    </div>
{% endblock %}

{% block js_after %}
    <script type="text/javascript">
        $('.delete').click(function () {
            let id = $(this).data('id');
            delete_category(id);
        });

        function delete_category(id) {
            $.ajax({
                url: '/blog/category/destroy/' + id,
                type: 'DELETE',
            })
                .done(function (res) {
                    $(`tr[data-id="${id}"]`).remove();
                    toastr.success(res);
                }).fail(function (res) {
                console.log(res);
                toastr.error(res.responseText);
            });
        }

    </script>
    <script type="text/javascript">
        $('.alert').delay(3000).slideUp();
    </script>
{% endblock %}