<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ai_knowledge_bases', function (Blueprint $table) {

            $table->id();

            $table->uuid('uuid')->unique();

            $table->unsignedBigInteger('organization_id')->index();

            $table->string('source'); // File, Text, URL

            $table->string('title');

            $table->longText('content')->nullable();

            $table->longText('embeddings'); // JSON vector

            $table->timestamps();

            $table->index('organization_id');

        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ai_knowledge_bases');
    }
};
