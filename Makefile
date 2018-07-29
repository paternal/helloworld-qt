.PHONY: all wheel deb

all: wheel deb

wheel: dist/helloworld_qt-1.0.0-py3-none-any.whl

dist/helloworld_qt-1.0.0-py3-none-any.whl: setup.py helloworldqt/*.py
	python3 setup.py bdist_wheel

deb:
	echo TODO
