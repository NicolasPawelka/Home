################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Point.cpp \
../Point_main.cpp \
../ooptool.cpp \
../ooptoolg.cpp \
../zeichnepl.cpp 

CPP_DEPS += \
./Point.d \
./Point_main.d \
./ooptool.d \
./ooptoolg.d \
./zeichnepl.d 

OBJS += \
./Point.o \
./Point_main.o \
./ooptool.o \
./ooptoolg.o \
./zeichnepl.o 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.cpp subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean--2e-

clean--2e-:
	-$(RM) ./Point.d ./Point.o ./Point_main.d ./Point_main.o ./ooptool.d ./ooptool.o ./ooptoolg.d ./ooptoolg.o ./zeichnepl.d ./zeichnepl.o

.PHONY: clean--2e-

