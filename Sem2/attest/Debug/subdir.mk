################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../at_main.cpp \
../gtest_main.cpp \
../test_at.cpp 

CPP_DEPS += \
./at_main.d \
./gtest_main.d \
./test_at.d 

OBJS += \
./at_main.o \
./gtest_main.o \
./test_at.o 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.cpp subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean--2e-

clean--2e-:
	-$(RM) ./at_main.d ./at_main.o ./gtest_main.d ./gtest_main.o ./test_at.d ./test_at.o

.PHONY: clean--2e-

