all:
	docker build -t xmaslights .
	docker run -it -v ${PWD}:/src xmaslights ./build.sh
	mkdir -p artefacts
	cp .pio/build/arduino/firmware.* artefacts

flash:
	vagrant ssh -c "cd /vagrant && stty -F /dev/ttyACM0 ospeed 1200 && sleep 3 && ./bossac -i -d --port=/dev/ttyACM0 -e -w -v artefacts/*.bin -R"

clean:
	docker run -it -v ${PWD}:/src xmaslights platformio run --target clean
	rm -rf artefacts
