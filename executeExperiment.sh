#!/bin/bash

##### Helping program path #####
PLOTTING_SCRIPT_PATH='./python/plottingScript.py'

##### Define how many threads are going to be used from OPENMP #####
export OMP_NUM_THREADS=7

##### Simulation parameters #####
N='100'
R='33'
PHI='1.370796'
TOTAL_SIM_TIME_UNITS='2000'
SEED='15885'

##### Parse command line arguments #####
# The method that is going to be used
METHOD=${1}

SIM_NAME='SIMULATION_N_'${N}'_R_'${R}'_METHOD_'${METHOD}

if [ "${METHOD}" == "EULER" ];
then
	# echo "COMPILING SIMULATION FILE... "
	# make EULER

	EULER_SIMULATION_PATH='./bin/FHN_sim_EULER.exe'

	echo "EXECUTING SIMULATION..."

	${EULER_SIMULATION_PATH} ${SIM_NAME} ${N} ${R} ${PHI} ${TOTAL_SIM_TIME_UNITS} ${SEED}

	python ${PLOTTING_SCRIPT_PATH} resources ${SIM_NAME}
elif [ "${METHOD}" == "RK2" ];
then
	# echo "COMPILING SIMULATION FILE... "
	# make RK_TWO_STP

	RK2_SIMULATION_PATH='./bin/FHN_sim_RK2.exe'

	echo "EXECUTING SIMULATION..."

	${RK2_SIMULATION_PATH} ${SIM_NAME} ${N} ${R} ${PHI} ${TOTAL_SIM_TIME_UNITS} ${SEED}

	python ${PLOTTING_SCRIPT_PATH} resources ${SIM_NAME}
elif [ "${METHOD}" == "RK4" ];
then
	# echo "COMPILING SIMULATION FILE... "
	# make RK_FOUR_STP

	RK4_SIMULATION_PATH='./bin/FHN_sim_RK4.exe'

	echo "EXECUTING SIMULATION..."

	${RK4_SIMULATION_PATH} ${SIM_NAME} ${N} ${R} ${PHI} ${TOTAL_SIM_TIME_UNITS} ${SEED}

	python ${PLOTTING_SCRIPT_PATH} resources ${SIM_NAME}
else
	echo "Not supported. There are three possible methods:"
	echo "a) EULER"
	echo "b) RK2"
	echo "c) RK4"
fi
