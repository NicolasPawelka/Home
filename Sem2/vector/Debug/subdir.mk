################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../IntVector.cpp \
../IntVector_main.cpp \
../ooptool.cpp 

CPP_DEPS += \
./IntVector.d \
./IntVector_main.d \
./ooptool.d 

OBJS += \
./IntVector.o \
./IntVector_main.o \
./ooptool.o 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.cpp subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean--2e-

clean--2e-:
	-$(RM) ./IntVector.d ./IntVector.o ./IntVector_main.d ./IntVector_main.o ./ooptool.d ./ooptool.o

.PHONY: clean--2e-

