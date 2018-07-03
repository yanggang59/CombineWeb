/**
 * Created by Administrator on 2017/2/13.
 */
jQuery(document).ready(function () {

    /*
     Fullscreen background
     */
    $.backstretch("images/login/reg.jpg");

    /*
     Form validation
     */
    $('.login-form input[type="text"], .login-form input[type="password"], .login-form input[type="email"], .login-form input[type="tel"], .login-form textarea').on('focus', function () {
        $(this).removeClass('input-error');
    });

    $('.login-form').on('submit', function (e) {

        $(this).find('input[type="text"], input[type="password"],input[type="email"], input[type="tel"],  textarea').each(function () {
            if ($(this).val() == "") {
                e.preventDefault();
                $(this).addClass('input-error');
            }
            else {
                $(this).removeClass('input-error');
            }
        });

    });


});

