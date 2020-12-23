INCFLAGS = -I/usr/local/include/ -I./src/

CPP = g++
CPPFLAGS = -std=c++11 -g -O3 $(INCFLAGS) -fopenmp -ffast-math -Wall -Wno-strict-aliasing -lpthread
CPPFLAGSPG = -std=c++11 -g -O3 $(INCFLAGS) -fopenmp -Wall -Wno-strict-aliasing -lpthread -pg
LINKERFLAGS = -lz
LINKERFLAGSPG = -lz -pg
DEBUGFLAGS = -g -ggdb $(INCFLAGS)
HEADERS=$(shell find . -name '*.hpp')

echo:
	echo $(HEADERS)

clean:
	@rm -rf bin/*
	@rm -rf *.log

unicorn/% : unicorn/%.cpp $(HEADERS)
	@mkdir -p bin/$(@D)
	$(CPP) $(CPPFLAGS) -Iunicorn/ $@.cpp -o bin/$@ $(LINKERFLAGS)

swdebug: CPPFLAGS += -DSKETCH_SIZE=2000 -DK_HOPS=3 -DMEMORY -DPREGEN=10000 -DUSEWINDOW -DBASESKETCH -DDEBUG -g
swdebug: unicorn/main

sw: CPPFLAGS += -DSKETCH_SIZE=2000 -DK_HOPS=3 -DMEMORY -DPREGEN=10000 -DUSEWINDOW -DBASESKETCH -g
sw: unicorn/main

sb: CPPFLAGS += -DSKETCH_SIZE=2000 -DK_HOPS=3 -DMEMORY -DPREGEN=10000 -g
sb: unicorn/main

wget_apt_benign:
	cd ../../data && mkdir -p train_wget_normal_batch
	number=0 ; while [ $$number -le 124 ] ; do \
		bin/unicorn/main filetype edgelist base ../../data/wget-apt/benign/base/base-wget-normal-$$number.txt stream ../../data/wget-apt/benign/stream/stream-wget-normal-$$number.txt decay 500 lambda 0.02 batch 3000 sketch ../../data/train_wget_normal_batch/sketch-wget-normal-$$number.txt chunkify 1 chunk_size 50 ; \
		rm -rf ../../data/wget-apt/benign/base/base-wget-normal-$$number.txt.* ; \
		rm -rf ../../data/wget-apt/benign/base/base-wget-normal-$$number.txt_* ; \
		number=`expr $$number + 1` ; \
	done
.PHONY: wget_apt_benign

wget_apt_attack:
	cd ../../data && mkdir -p test_wget_attack_batch
	number=0 ; while [ $$number -le 24 ] ; do \
		bin/unicorn/main filetype edgelist base ../../data/wget-apt/attack/base/base-wget-attack-$$number.txt stream ../../data/wget-apt/attack/stream/stream-wget-attack-$$number.txt decay 500 lambda 0.02 batch 3000 sketch ../../data/test_wget_attack_batch/sketch-wget-attack-$$number.txt chunkify 1 chunk_size 50 ; \
		rm -rf ../../data/wget-apt/attack/base/base-wget-attack-$$number.txt.* ; \
		rm -rf ../../data/wget-apt/attack/base/base-wget-attack-$$number.txt_* ; \
		number=`expr $$number + 1` ; \
	done
.PHONY: wget_apt_attack

shellshock_apt_benign:
	cd ../../data && mkdir -p train_shellshock_normal_batch
	number=0 ; while [ $$number -le 124 ] ; do \
		bin/unicorn/main filetype edgelist base ../../data/shellshock-apt/train/base/base-shellshock-benign-$$number.txt stream ../../data/shellshock-apt/train/stream/stream-shellshock-benign-$$number.txt decay 500 lambda 0.02 batch 4000 sketch ../../data/train_shellshock_normal_batch/sketch-shellshock-benign-$$number.txt chunkify 1 chunk_size 50 ; \
		rm -rf ../../data/shellshock-apt/train/base/base-shellshock-benign-$$number.txt.* ; \
		rm -rf ../../data/shellshock-apt/train/base/base-shellshock-benign-$$number.txt_* ; \
		number=`expr $$number + 1` ; \
	done
.PHONY: shellshock_apt_benign

shellshock_apt_attack:
	cd ../../data && mkdir -p test_shellshock_attack_batch
	number=0 ; while [ $$number -le 24 ] ; do \
		bin/unicorn/main filetype edgelist base ../../data/shellshock-apt/test/base/base-shellshock-attack-$$number.txt stream ../../data/shellshock-apt/test/stream/stream-shellshock-attack-$$number.txt decay 500 lambda 0.02 batch 4000 sketch ../../data/test_shellshock_attack_batch/sketch-shellshock-attack-$$number.txt chunkify 1 chunk_size 50 ; \
		rm -rf ../../data/shellshock-apt/test/base/base-shellshock-attack-$$number.txt.* ; \
		rm -rf ../../data/shellshock-apt/test/base/base-shellshock-attack-$$number.txt_* ; \
		number=`expr $$number + 1` ; \
	done
.PHONY: shellshock_apt_attack
