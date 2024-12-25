/*
############################
!!!README!!!

This is a clock generator for a given duty cycle and clock speed. The Clock speed is in MHz and the Duty cycle is in percentile value rather then floating decimal and the time is in ns. e.g. if your system's clock speed is 200mhz and you want a duty cycle of 70% then change the parameter to CLOCK_SPEED=200 and DUTY_CYCLE=70

!!!Important!!!
You will have to do two things here apart from putting the clock_speed and duty_cycle. If you are using lower scaled time, change the timescale to the unit accordingly. For example, if your clock period needs to be measured in ps, then change the timescale to 1ps/1ps and so on.

Another thing is, change the TIME_UNIT to "ps" in the parameter of the module if your time unit is ps. Change it accordingly to match your time unit. To give you a perspective, if your clock speed is more than 200Mhz, its suggested to go for a time unit of "ps" rather than "ns". Why? Say you have a clock frequency of 500Mhz and duty cycle as 70%. Your period will be 2ns with 1.4ns high time and 0.6ns low time. As we are using "ns" as our time unit, both of these high and low time will be calculated as 1ns each, which will give us a wrong result. So you will have to put the time unit to "ps" to get the proper result. For any confusion, please communicate in erazahmed@outlook.com or reach me out in linkedin https://www.linkedin.com/in/erazahmed/

The simulation is run for 1ms(one millisecond). If you are going for a timescale of 1fs/1fs, it might take some time to simulate. Dont worry!

*/

`timescale 1ns/1ps


module clock_generator #(parameter int CLOCK_SPEED=500, parameter int DUTY_CYCLE = 80, parameter string TIME_UNIT = "ps") (clock_out);
  
  
  output clock_out;
  
  int numerator;
  
  real high_time ;
  
  real low_time  ;
  
  logic clock = 0;
  
  
  initial begin
    
    case(TIME_UNIT)
      "us": numerator = 1;
      "ns": numerator = 1E3;
      "ps": numerator = 1E6;
      "fs": numerator = 1E9;
      
    endcase
    
    high_time =  (DUTY_CYCLE * (numerator/ CLOCK_SPEED))/100;
    low_time =  numerator/(CLOCK_SPEED) - high_time;
  end
  

  
  
  initial begin
    clock = 0;
    forever begin
      #low_time clock = ~clock;
      #high_time clock = ~clock;
    end
    
  end
  
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    
    #1ms;
    $finish;
  end
  
  assign clock_out = clock;
  
  
endmodule