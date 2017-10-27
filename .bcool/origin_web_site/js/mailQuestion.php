<?php
header('Content-type: application/json');
session_start();


require_once 'emailData.php';

//обработчик формы
if ($_POST) {

    //$to_email = "serjshevchuk@gmail.com"; //Recipient email, Replace with own email here
    $to_email = "info@prostoled.com.ua, serjshevchuk@gmail.com"; //Recipient email, Replace with own email here

    //Sanitize input data using PHP filter_var().
    $user_name = filter_var($_POST["name"], FILTER_SANITIZE_STRING);
    $user_tel = filter_var($_POST["tel"], FILTER_SANITIZE_NUMBER_INT);

    // subject
    $subject = "Prostoled";

    //email body
    $message_body = "Клиент очень ждет Вашего звонка:" .
        "\n<br>\n\n" .
        "Имя: \n " . $user_name . "\n<br>\n\n" .
        "Тел.: \n " . $user_tel . "\n<br>\n\n" .
        "<br><br> URL откуда пришла заявка: " . $_POST["location"];

    //proceed with PHP email.
    $headers = 'From: prostoled.com.ua' . "\r\n" .
        'Content-type: text/html; charset=utf-8' . "\r\n" .
        'Reply-To: ' . $user_name . '' . "\r\n" .
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
            'text' => '<div><span>Спасибо за обращение.</span></div><div><span>В ближайшее время с Вами свяжется наш менеджер для уточнения деталей.</span></div>'
        ]);
        exit($output);
    }
}