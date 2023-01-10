clean:
	rm -rf pysentio.egg-info dist build

lint:
	isort pysentio
	black pysentio
	flake8 pysentio

install_dev:
	pip install -r requirements-dev.txt

test:
	pytest -s -v

bump:
	bump2version --allow-dirty patch setup.cfg pysentio/const.py

bump_minor:
	bump2version --allow-dirty minor setup.cfg pysentio/const.py

bump_major:
	bump2version --allow-dirty major setup.cfg pysentio/const.py

build: clean
	python setup.py sdist bdist_wheel

publish_test:
	twine upload --repository testpypi dist/*

publish:
	twine upload dist/*

