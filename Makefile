.PHONY: build
build:
	rm -rf dist && mkdir dist
	npm run build-tokens
	npm run build-scss
	# Tutor deployments load only the variant CSS via PARAGON_THEME_URLS (no core URL),
	# so the Roboto @import and font-family overrides must ship inside light.min.css.
	# @import rules must precede all other rules, hence the sandwich assembly.
	cat paragon/runtime/fonts-import.css dist/light.min.css paragon/runtime/font-overrides.css > dist/light.tmp \
		&& mv dist/light.tmp dist/light.min.css
