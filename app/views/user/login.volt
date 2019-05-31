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
        <h5 class="card-title text-center">Login</h5>
        <form name="myForm" class="form-signin"action="/login" method="post">
          <div class="form-label-group">
            <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required
                   autofocus>
            <label for="inputEmail">Email address</label>
          </div>

          <div class="form-label-group">
            <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
            <label for="inputPassword">Password</label>
          </div>

          <div class="custom-control custom-checkbox mb-3">
            <input type="checkbox" class="custom-control-input" id="customCheck1">
            <label class="custom-control-label" for="customCheck1">Remember password</label>
          </div>
          <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
        </form>
      </div>

    </div>
  </div>

{% endblock %}