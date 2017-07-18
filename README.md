# README

 # Before Steps :
 * Create database named as DiscussionPlatform.
 * Run Migration.
 * seeds.rb for inserting data in database in post table.
 
 # List of Gems :
 * Faker gem is used to insert data in table initially
 * Will_paginate.
 * activerecord. 
 * pg gem for postgres
 * racksh for directly executing query on terminal.


 # Schemas:
 1. post      ('id' is primarykey,title,summary) 
 2. user 	 ('id' is primarykey, email_id unique constraint,name)  ------->>has many comments through user_comments,has many user_comments.
 3. user_comment ('id' as primarykey, post_id,user_id,comment_id)       ------->> belongs to user,comment.
 4. comment      ('id' as primarykey,comment,like_count,dislike_count)  ------->> has one user through user_comment,has one user_comment .
	
	
# Flow :
1. First Api for getting Posts : [URL]------>> localhost:3000/api/v1/post
		Will return id,title,summary as json data by default. 
		Type of Request : Get
		
	
2. Second Api for saving e_mail id :[url]------->> localhost:3000/api/v1/user  
		Will take name,email_id as input params and if email_id doesn't in database will save it.
		Type of Request : Post
		
		
3. Third Api for getting comments, username coressponding to post:[url]------->> localhost:3000/api/v1/usercomment
        Will take post_id as input param and return comments(array of comments with user details)
		for the post_id passed. On a page 10 comments will be displayed at a time,
		after scrolling further comments will be loaded. (Will_paginate gem is used)
		Type of Request : Get
		
		
4. Fourth Api for saving comments :[url]------->> localhost:3000/api/v1/savecomment
		Will take post_id,user_id,comment as params ,if email_id coressponding to user not present will hit api for saving email_id
		else save comments.
		Type of Request :Put
		
5. Fifth Api for saving like and dislike count.:[url]------->> localhost:3000/api/v1/comment 
		Will take user_id, comment_id, boolean like (true/false) where like=true  means like_count increment else dislike_count increment.
		Type of Requset :Post
	