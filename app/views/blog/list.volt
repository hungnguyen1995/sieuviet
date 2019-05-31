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
                            List Blog
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
                                    <th>avatar</th>
                                    <th>Content</th>
                                    <th>Category</th>
                                    <th>Created_at</th>
                                    <th>Update_at</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>

                                {% for index,blog  in blogs.items %}

                                    <tr data-id="{{ blog.id }}">
                                        <td>{{ index+1 }}</td>
                                        <td>{{ blog.name }}</td>
                                        <td><img src="{{ this.url.getBaseUri() }}/{{ blog.avatar }}" width="100px"
                                                 class="img-avatar" alt=""></td>
                                        <td>{{ blog.content }}</td>
                                        <td>{{ categories[blog.category_id] }}</td>
                                        <td>{{ blog.created_at }}</td>
                                        <td>{{ blog.updated_at }}</td>
                                        <td>
                                            <a class="edit btn btn-default" href="/blog/edit/{{ blog.id }}"><i
                                                        class="fa fa-edit"></i></a>
                                            <button class="delete btn-default btn" data-id="{{ blog.id }}"><i
                                                        class="fa fa-minus"></i></button>
                                        </td>


                                    </tr>
                                {% endfor %}
                                </tbody>
                            </table>


                        </div>
                    </div>
                    <div>

                    </div>
                </div>
            </div>
        </div>
        <a href="/blog/create" class="btn btn-primary">
							<span>
								<i class="fa fa-edit"></i>
								<span>Tạo Bài Viết</span>
							</span>
        </a>
        <!-- END EXAMPLE TABLE PORTLET-->
    </div>

{% endblock %}

{% block js_after %}


    <script type="text/javascript">
        $(document).ready(function () {
            $('#m_table_1').dataTable();
        });
        $('.delete').click(function () {
            let id = $(this).data('id');

            if (!confirm("Accept delete!")) {
                return false;
            }
            delete_blog(id);
        });

        function delete_blog(id) {
            $.ajax({
                url: '/blog/destroy/' + id,
                type: 'DELETE',

            })

                .done(function (res) {
                    $(`tr[data-id="${id}"]`).remove();
                    toastr.success(res);
                });
        }

    </script>
    <script type="text/javascript">
        $('.alert').delay(3000).slideUp();
    </script>
{% endblock %}