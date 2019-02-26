//Function makeAdder(num addBy) {
//  abc(num i) {
//    return addBy + i;
//  }
//
//  return abc;
//}


//
//makeAdder(num addBy) {
//  abc(num i) {
//    return addBy + i;
//  }
//  return abc;
//}

//Function makeAdder(num addBy) {
//  return (num i) => addBy + i;
//}

makeAdder(num addBy) {
  return (num i) => addBy + i;
}

void main() {
  // Create a function that adds 2.
  var add2 = makeAdder(2);
  print('add2:$add2');

  assert(add2 is Function);

  // Create a function that adds 4.
  var add4 = makeAdder(4);
  print('add4:$add4');

  assert(add2(3) == 5);
  assert(add4(3) == 7);

  var add9 = add4(5);
  print('add9:$add9');
}
