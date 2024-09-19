<?php

use App\Http\Controllers\RegisterController;
use App\Models\DPOModel;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/events/{id}', function ($id) {
    return view('event', ['id' => $id]);
});


Route::get('/about-amfi', function () {
    return view('about');
});

Route::get('/venue', function () {
    return view('venue');
});

Route::get('/agenda', function () {
    return view('agenda');
});

Route::get('/partners', function () {
    return view('partners');
});


Route::get('registration', 'RegisterController@index')->name('registration.index');
Route::post('registration', 'RegisterController@store')->name('registration.store');

Route::get('all-events', 'BrowseEventsController@index')->name('events.browse');
Route::post('all-events/search', 'BrowseEventsController@search')->name('events.search');
Route::get('all-events/{slug}', 'BrowseEventsController@details')->name('events.details');
Route::get('all-events/category/{category_id}', 'CategoryController@index')->name('events.category');

Route::get('/venues', 'VenueController@index')->name('venues.browse');
Route::get('/venues/{id}', 'VenueController@show')->name('venues.details');

Route::get('/blog', 'PostController@index')->name('posts.index');
Route::get('/blog/{slug}', 'PostController@show')->name('posts.show');
Route::get('blog/groups/{id}', 'PostController@groups')->name('posts.groups');
Route::post('blog/comments/guest', 'CommentController@gueststore')->name('guest.comments.store');
Route::post('blog/comments', 'CommentController@store')->name('comments.store');
Route::post('blog/subcomment', 'CommentController@subcommentstore')->name('subcomments.store');

Route::get('unsubscribe', 'CommentController@index')->name('unsubscribe');
Route::get('set-password/{user_id}', 'PasswordController@index')->name('set-password');
Route::post('set-password', 'PasswordController@store')->name('set-password.store');

Route::get('exhibitor-request-form', 'ExhibitorController@index')->name('view.request.form');
Route::post('exhibitor-request-form', 'ExhibitorController@store')->name('save.request.form');

Route::get('checkout/payments', 'OrderController@payments')->name('order.payments');
Route::post('ticket/payment/bankdeposit', 'RegisterController@bankupload')->name('confirm.payment.bankdeposit');
Route::get('checkout/success', 'OrderController@success')->name('order.success');

Route::get('/contacts', function () {
    return view('contacts');
});

Auth::routes(['verify' => true]);

Route::group(array('middleware' => ['auth:web']), function () {
    
    Route::post('/checkout', function (Request $request) {
        $inputs = $request->all();
        return view('checkout', ['inputs' => $inputs]);
    });

    Route::get('/home', 'HomeController@index');
    Route::get('/attending', 'TicketController@index')->name('attending');
    Route::post('checkout/event', 'TicketController@checkout')->name('confirm.event.order');
    
    Route::post('checkout/confirm', 'OrderController@store')->name('checkout.event.order');
    
    Route::post('ticket/payment/mpesa', 'OrderController@mpesastore')->name('confirm.payment.mpesa');
    
    
    Route::get('user-profile', 'UserController@profile')->name('user.profile.view');
    Route::post('user-profile', 'UserController@update')->name('user.profile.update');
    
    Route::get('newsfeed', 'PostController@index')->name('newsfeed');
    Route::get('programme', 'AgendaController@index')->name('programme');
    Route::get('speakers', 'SpeakerController@index')->name('speakers');
    Route::get('speakers/{id}', 'SpeakerController@show')->name('speakers.show');
    Route::get('sponsors', 'PartnerController@index')->name('partners');
    Route::get('venue-rooms', 'VenueController@rooms')->name('venue-rooms');
    Route::get('ticket-payment', 'TicketController@payments')->name('ticket-payment');
    Route::get('venue-rooms/{id}', 'VenueController@roomdetails')->name('room.details');

    Route::get('manage/create-event', 'EventController@create')->name('events.create');
    Route::post('manage/create-event', 'EventController@store')->name('events.store');
    Route::get('manage/my-events', 'EventController@index')->name('events.index');
    Route::get('manage/edit-event/{id}', 'EventController@edit')->name('events.edit');
    Route::patch('manage/edit-event/{id}', 'EventController@update')->name('events.update');
    Route::delete('manage/delete-event/{id}', 'EventController@destroy')->name('events.destroy');
    Route::get('manage/event-details/{id}', 'EventController@show')->name('events.show');
    Route::get('organizers', 'OrganizerController@index')->name('organizers.index');
    Route::get('create-organizer', 'OrganizerController@create')->name('organizers.create');
    Route::post('create-organizer', 'OrganizerController@store')->name('organizers.store');
    Route::get('edit-organizer/{id}', 'OrganizerController@edit')->name('organizers.edit');
    Route::patch('edit-organizer/{id}', 'OrganizerController@update')->name('organizers.update');
    Route::delete('delete-organizer/{id}', 'OrganizerController@destroy')->name('organizers.destroy');
    Route::post('create-event-ticket', 'TicketController@store')->name('tickets.store');
    Route::patch('edit-event-ticket/{id}', 'TicketController@update')->name('tickets.update');
    Route::delete('delete-event-ticket/{id}', 'TicketController@destroy')->name('tickets.destroy');

});


Route::prefix('/backoffice')->name('admin.')->namespace('Admin')->group(function(){

    //Login Routes
    Route::get('/login','LoginController@showLoginForm')->name('login');
    Route::post('/login','LoginController@login')->name('authenticate');
    Route::post('/logout','LoginController@logout')->name('logout');

    Route::group(array('middleware' => ['auth:admin']), function () {

        Route::get('/dashboard', 'DashboardController@index')->name('dashboard');
        
        Route::resource('users', 'UserController');
        
        Route::get('delegates/{status}', 'DelegateController@index')->name('delegates');
        
        Route::resource('orders', 'OrderController');
        
        Route::resource('categories', 'CategoryController');
        Route::resource('eventtypes', 'EventTypeController');
        Route::resource('locations', 'LocationController');
        Route::resource('venues', 'VenueController');
        Route::resource('organizers', 'OrganizerController');
        Route::resource('events', 'EventController');

        Route::resource('tickets', 'TicketController');
        Route::resource('speakers', 'SpeakerController');
        Route::resource('agendas', 'AgendaController');
        Route::resource('partners', 'PartnerController');
        Route::resource('exhibitors', 'ExhibitorController');
        
        Route::resource('messaging', 'MessageController');
        
        Route::resource('venuerooms', 'VenueRoomController');
        
        Route::post('registration/manage', 'RegistrationController@manage')->name('registration.manage');
        Route::post('registration/ordermanage', 'RegistrationController@ordermanage')->name('order.manage');
        

        Route::resource('posts', 'PostController');
        Route::resource('tags', 'TagController');
        Route::resource('groups', 'GroupController');
        Route::post('post-tags/{post_id}', 'PostTagController@store')->name('posttags.store');
        Route::post('posttags/{tag_id}', 'PostTagController@remove')->name('posttag.remove');
        Route::post('group-posts/{post_id}', 'GroupPostController@store')->name('groupposts.store');
        Route::post('groupposts/{group_id}', 'GroupPostController@remove')->name('groupposts.remove');

    });

});




// NOTE :: Both generating payment token and redirecting to dpo for payment are done explicitly during registration
// However if you need to request them implicitly you can use this routes
Route::post('dpo/generateDPOtoken/{amount}', [RegisterController::class, 'requestTokenFromDPO']);
Route::post('dpo/redirecttoDPOpayment/{payment_token}', [RegisterController::class, 'redirectToDPOForPayment']);




// Use this route to check transaction status
Route::post('dpo/checkDPOstatus/{payment_token}', [RegisterController::class, 'checkTransactionStatus']);

Route::post('dpo/updateDPOstatus', [RegisterController::class, 'bulkConfirmDPOTransaction']);


Route::post('dpo/callback', [RegisterController::class, 'dpoCallback']);


Route::post('dpo/startasync', [RegisterController::class, 'startAsyncProcess']);


Route::get('/run-background-task', function () {
    DPOModel::sirLogging("json_encode(ll)");
    $endDate = Carbon::parse('2024-09-30 23:59:59'); // Replace with your actual end date

    if (Carbon::now()->lt($endDate)) {

        $all = Order::whereNotNull('dpo_code')
        // $all = Order::whereNull('dpo_code')
        ->where('status', '!=', 'complete')
        ->get();

        DPOModel::sirLogging(json_encode($all)); 

        $count = 0;
        $failed = 0;
        foreach($all as $transaction){
            $status = DPOModel::checkTransactionStatus($transaction->dpo_code);

            if($status == 1){
                $count +=1;
            }
            else{
                $failed +=1;
            }
        }

        // return response()->json([
        //     "newly_paid"=> $count,
        //     "not_paid_yet"=>$failed
        // ]);

        // Trigger the task again after a delay (e.g., 10 seconds)
        Http::get(url('/run-background-task?delay=10')); // Self-calling the route
    }
    
    return response()->json(['status' => 'Task executed']);
});

// });
