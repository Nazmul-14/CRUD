import 'package:flutter/material.dart';
class Urls{
  static String baseURL= 'http://35.73.30.144:2008/api/v1';
  static String Readproduct = '$baseURL/ReadProduct';
  static String creatproduct = '$baseURL/CreateProduct';
  static String deletproduct(String id) => '$baseURL/DeleteProduct/$id';


}