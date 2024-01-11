import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../configs/supabase.dart';

product(Request request) async {
  try {
    final user = SupabaseNet.supabases;

    final getUser = await user?.from("pub").select();

    return Response.ok(jsonEncode(getUser),
        headers: {"Content-Type": "application/json"});
  } catch (e) {
    return Response.badRequest(
        body: jsonEncode({"meg": "token is invalid"}),
        headers: {"Content-Type": "application/json"});
  }
}
