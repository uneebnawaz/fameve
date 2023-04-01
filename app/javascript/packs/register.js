$(document).ready(function(){
    
var current_fs, next_fs, previous_fs; //fieldsets
var opacity;

$(".next").click(function(){
    var allFilled = true;
    var isValid = true;
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    var passwordRegex = /^\d{6,}$|^[a-zA-Z]{6,}$/;
    var phoneRegex = /^(\+92|0)?(3\d{2}|4[1-9]\d|5\d{2}|6\d{2}|7\d{2}|8\d{2}|9\d{2})\d{7}$/;
    var csrf_token = $('meta[name="csrf-token"]').attr('content');


    // Check if all fields in current fieldset are filled and pass validation
    $(this).parent().find('input[type!="hidden"]').each(function(){
        var input = $(this);
        var value = input.val();
        
        // Validate email field
        if (input.attr('type') === 'email' && !emailRegex.test(value)) {
            isValid = false;
            alert('Please enter a valid email address.');
        }else if (input.attr('type') === 'email') {
            // Check if email is already taken
            $.ajax({
                url: '/check_email_availability', 
                method: 'POST',
                data: { email: value },
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('X-CSRF-Token', csrf_token); 
                },
                success: function(response) {
                    if (response.available === false) {
                      isValid = false;
                      alert('Email is already taken.');
                    }
                }
            });
        }
        
        // Validate password field
        if (input.attr('type') === 'password' && !passwordRegex.test(value)) {
            isValid = false;
            alert('Please enter a valid password.');
        }

        // Validate phone field
        if (input.attr('type') === 'tel' && !phoneRegex.test(value)) {
            isValid = false;
            alert('Please enter a valid phone number.');
        }
        
        // Check if field is filled
        if (isValid && value === '') {
            allFilled = false;
            alert('Please fill out all the fields.');
            return false; // break out of loop
        }

        // Check if password and confirmation password match
        var password = $('#password').val();
        var confirmPassword = $('#password_confirmation').val();
        if (password !== confirmPassword) {
            isValid = false;
            alert('Password and confirmation password must match.');
        }

    });
    
    if(allFilled && isValid){
        current_fs = $(this).parent();
        next_fs = $(this).parent().next();

        //Add Class Active
        $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

        //show the next fieldset
        next_fs.show(); 
        //hide the current fieldset with style
        current_fs.animate({opacity: 0}, {
            step: function(now) {
                // for making fielset appear animation
                opacity = 1 - now;

                current_fs.css({
                    'display': 'none',
                    'position': 'relative'
                });
                next_fs.css({'opacity': opacity});
            }, 
            duration: 600
        });
    }
});


$(".previous").click(function(){
    
    current_fs = $(this).parent();
    previous_fs = $(this).parent().prev();
    
    //Remove class active
    $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
    
    //show the previous fieldset
    previous_fs.show();

    //hide the current fieldset with style
    current_fs.animate({opacity: 0}, {
        step: function(now) {
            // for making fielset appear animation
            opacity = 1 - now;

            current_fs.css({
                'display': 'none',
                'position': 'relative'
            });
            previous_fs.css({'opacity': opacity});
        }, 
        duration: 600
    });
});

$('.radio-group .radio').click(function(){
    $(this).parent().find('.radio').removeClass('selected');
    $(this).addClass('selected');
});

$(".submit").click(function(){
    return false;
})
    
});