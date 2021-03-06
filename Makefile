test:
	PYTHONPATH=. pytest --exitfirst --hypothesis-show-statistics src/ tests/ -vv

format:
	autoflake --remove-all-unused-imports -i **/*.py
	isort **/*.py
	black **/*.py

typecheck:
	mypy src/ pytorch-lightning/ tests/

build-docs:
	rm -rfv docs/sources/reference
	rm -rfv docs/sources/template
	python3 docs/gen_references.py
	mkdocs build --config-file docs/mkdocs.yml

clean:
	rm -rfv **/__pycache__ && echo
	rm -rfv **/.ipynb_checkpoints && echo
	rm -rfv **/.mypy_cache && echo
	rm -rfv **/.hypothesis && echo
