<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('admins')->insertOrIgnore([
	        'name' => 'Super Admin',
	        'email' => 'admin@miceafrica.org',
	        'password' => Hash::make('admin123'),
	        'updated_at'    => date("Y-m-d H:m:i"),
	        'created_at'	=> date("Y-m-d H:m:i")
      	]);

          DB::table('users')->insertOrIgnore([
	        'name' => 'Super Admin',
	        'email' => 'admin@miceafrica.org',
	        'password' => Hash::make('admin123'),
	        'updated_at'    => date("Y-m-d H:m:i"),
	        'created_at'	=> date("Y-m-d H:m:i")
      	]);

          DB::table('admins')->insertOrIgnore([
	        'name' => 'Super Admin',
	        'email' => 'support@fincon2024.co.ke',
	        'password' => Hash::make('admin123'),
	        'updated_at'    => date("Y-m-d H:m:i"),
	        'created_at'	=> date("Y-m-d H:m:i")
      	]);
    }
}
