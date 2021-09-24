

class User{
int id;
String userName;

User({required this.id,required this.userName});
}



class Post{
  int userid;
  int id;
  int ? userLiked;
  int ? likes;
  int ? comments;

  Post({required this.userid,required this.id,required this.userLiked,required this.likes,required this.comments});
}