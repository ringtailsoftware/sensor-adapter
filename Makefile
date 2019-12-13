all:
	docker build -t xmaslights .
	docker run -it -v ${PWD}:/src xmaslights platformio run
	mkdir -p artefacts
	cp .pio/build/arduino/firmware.* artefacts

clean:
	docker run -it -v ${PWD}:/src xmaslights platformio run --target clean
	rm -rf artefacts
