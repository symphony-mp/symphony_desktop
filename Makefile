.PHONY: icons upgrade

icons:
	@echo "Generating launcher icons..."
	@fvm dart run icons_launcher:create

upgrade:
	@echo "Upgrading dependencies..."
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter pub upgrade
	@fvm flutter pub upgrade --major-versions
