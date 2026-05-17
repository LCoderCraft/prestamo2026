<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    public function run(): void
    {
        $admins = [
            ['username' => 'LUIS',   'email' => 'prestamodematerialesuas+luis@gmail.com'],
            ['username' => 'ANGEL',  'email' => 'prestamodematerialesuas+angel@gmail.com'],
            ['username' => 'Leticia','email' => 'prestamodematerialesuas+leticia@gmail.com'],
        ];

        foreach ($admins as $admin) {
            User::firstOrCreate(
                ['email' => $admin['email']],
                [
                    'username' => $admin['username'],
                    'phone'    => '6671234567',
                    'role'     => 'admin',
                    'password' => Hash::make('admin123'),
                ]
            );
        }
    }
}
