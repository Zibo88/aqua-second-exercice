<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class EmployeeNoteMail extends Mailable
{
    use Queueable, SerializesModels;

    private $task_updated;
    private $user_logged;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($_task_updated,$_user_logged)
    {
        $this->task_updated = $_task_updated;
        $this->user_logged = $_user_logged;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $data = [
            'task_updated' => $this->task_updated,
            'user_logged' => $this->user_logged
        ];

        return $this->view('email.employee_note_mail', $data);
    }
}
