<?php

use Illuminate\Support\Facades\Broadcast;

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

Broadcast::channel('agents.{organizationId}', function ($user, $organizationId) {
    if (($user->teams ? $user->teams[0]->organization_id : 0) !== (int) $organizationId) {
        return false;
    }

    return [
        'id' => $user->id,
        'name' => $user->full_name,
        'role' => $user->teams ? $user->teams[0]->role : $user->role,
    ];
});

Broadcast::channel('chats', function ($user) {
    return true; // Adjust authentication logic if needed
});
