import 'package:flutter/material.dart';
import 'package:khs_flutter_web_now_playing/services/auth_service.dart';
import 'package:provider/provider.dart';

class MovieListScreenHeader extends StatelessWidget {
  const MovieListScreenHeader({
    Key? key,
    required this.filterController,
  }) : super(key: key);

  final TextEditingController filterController;

  void handleLogout(BuildContext context) {
    context.read<AuthService>().logout();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: const Padding(
            child: Text(
              'Now Playing',
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
            ),
          ),
          margin: const EdgeInsets.only(bottom: 20),
        ),
        Container(
          child: Row(
            children: [
              Container(
                child: SizedBox(
                  child: TextField(
                    controller: filterController,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.redAccent, width: 1),
                      ),
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    cursorColor: Colors.white,
                  ),
                  width: 200,
                ),
                margin: const EdgeInsets.only(right: 10),
              ),
              OutlinedButton(
                onPressed: () => handleLogout(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          margin: const EdgeInsets.all(10),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
