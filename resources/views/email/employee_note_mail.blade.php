<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <h2>Modifica alla task: {{$task_updated->title}}</h2>
    <p>{{ucfirst($user_logged->name)}} {{ucfirst($user_logged->lastname)}} ha modificato la task: <br>
        <div></div>
        Testo: <br>
        {{$task_updated->description}}
    </p>
    <a href="{{route('admin.tasks.show' , ['task' => $task_updated->user_id])}}">Vedi dettagli</a>
</body>
</html>