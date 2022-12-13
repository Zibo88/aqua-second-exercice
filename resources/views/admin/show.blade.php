@extends('layouts.app')

@section('content')
    <section class="show p-3">
        <div class="container">
            @if ($user_role_admin === 'admin')
                <h2 >Le task di {{ucfirst($user_page_name)}} {{ucfirst($user_page_lastname)}}</h2>
            @endif
            <div class="row">
                <div class="col-8 mt-5">
                    @foreach ($all_tasks as $task)
                    @if ($user_page_id === $task->user_id)

                    <div class="ms_card mt-5 p-4">
                        <h5>Titolo: {{$task->title}}</h5>
                        <p>Note: {{$task->description}}</p>
                        <div>Dead line: {{$task->delivery_time}}</div>
                        <div>Consegnato il {{$task->created_at->format('d-m-Y - H:m')}}</div>
                        <div>Assegnato a: {{$task->user->name}} {{$task->user->lastname}}</div>

                        <div class=" d-flex mr-3">
                            <label class="mr-3">Status:</label>
                            <div class="{{$task->status == 0 ? 'red' : 'green'}} status mr-4"></div>
                        </div>

                        <div class="d-flex mt-3 justify-content-end align-items-center" >

                            <div class="mr-3">
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
    </section>
@endsection