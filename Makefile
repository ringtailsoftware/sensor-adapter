all:
	docker run -it -v ${PWD}:/src sensor-adapter platformio run
	mkdir -p artefacts
	cp .pio/build/arduino/firmware.* artefacts

clean:
	docker run -it -v ${PWD}:/src sensor-adapter platformio run --target clean
	rm -rf artefacts
