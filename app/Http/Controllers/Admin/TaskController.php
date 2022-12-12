<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Task;
use App\User;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Mail\NewTaskCreatedMail;


class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $user = Auth::user();
        $employee_task = Task::where('user_id', '=', $user->id)->get();
       
        // richiamo tutti gli utenti che hanno il ruol odi dipedente
        $employees = User::where('role', '=', 'dipendente')->get();

        // messaggio
        $request_info = $request->all();
        $show_deleted_message = isset( $request_info['deleted']) ? $request_info['deleted'] : null;

        $data = [
            'user' => $user,
            'employees' =>  $employees,
            'employee_task' => $employee_task,
            'show_deleted_message' => $show_deleted_message
        ];


        return view('admin.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $employees = User::where('role', '=', 'dipendente')->get();


        $data = [
            'employees' => $employees,
        ];
        return view('admin.create', $data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate($this->getValidation());

        $form_data_create = $request->all();

        $new_task = new Task();
        $new_task->title =  $form_data_create['title'];
        $new_task->description = $form_data_create['description'];
        $new_task->delivery_time = $form_data_create['delivery_time'];
        $new_task->user_id = $form_data_create['user_id'];
        $new_task->save();

        Mail::to('account@mail.it')->send(new  NewTaskCreatedMail()); 
        
       
        return redirect()->route('admin.tasks.show', ['task' => $new_task->user_id]);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

        // clicco sulla pagina e ragiungo l'utente con l'id corretto
        $user_page = User::findOrFail($id);
        $user_page_id = $user_page->id;
        $user_page_name = $user_page->name;
        $user_page_lastname = $user_page->lastname;

        $user_role = Auth::user();
        $user_role_admin = $user_role->role;

        $all_tasks = Task::all();

        $all_tasks = Task::orderBy('created_at', 'desc')->get();

        foreach($all_tasks as $task){
            $task_delivery_time = $task->delivery_time;
        }

        $delivery_time = $this->getDate($task_delivery_time);
  
        $data = [
            'user_page_id' => $user_page_id,
            'all_tasks' => $all_tasks,
            'delivery_time' => $delivery_time,
            'user_role_admin' => $user_role_admin,
            'user_page_name' =>  $user_page_name,
            'user_page_lastname' =>  $user_page_lastname

        ];

        return view('admin.show', $data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        $task_to_edit = Task::findOrfail($id);

        $users = User::where('role', '=', 'dipendente')->get();
        
        $logged = Auth::user();

        
        $data = [
            'task_to_edit' => $task_to_edit,
            'users' => $users,
            'logged' =>  $logged        
        ];

        return view('admin.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        // $request->validate($this->getValidation());

        $form_data_edit = $request->all();
        // dd($form_data_edit);

        $user_logged = Auth::user();

        $task_updated = Task::findOrFail($id);
       
        if($user_logged->role === 'admin'){
            $request->validate($this->getValidation());
            $task_updated->title =  $form_data_edit['title'];
            $task_updated->delivery_time =  $form_data_edit['delivery_time'];
            $task_updated->user_id = $form_data_edit['user_id'];
            $task_updated->description =  $form_data_edit['description'];
            $task_updated->update();
            return redirect()->route('admin.tasks.show', ['task' =>  $task_updated->user_id]);
        }else{
            $request->validate($this->getValidationEmployee());
            $task_updated->description =  $form_data_edit['description'];
            $task_updated->update();
            return redirect()->route('admin.tasks.index');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $task_to_delete = Task::findOrfail($id);
        $task_to_delete->delete();

    

        return redirect()->route('admin.tasks.index', ['deleted' => 'yes']);
    }

    // funzione per la modifica delle date
    public function getDate($date){
        return Carbon::parse($date);
    }

    public function getValidation(){
        return [
            'title' => 'required | max:100',
            'description' => 'required | max:60000',
            'delivery_time' => 'required',
            'user_id' => 'required',
        ];
    }

    public function getValidationEmployee(){
        return [
            'description' => 'required | max:60000',
        ];
    }




}
