@extends('layouts.app')

@section('content')
    <section>
        

       
        <div class="container">
            @if ($user_role_admin === 'admin')
                <h2>Le task di {{ucfirst($user_page_name)}} {{ucfirst($user_page_lastname)}}</h2>
            @endif
            <div class="row">
                <div class="col-12 mt-5">
                    @foreach ($all_tasks as $task)
                    @if ($user_page_id === $task->user_id)
                    <div class="card mt-5">
                        <h5>Titolo: {{$task->title}}</h5>
                        <p>Decrizione: {{$task->description}}</p>
                        <div>Dead line: {{$delivery_time->format('d-m-Y - H:m')}}</div>
                        <div>Consegnato il {{$task->created_at->format('d-m-Y - H:m')}}</div>
                        <div>Assegnato a: {{$task->user->name}} {{$task->user->lastname}}</div>
                        <div>
                            <div>
                                <a class="btn btn-primary" href="{{route('admin.tasks.edit' , ['task' => $task->id])}}">Modifica Task</a>
                            </div>

                            <div>
                                <form action="{{route('admin.tasks.destroy', ['task' => $task->id])}}" method="POST">
                                    @method('DELETE')
                                    @csrf

                                    <input type="submit" class="btn btn-danger" value="Cancella" onclick="return confirm('vuoi davvero cancellare la task {{$task->title}}')" >
                                </form>
                            </div>
                            
                        </div>
                       


                    </div>
                   
                    @endif

                    @endforeach
                </div>
               
            </div>
        </div>







        {{-- @foreach ($all_tasks  as $task )
           
            @if ($role === 'admin')
                @if( $task->user_id === $task_details->user_id)
                <div class="container">
                    
                    <div class="col-12 mt-5">
                        <h4 class="">Task del {{$task->user->created_at->format('d-m-Y - H:m')}}</h4>
                        <div class="card">
                            <h5>Titolo: {{$task->title}}</h5>
                            <p>Decrizione: {{$task->description}}</p>
                            <div>Dead line{{$delivery_date->format('d-m-Y - H:m')}}</div>
                            <div>Consegnato il {{$task->created_at->format('d-m-Y - H:m')}}</div>
                            <div>Assegnato a: {{$task->user->name}} {{$task->user->lastname}}</div>
                            <div>
                                <a class="btn btn-primary" href="{{route('admin.tasks.edit' , ['task' => $task->id])}}">Modifica Task</a>
                            </div>
                            <form action="{{route('admin.tasks.destroy', ['task' => $task->id])}}" method="post">
                                @csrf
                                @method('DELETE')
                                <input type="submit" value="Cancella" class="btn btn-danger" onclick="return confirm('Sei sicuro di voler cancellare?')">
                            </form> 
                        </div>
                    </div>
                </div>
                @endif
            @endif --}}

            {{-- @endforeach --}}
            
            
          
    </section>
@endsection