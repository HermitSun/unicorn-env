# UNICORN Environment

A repo for reproduction of UNICORN.

## Main Environment Configurations

### OS
Ubuntu Server 16.04.1 LTS 64bits
- 4 cores, 16 GB RAM

### Dependencies
- g++ 4.9
- Python 2.7.12
- pip2 18.1
    - tqdm==4.51.0
    - numpy==1.16.1
    - scipy==0.18.1
    - scikit-learn==0.19.2
- git-lfs

You can use `. install.sh` (or other methods that can execute the shell script) to prepare these dependencies.

## Codes

- *core*, the `master`branch
    - *parsers*, the `master`branch
    - *analyzer*, the `incremental`branch
    - *modeler*, the `master`branch

Main **logical** steps after `git clone` and `cd core/`:

1. `make prepare_parsers`
2. `make prepare_graphchi_hotfix`
3. `make prepare_modeling`
4. `make prepare_output`
5. `make download_wget`
6. `make download_camflow_shellshock`
7. `make run_wget`, after changing `--train_dir` to `--train-dir` and `--test_dir` to `--test-dir`
8. `make run_camflow_shellshock`, after changing `--train_dir` to `--train-dir` and `--test_dir` to `--test-dir`
