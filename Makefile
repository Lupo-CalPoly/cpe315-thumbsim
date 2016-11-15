all:
	g++ -g main.cpp decode.cpp thumbsim_driver.cpp parse.cpp execute.cpp -o thumbsim

run:
	./thumbsim -i -d -f inputs/fib.sim

clean:
	rm -rf ./*.o ./thumbsim
