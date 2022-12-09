@extends('layouts.app')

@section('content')
    <section>
        {{-- @if($show_deleted_message === 'yes')
	        <div class="alert alert-success" role="alert">
	            Post eliminato con successo
	        </div>
        @endif --}}
        <div class="container">
            @if ($user->role === 'admin')
                <h1>Tutti i dipendenti</h1>
            @else
                <h1>Le tue Task</h1>
            @endif
            @if ($user->role === 'admin')
                <div class="row row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5">
                    @foreach ( $employees as  $employee)
                    <div class="col-6">
                        <div class="card">
                            <div>{{$employee->name}} {{$employee->lastname}}</div>
                            <div>Email: <br> {{$employee->email}}</div>
                            <a href="{{route('admin.tasks.show', ['task' => $employee->id])}}">Scheda</a>
                        </div>
                    </div>
                    @endforeach 
                </div>
            @endif

            {{-- Dipendente --}}
            @if ($user->role === 'dipendente' && count($employee_task) >= 1)
            <div class="row">
                @foreach ($employee_task as $task)
                    <div class="col-12">
                        <div class="card mt-5">
                            <h5> Titolo: <br>{{$task->title}}</h5>
                            <p>Descrizione: <br> {{$task->description}}</p>
                            <div>Preso in consegna il: <br> {{$task->user->created_at->format('d-m-Y - H:m')}}</div>
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