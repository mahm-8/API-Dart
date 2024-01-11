import 'package:dotenv/dotenv.dart';
import 'package:supabase/supabase.dart';

class SupabaseNet {
  static SupabaseClient? supabases;
  SupabaseClient get supa {
      var env = DotEnv(includePlatformEnvironment: true)..load();
    final supabase = SupabaseClient(env['url']!,
        env['key']!);
    supabases = supabase;
    return supabase;
  }
}
