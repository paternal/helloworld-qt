BUILD = $(PWD)/build
DEBDIR = $(BUILD)/deb
DIST = $(PWD)/dist
SRC = setup.py helloworldqt/*py

.PHONY: all clean wheel deb sdist

all: wheel deb sdist

# Clean
clean:
	rm -fr dist build

# Wheel

wheel: dist/helloworld_qt-1.0.0-py3-none-any.whl
dist/helloworld_qt-1.0.0-py3-none-any.whl: $(SRC)
	python3 setup.py bdist_wheel

# Dist

sdist: dist/helloworld-qt-1.0.0.tar.gz
dist/helloworld-qt-1.0.0.tar.gz: $(SRC)
	python3 setup.py sdist

# Deb

.ONESHELL:
deb: clean sdist
	mkdir -p $(DIST) $(BUILD)
	tar -xf dist/helloworld-qt-1.0.0.tar.gz -C $(BUILD)
	mv $(BUILD)/helloworld-qt-1.0.0 $(DEBDIR)
	cp dist/helloworld-qt-1.0.0.tar.gz $(BUILD)/helloworld-qt_1.0.0.orig.tar.gz
	cp -r debian $(DEBDIR)
	(
		cd $(DEBDIR)
		debuild -i -D -tc --no-sign
	)
	mkdir -p $(DIST)
	mv $(BUILD)/helloworld-qt_1.0.0-1.1_all.deb $(DIST)
