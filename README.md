# TfL API Surveillance

FYP-Amey, LU, API monitoring

Created by Fu Gui 2016-03-31. For the purpose of Final Year Project

## What this script does:

- This script is written in R.
- This script records the train arrival prediction API of TfL.
- The data is recorded for all London Underground lines (This does not include DLR).
- The script runs for a specified amount of time.
- The script records the API at a specified interval.
- The script saves the recording in 2 formats: R image and a JSON file.

## What you need to do:

- Set the directory where you want to save the recordings to by entering the path to setwd().
- Set the duration you want to run the script for by entering the duration in minute to durationinmin <- input.
- The duration should not be too long. Since the recorded data needs to fit into the RAM of the machine, the duration should be set 
depending on the RAM available (60 records ~ 150MB).
- Set the interval between reading the API in second by entering the interval to cycle.interval <- input.
- The interval should not be less than 30s, as the API is only updated every 30s.
- The script can be run from R console or from the command line:
```sh
$ Rscript ~/path/surveillance.R
```

#End
