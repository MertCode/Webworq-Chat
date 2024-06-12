<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Group;
use App\Models\Message;
use App\Http\Requests\StoreMessageRequest;


class MessageController extends Controller
{
    // this loads messages by users
    public function byUser(User $user)
    {
        $messages = Message::where('sender_id', auth()->id())
            ->where('receiver_id', $user->id)
            ->orWhere('sender_id', $user->id)
            ->where('receiver_id', auth()->id())
            ->latest()
            ->paginate(10);

        return inertia('Home', [
            'selectedConversation' => $user->toConversationArray(),
        ]);
    }

    // this loads messages by groups
    public function byGroup(Group $group)
    {
    }

    // this loads older messages - limited to provided method
    public function loadOlder(Message $message)
    {
    }

    // this stores a new message
    public function store(StoreMessageRequest $request)
    {
    }

    // this deletes a message
    public function destroy(Message $message)
    {
    }
}
