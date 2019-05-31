{% extends 'layouts/main.volt' %}
{% block content %}
    <div class="log-form">

      <h2>Register</h2>
       <p><?php $this->flashSession->output() ?></p>
      <form method="post" action="/register">
       <?php echo $form->render('csrf'); ?> <br/>
      name
        <?php echo $form->render('name'); ?> <br/>
    email
          <?php echo $form->render('email'); ?> <br/>
      password
           <?php echo $form->render('password'); ?> <br/>
        <button type="submit" class="btn">register</button>
      </form>
    </div>
{% endblock %}
