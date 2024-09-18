<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Post extends Model
{
    use SoftDeletes;

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = [
        'deleted_at'
    ];

    /**
     * setup variable mass assignment.
     *
     * @var array
     */
    protected $fillable = [
        'title', 'slug', 'author', 'short_desc', 'long_desc', 'cover_img', 'url_link', 'admin_id', 'is_published'
    ];


    public function tags()
    {
    	return $this->belongsToMany('App\Models\Tag', 'post_tags')->withTimestamps();
    }

    public function groups()
    {
    	return $this->belongsToMany('App\Models\Group', 'group_posts')->withTimestamps();
    }

    public function comments()
    {
    	return $this->hasMany('App\Models\Comment');
    }
}
