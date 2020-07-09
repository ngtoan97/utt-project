<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Mail;


class MailService extends Mailable
{
    use Queueable, SerializesModels;

    public $detail;
    public $view;
    public $subject;

    /**
     * Create a new message instance.
     *
     * @param $detail
     * @param $view
     * @param $subject
     */
    public function __construct($detail, $view, $subject)
    {
        $this->detail  = $detail;
        $this->view    = $view;
        $this->subject = $subject;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject($this->subject)->view($this->view, ['detail' => $this->detail]);
    }

//    public static function sendMailForgotPassword($mail, $full_name, $link_active): void
//    {
//        $url     = Config::get('app.url', 'default') . '/reset-password/' . $link_active;
//        $subject = 'Reset password';
//        $view    = 'mail.emailForgotPassword';
//        $details = [
//            'body'      => trans('global.mail.body'),
//            'full_name' => $full_name,
//            'url'       => $url
//        ];
//        Mail::to($mail)->send(new MailService($details, $view, $subject));
//    }

    public static function sendMailNotification($mail, $full_name, $body): void
    {
        $subject = 'Notification';
        $view    = 'mail.sendNotification';
        $details = [
            'body'      => $body,
            'full_name' => $full_name,
        ];
        Mail::to($mail)->send(new MailService($details, $view, $subject));
    }


}
