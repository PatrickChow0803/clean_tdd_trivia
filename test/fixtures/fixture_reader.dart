import 'dart:io';

// Used to read the fixture files
String fixture(String fileName) =>
    File('test/fixtures/$fileName').readAsStringSync();
