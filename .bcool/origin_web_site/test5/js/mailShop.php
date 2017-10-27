
<?php
header('Content-type: application/json');
session_start();

require_once 'emailData.php';

//обработчик формы
if ($_POST) {
    $to_email = "info@prostoled.com.ua, serjshevchuk@gmail.com"; //Recipient email, Replace with own email here
    //$to_email = "serjshevchuk@gmail.com"; //Recipient email, Replace with own email here
   
    //Sanitize input data using PHP filter_var().
    $user_name = filter_var($_POST["name"], FILTER_SANITIZE_STRING);
    $user_tel = filter_var($_POST["tel"], FILTER_SANITIZE_NUMBER_INT);
    $user_num = filter_var($_POST["count"], FILTER_SANITIZE_NUMBER_INT);
    $user_comment = filter_var($_POST["comment"], FILTER_SANITIZE_STRING);

    // subject
    $subject = "Prostoled";

    //email body
    $message_body = "Поступил заказ:" .
        "\n<br>\n\n" .
        "Имя: \n " . $user_name . "\n<br>\n\n" .
        "Телефон: \n " . $user_tel . "\n<br>\n\n" .
        "Количество: \n " . $user_num . "\n<br>\n\n" .
        "Комментарий/Вопрос: \n " . $user_comment .
        "<br><br> URL откуда пришла заявка: " . $_POST["location"];

    //proceed with PHP email.
    $headers = 'From: ProstoLED' . "\r\n" .
        'Content-type: text/html; charset=utf-8' . "\r\n" .
        'Reply-To: ProstoLED' . "\r\n" .
        'X-Mailer: PHP/' . phpversion();

    $send_mail = mail($to_email, $subject, $message_body, $headers);

    if (!$send_mail) {
        //If mail couldn't be sent output error. Check your PHP email configuration (if it ever happens)
        $output = json_encode([
            'type' => 'error',
            'text' => 'Could not send mail! Please check your PHP mail configuration.'
        ]);
        exit($output);
    } else {
        $output = json_encode([
            'type' => 'message',
            'text' => '<div><span>Спасибо за обращение.</span></div><div><span>Вы можете сразу же оплатить Ваш заказ!</span></div><div 
class="buy-link"><a href="//www.liqpay.com/ru/checkout/card/i54805763178" target="_blank" class="btn btn-default ripplelink">Оплатить</a> </div>
<div class="buy-link">
<div class="ship-pay__cntnt_visa">
                    <img src="img/mastercard_PNG27.png" alt="">
                    </div>
</div>'
        ]);
        exit($output);
    }
}
