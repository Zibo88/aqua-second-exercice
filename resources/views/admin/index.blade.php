@extends('layouts.app')

@section('content')
    <section class="index ">
        <div class="container">
            @if ($user->role === 'admin')
                <h1>Tutti i dipendenti</h1>
            @else
                <h1>Le tue Task</h1>
            @endif
            
            @if($show_deleted_message === 'yes')
            <div class="alert alert-success" role="alert">
                Post eliminato con successo
                </div>
            @endif
            @if ($user->role === 'admin')
                <div class="row row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5">
                    @foreach ( $employees as  $employee)
                    <div class="col-6">
                        <div class="ms_card">
                            <h5>  {{ucfirst($employee->name)}} {{ucfirst($employee->lastname)}}</h5>
                            <div>Email: <br> {{$employee->email}}</div>
                            <a href="{{route('admin.tasks.show', ['task' => $employee->id])}}">Task dipendente</a>
                        </div>
                    </div>
                    @endforeach 
                </div>
            @endif

            {{-- Dipendente --}}
            @if ($user->role === 'dipendente' && count($employee_task) >= 1)
            <div class="row">
                @foreach ($employee_task as $task)
                    <div class="col-6">
                        <div class="ms_card mt-5 p-4">
                            <h5> Task: <br>{{$task->title}}</h5>
                            <p>Nota: <br> {{$task->description}}</p>
                            <div>Preso in consegna il: <br> {{$task->user->created_at->format('d-m-Y - H:m')}}</div>
                            <div class="d-flex mt-3 justify-content-end align-items-center">
                                <div  class="{{$task->status == 0 ? 'red' : 'green' }} status mr-4"></div>
                                <a class="btn btn-primary justify-content-end " href="{{route('admin.tasks.edit' , ['task' => $task->id])}}">Aggiungi Nota</a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            @elseif($user->role === 'dipendente' && count($employee_task) < 1)
               <h3>Nessuna Task assegnata</h3>
            @endif
        </div>
  
    </section>
@endsection