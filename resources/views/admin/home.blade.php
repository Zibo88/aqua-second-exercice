@extends('layouts.app')

@section('content')
    <section>
        <div class="container">
            <div class="row">
                <div class="col">
                  @if ($user->role === 'admin')
                    <p>Ciao {{$user->name}} {{$user->lastname}}</p>
                    <p>la tua email è: {{$user->email}}</p>
                    <p>Questa è la tua dashboard:</p>
                    <ul>
                        <li>
                            <a href="{{route('admin.tasks.index')}}">Tutti i dipendenti</a>
                        </li>
                        <li>
                            <a href="{{route('admin.tasks.create')}}">Assegna una nuova task</a>
                        </li>
                    </ul>
                    {{-- parte dipendente --}}
                  @else
                    <p>Ciao {{$user->name}} {{$user->lastname}}</p>
                    <div>la tua email è: {{$user->email}}</div>

                    <ul>
                      <li>
                          <a href="{{route('admin.tasks.index')}}">Visualizza le tue task</a>
                      </li>
                    </ul>
                  @endif
                </div>
            </div>
        </div>
    </section>
@endsection