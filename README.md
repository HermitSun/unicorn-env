# UNICORN Environment

A repo for reproduction of UNICORN.

## Main Environment Configurations

### OS
Ubuntu Server 16.04.1 LTS 64bits
- 8 cores, 32 GB RAM

### Dependencies

As the [wiki](https://github.com/crimson-unicorn/core/wiki/Preparation) says. 

## Codes(update)

- *parsers*, the `master`branch
- *analyzer*, the `master`branch
- *modeler*, the `master`branch

Main **logical** steps:

1. `git clone https://github.com/margoseltzer/wget-apt.git`, and uncompress
2. `git clone https://github.com/margoseltzer/shellshock-apt-new-label`, and uncompress
3. use [the camflow parser](https://github.com/crimson-unicorn/parsers/tree/master/camflow) to parse the data
4. `cd analyzer/`, after `make sb`:
    1. `make wget_apt_benign`
    2. `make wget_apt_attack`
    3. `make shellshock_apt_benign`
    4. `make shellshock_apt_attack`

    You can see the Makefile in this repo's [analyzer/Makefile](https://github.com/HermitSun/unicorn-env/blob/master/analyzer/Makefile).
5. `cd modeler/`, then:
    1. `python modeler.py -t ../../data/train_wget_normal_batch -u ../../data/test_wget_attack_batch -m max -n 1.3`
    2. `python modeler.py -t ../../data/train_shellshock_normal_batch -u ../../data/test_shellshock_attack_batch -m mean -n 3.9000000000000004`
    
    Because the float precision, I could only use this weird number 3.9000000000000004.
6. get the results.
