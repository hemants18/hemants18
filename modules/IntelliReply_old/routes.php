<?php

use Illuminate\Support\Facades\Route;

Route::middleware(['auth:user'])->group(function () {
    Route::prefix('/automation/ai')->group(function () {
        Route::get('/', [Modules\IntelliReply\Controllers\AiController::class, 'index']);                      // List all ai
        Route::post('/toggle', [Modules\IntelliReply\Controllers\AiController::class, 'toggle']);                     // Create a new flow
        Route::post('/', [Modules\IntelliReply\Controllers\AiController::class, 'store']);                     // Create a new flow
        // Route::get('/{flow}', [Modules\IntelliReply\Controllers\AiController::class, 'view']); 
        // Route::post('/upload-media/{uuid}/{stepId}', [Modules\IntelliReply\Controllers\AiController::class, 'uploadMedia']);                     
        // Route::put('/{flow}', [Modules\IntelliReply\Controllers\AiController::class, 'update']);               // Update a flow
        // Route::delete('/{flow}', [Modules\IntelliReply\Controllers\AiController::class, 'destroy']);           // Delete a flow
        // // Route::put('/{flow}/publish', [Modules\IntelliReply\Controllers\AiController::class, 'publish']);    // Activate a flow
        // // Route::put('/{flow}/unpublish', [Modules\IntelliReply\Controllers\AiController::class, 'unpublish']);  // Deactivate a flow

        // Route::put('/{flow}/publish', [Modules\IntelliReply\Controllers\AiController::class, 'update']);    // Activate a flow
        // Route::put('/{flow}/unpublish', [Modules\IntelliReply\Controllers\AiController::class, 'update']);  // Deactivate a flow
    });
});

Route::prefix('admin')->middleware(['auth:admin'])->group(function () {
    Route::post('/addons/setup/ai-assistant', [Modules\IntelliReply\Controllers\SetupController::class, 'store']);
    Route::put('/addons/setup/ai-assistant', [Modules\IntelliReply\Controllers\SetupController::class, 'update']);
});