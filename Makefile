server_run: 
    cd imovies_server && dart bin/main.dart
	
server_generate:
    cd imovies_server && serverpod generate --watch

flutter_gen:
    cd imovies_flutter && flutter packages pub run build_runner build --delete-conflicting-outputs


	 