@extends('layouts.app')

@section('content')
    <section>
        <div class="container">
            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                    </ul>
                </div>
            @endif
            <div class="row">
                <div class="col">
                    <form action="{{route('admin.tasks.update' , ['task' => $task_to_edit->id])}}" method="post" class="row g-3 needs-validation" novalidate>
                        @csrf
                        @method('PUT')
                        <div class="col-md-6">
                          <label for="title" class="form-label">Titolo</label>
                          <input type="text" class="form-control" id="title" name="title" value="" >
                        </div>

                        <div class="col-md-12">
                            <label for="description" class="form-label">Description</label> <br>
                            <textarea name="description" id="description" cols="65" rows="10"></textarea>
                        </div>

                        <div class="col-md-6">
                            <label for="delivery_time" class="form-label">Data di consegna</label>
                            <input type="date" class="form-control" id="delivery_time" name="delivery_time" value="" >
                        </div>

                        <div class="col-md-12 my-4">
                            <label for="user_id"></label>
                            <select name="user_id" id="user_id" value="">
                                <option value="">Nessuno</option>
                                @foreach ($users as $user)
                                    <option value="{{$user->id}}">{{ucfirst($user->name)}} {{ucfirst($user->lastname)}} </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-12">
                          <button class="btn btn-primary" type="submit">Submit form</button>
                        </div>
                      </form>
                </div>
            </div>
        </div>
    </section>
@endsection