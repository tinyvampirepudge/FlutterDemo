main() {
  // These work in a const string.
  const aConstNull = null;
  const aConstNum = 0;
  const aConstNum1 = 0.1;
  const aConstBool = true;
  const aConstString = 'a constant string';

  const validConstString = '$aConstNull $aConstNum $aConstNum1 $aConstBool $aConstString';

  print('validConstString:$validConstString');


  // These do NOT work in a const string.
  var aNull = null;
  var aNum = 0;
  var aNum1 = 0.1;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];

  //下面这行代码编译不通过
//   const invalidConstString = '$aNum $aBool $aString $aConstList';
}
