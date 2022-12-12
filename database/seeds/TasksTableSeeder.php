<?php

use Illuminate\Database\Seeder;
use Faker\Generator as Faker;
use App\User;
use App\Task;

class TasksTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(Faker $faker)
    {
    

        for ($i=0; $i < 5; $i++) { 
            $new_task = new Task();
            $new_task->title = $faker->sentence();
            $new_task->description = $faker->text(100);
            $new_task->delivery_time = $faker->dateTime();
            $new_task->status = $faker->numberBetween(0, 1);

            $users = User::all();
            
            foreach($users as $user){
                $new_task->user_id = $user->id;
            }
            $new_task->save();
        }

       
        
    }
}
