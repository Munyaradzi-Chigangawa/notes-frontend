var retrieveUrl = Uri.parse('https://notes-app-zw.herokuapp.com/notes/');

Uri deleteUrl(int i) {
  final String url =
      'https://notes-app-zw.herokuapp.com/notes/' + i.toString() + '/delete/';
  return Uri.parse(url);
}

var createURL = Uri.parse('https://notes-app-zw.herokuapp.com/notes/create/');

Uri updateUrl(int i) {
  final String url =
      'https://notes-app-zw.herokuapp.com/notes/' + i.toString() + '/update/';
  return Uri.parse(url);
}
