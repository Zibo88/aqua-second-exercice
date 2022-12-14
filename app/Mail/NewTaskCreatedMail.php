<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class NewTaskCreatedMail extends Mailable
{
    use Queueable, SerializesModels;

    private $new_task;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($_new_task)
    {
        $this->new_task = $_new_task;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $data = [
            'new_task' => $this->new_task
        ];
        
        return $this->view('email.new_task_created_mail',$data);
    }
}
