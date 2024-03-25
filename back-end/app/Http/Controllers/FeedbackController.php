<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Feedback;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FeedbackController extends Controller
{
    //---------
    public function index(Request $request)
    {
        $feedback = Feedback::with('user')->latest()->paginate(5);
        return response()->json($feedback);
    }
    // --------------
    public function storeFeedback(Request $request)
    {
        $rules = [
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'category' => 'required|string|max:255',
            // 'user_id' => 'required|exists:users,id'
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $feedback = Feedback::create([
            'title' => $request->input('title'),
            'description' => $request->input('description'),
            'category' => $request->input('category'),
            'user_id' => $request->input('user_id')
        ]);

        return response()->json(['message' => 'Feedback stored successfully', 'feedback' => $feedback], 201);
    }
    // ---------
    public function viewFeedback($id)
    {
        $feedback = Feedback::with(['comment' => function ($query) {
            $query->orderByDesc('created_at')->with('user');
        }])->find($id);
        return response()->json($feedback);
    }
    // --------
    public function storeComment(Request $request, $id)
    {

        $rules = [
            'message' => 'required|string',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $feedback = Feedback::findOrFail($id);

        $comment = new Comment();
        $comment->feedback_id = $feedback->id;
        $comment->user_id = $request->input('user_id');
        $comment->content = $request->input('message');
        $comment->save();

        return response()->json(['message' => 'Comment stored successfully'], 201);
    }
}
