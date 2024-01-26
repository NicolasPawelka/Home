################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Participant.cpp \
../ooptool.cpp \
../race_main.cpp \
../time.cpp \
../time_main.cpp 

CPP_DEPS += \
./Participant.d \
./ooptool.d \
./race_main.d \
./time.d \
./time_main.d 

OBJS += \
./Participant.o \
./ooptool.o \
./race_main.o \
./time.o \
./time_main.o 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.cpp subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean--2e-

clean--2e-:
	-$(RM) ./Participant.d ./Participant.o ./ooptool.d ./ooptool.o ./race_main.d ./race_main.o ./time.d ./time.o ./time_main.d ./time_main.o

.PHONY: clean--2e-

