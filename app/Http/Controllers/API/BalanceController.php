<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User; 
use App\Transaction;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth; 
use Validator;

class BalanceController extends Controller
{
	public $successStatus = 200;
	public $unauthorisedStatus = 401;
	public $invalidStatus= 406;
	public $failedStatus = 403;

	public function getBalances(){ 
		$balance = Transaction::where('type', 'Debit')->pluck('amount')->sum() - Transaction::where('type', 'Credit')->pluck('amount')->sum(); 
		$last_month= Transaction::where('date','like', '%' .Carbon::now()->format('Y-m'). '%')->select('id','date','amount','type')->orderBy('date')->get();
		return response()->json(['balance' => $balance, 'last_month' => $last_month], $this->successStatus); 
	}

	public function getBalance($id){ 
		$transaction = Transaction::with('user')->where('id',$id)->first(); 
		return response()->json($transaction, $this->successStatus); 
	}

	public function postTransactions(Transaction $transactions, Request $request){ 
		$inputs=$request->all();
		$transaction = $transactions->newQuery();

		if ($request->has('from') && $request->has('to')){
			$transaction->whereBetween('date',[$inputs['from'],$inputs['to']])->get();
			$balance = Transaction::where('type', 'Debit')->where('date','<=', $inputs['to'])->pluck('amount')->sum() - Transaction::where('type', 'Credit')->where('date','<=', $inputs['to'])->pluck('amount')->sum();
		}
		if ($request->has('type')){
			$transaction->where('type',$inputs['type'])->get();
		}
		$transactions=$transaction->select('id','date','amount','type')->orderBy('date')->get();
		return response()->json(['balance' => round($balance, 2), 'transactions' => $transactions], $this->successStatus);
	}

	public function postCreateTransactions(Transaction $transactions, Request $request){ 
		$validator = Validator::make($request->all(), Transaction::$rules);
		if ($validator->fails()){
			return response()->json(['message' => 'invalid'], $this->invalidStatus);
		}

		$transaction = new Transaction;
		$transaction->type = $request->get('type');
		$transaction->user_id = Auth::id();
		$transaction->date = $request->get('date');
		$transaction->amount = $request->get('amount');
		$transaction->transaction_no = $request->get('transaction_no');
		$transaction->remark = $request->get('remark');
		$save = $transaction->save();
		if ($save) {
        	return response()->json(['message' => 'success'], $this->successStatus);
        }		
		return response()->json(['message' => 'failes'], $this->successStatus);
	}
}
