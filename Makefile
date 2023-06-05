gen:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

check_update:
	fvm flutter pub upgrade --major-versions
	fvm flutter pub get
clean:
	fvm flutter clean
windows: clean
	act --container-architecture linux/amd64 --env-file .windows.env -P windows-latest=-self-hosted -j build_windows
macos: clean
	act --container-architecture linux/amd64 --env-file .macos.env -P macos-latest=-self-hosted -j build_macos
linux: clean
	act --container-architecture linux/amd64 --env-file .linux.env -P ubuntu-latest=-self-hosted -j build_linux
init:
	cargo install flutter_rust_bridge_codegen
	cargo install cargo-xcode
	cargo install cargo-make
act:
	act --container-architecture linux/amd64 --env-file .env
