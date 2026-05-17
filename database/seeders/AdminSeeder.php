<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    public function run(): void
    {
        User::firstOrCreate(
            ['email' => 'prestamodematerialesuas@gmail.com'],
            [
                'username' => 'admin',
                'phone' => '6671234567',
                'role' => 'admin',
                'password' => Hash::make('admin123'),
            ]
        );
    }
}
