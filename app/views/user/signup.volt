{% extends 'layouts/base.volt' %}

{% block css_head %}
  <style type="text/css">
      .errorMessage{
        background: #ffffff;
        border:2px solid #ff7b7b;
        border-radius: 5px;
      }
      .successMessage{
        background: #ffffff;
        border: 2px solid #35ca12;
        border-radius: 5px;
      }
  </style>
{% endblock %}
{% block body %}


  <div class="container">
    <div class="row ">
      <div class="col-md-12">
        <h5 class="card-title text-center">Đăng Kí</h5>
        <form name="myForm" class="form-signin" action="/register"  method="post">
          <div class="form-label-group">
            <label for="inputEmail">Họ và tên</label>
            <input type="text" id="inputEmail" name="name" class="form-control" placeholder="Họ và tên " required
                   autofocus>
          </div>

          <div class="form-label-group">
            <label for="inputEmail">Email</label>
            <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email" required
                   autofocus>
          </div>

          <div class="form-label-group">
            <label for="inputPassword">Mật khẩu </label>
            <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
          </div>

          <div class="custom-control custom-checkbox mb-3">
            <input type="checkbox" class="custom-control-input" id="customCheck1">
            <label class="custom-control-label" for="customCheck1">Remember password</label>
          </div>
          <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Đăng Kí </button>
        </form>
      </div>

    </div>
  </div>


{% endblock %}