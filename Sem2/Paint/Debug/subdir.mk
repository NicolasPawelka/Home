################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../ooptool.cpp \
../ooptoolg.cpp \
../paint.cpp 

CPP_DEPS += \
./ooptool.d \
./ooptoolg.d \
./paint.d 

OBJS += \
./ooptool.o \
./ooptoolg.o \
./paint.o 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.cpp subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean--2e-

clean--2e-:
	-$(RM) ./ooptool.d ./ooptool.o ./ooptoolg.d ./ooptoolg.o ./paint.d ./paint.o

.PHONY: clean--2e-

