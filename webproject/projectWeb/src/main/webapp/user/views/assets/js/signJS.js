const signUpBtn = document.getElementById('signUp');
const singInBtn = document.getElementById('signIn');
const container = document.getElementById('container');

signUpBtn.addEventListener('click',() =>{
    container.classList.add('right-panel-active');

});

singInBtn.addEventListener('click',() =>{
    container.classList.remove('right-panel-active');

});

const signUpHere = document.querySelector('.signUpHere');
const signInHere = document.querySelector('.signInHere');
signUpHere.addEventListener('click',() =>{
    container.classList.add('active-mobile');


});
signInHere.addEventListener('click',() =>{

    container.classList.remove('active-mobile');
});
window.onresize = function() {
    var sce = window.innerWidth;
    if(sce <= 768){

        container.classList.remove('right-panel-active');
    }
};

/// xac nhan form dang ky
function Validator(options) {
    // ham xac nhan
    function validate(inputElement, rule) {
        const errorElement = inputElement.parentElement.querySelector('span');
        const errorCheck =  rule.test(inputElement.value);

        if (errorCheck) {
            errorElement.innerText = errorCheck;
            inputElement.parentElement.classList.add('invalid');

        }else{
            errorElement.innerText = '';
            inputElement.parentElement.classList.remove('invalid');

        }

        return !errorCheck ;



    }

    const formElement = document.querySelector(options.form);
    if(formElement){
        // kiem tra submit form


        //lap qua tung input

        options.rules.forEach(function (rule) {
            const inputElement = formElement.querySelector(rule.selector);
            if (inputElement) {
                inputElement.onblur = function () {
                    validate(inputElement,rule);
                }
                inputElement.oninput = function () {
                    const errorElement = inputElement.parentElement.querySelector('span');
                    errorElement.innerText = '';
                    inputElement.parentElement.classList.remove('invalid');

                }
            }
        });


    }



}

// cac rules cua form validator

Validator.isRequired = function (selector) {
    return {
        selector : selector,
        test : function (value) {
            return value.trim() ? undefined : "Bắt buộc nhập trường này";
        }
    };

}
Validator.isEmail = function (selector) {
    return {
        selector : selector,
        test : function (value) {
            var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ ;
            return regex.test(value) ? undefined : "Email không hợp lệ";

        }
    };
}

Validator.isPassword = function (selector ,min) {
    return {
        selector : selector,
        test : function (value) {
            return value.length >= min ? undefined : "Ít nhất "+min +" ký tự";
        }
    };

}
Validator.isConfirmed = function (selector,check,massage) {
    return{
        selector : selector,
        test : function (value) {
            return value == check() ? undefined : massage || 'Bắt buộc nhập trường này';

        }
    }

};




