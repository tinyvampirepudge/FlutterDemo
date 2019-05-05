
//String playerName(String name) {
//  if (name != null) {
//    return name;
//  } else {
//    return 'Guest';
//  }
//}

//String playerName(String name) => name != null ? name : 'Guest';

String playerName(String name) => name ?? 'Guest';

main(){
  print('${playerName("猫了个咪")}');
  print('${playerName(null)}');
}

