# Clock Generator with Duty Cycle

This repository contains a clock generator module designed to produce a clock signal with a given duty cycle and clock speed. 

- **Clock Speed:** Measured in MHz.
- **Duty Cycle:** Specified as a percentage (e.g., 70% instead of 0.7).
- **Time Unit:** Measured in nanoseconds (ns) by default.

For example, if your system's clock speed is 200 MHz and you want a duty cycle of 70% and your desired time unit is picosecond, you would set the parameters as follows:
```sv
CLOCK_SPEED = 200
DUTY_CYCLE = 70
TIME_UNIT  = "ns"
```
## Important Notes

### 1. Adjusting the Timescale
If you're using a time unit smaller than nanoseconds (e.g., picoseconds or femtoseconds), update the timescale in your module accordingly. For example:

- For picoseconds:
  ```sv
  `timescale 1ps/1ps
  ```
  or
  ```sv
  `timescale 1ns/1ps
  ```
- For femtoseconds:
  ```sv
  `timescale 1fs/1fs
  ```
  or
   ```sv
  `timescale 1ps/1fs
  ```
## Updating the Time Unit Parameter
Ensure the ``TIME_UNIT`` parameter in your module matches the desired time unit:
- For picoseconds:
  ```sv
  parameter string TIME_UNIT = "ps";
  ```
- For femtoseconds:
  ```sv
  parameter string TIME_UNIT = "fs";
  ```
## Why is this necessary?
If your clock frequency is high (e.g., >200 MHz), using nanoseconds as the time unit may result in inaccurate calculations. Consider the following example:
- **Clock Frequency:** 500 MHz
- **Duty Cycle:** 70%
  - **Period:** 2 ns
  - **High Time:** 1.4 ns
  - **Low Time:** 0.6 ns

Using "ns" as the time unit will round the high and low times to 1 ns each, leading to incorrect results. Instead, use "ps" to achieve precise calculations.

## Simulation Details
The simulation runs for **1 millisecond (1ms)**. If using a timescale of ``1fs/1fs``, the simulation may take longer to complete.

## Contact
For any questions or clarifications, feel free to reach out:
- **Email**: <a href="erazahmed@outlook.com" target="_blank" rel="noreferrer"> my email </a>
- **LinkedIn**: <a href="https://www.linkedin.com/in/erazahmed/" target="_blank" rel="noreferrer">linkedin</a>

or you can create an issue by clicking the button below:

[![](https://img.shields.io/badge/Create-Issue-red)](https://github.com/Eragbiscool/clock_generator_with_duty_cycle/issues/new)