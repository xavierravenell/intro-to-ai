
R version 4.4.2 (2024-10-31) -- "Pile of Leaves"
Copyright (C) 2024 The R Foundation for Statistical Computing
Platform: aarch64-apple-darwin20

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.81 (8462) aarch64-apple-darwin20]

[Workspace restored from /Users/xavierravenell/.RData]
[History restored from /Users/xavierravenell/.Rapp.history]

> ############################################################
> # Assignment2.R
> # Linear regression model: mpg ~ gear using mtcars dataset
> ############################################################
> 
> # 1. Load the built-in mtcars dataset
> data("mtcars")
> 
> # Look at the first few rows (optional)
> # head(mtcars)
> 
> # 2. Train/Test Split --------------------------------------
> 
> set.seed(123)  # for reproducible results
> 
> n <- nrow(mtcars)
> train_size <- floor(0.7 * n)  # 70% for training
> 
> train_index <- sample(seq_len(n), size = train_size)
> 
> train_data <- mtcars[train_index, ]
> test_data  <- mtcars[-train_index, ]
> 
> # 3. Fit Linear Regression Model ---------------------------
> 
> # NOTE: In mtcars the column is 'gear' (not 'gears')
> reg_model <- lm(mpg ~ gear, data = train_data)
> 
> # 4. Print Model Summary -----------------------------------
> 
> cat("========== Regression Model Summary (mpg ~ gear) ==========\n")
========== Regression Model Summary (mpg ~ gear) ==========
> summary(reg_model)

Call:
lm(formula = mpg ~ gear, data = train_data)

Residuals:
    Min      1Q  Median      3Q     Max 
-10.215  -3.196  -1.051   2.595  12.495 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)  
(Intercept)    6.168      7.143   0.864   0.3981  
gear           3.809      1.796   2.121   0.0466 *
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 6.174 on 20 degrees of freedom
Multiple R-squared:  0.1836,	Adjusted R-squared:  0.1428 
F-statistic: 4.499 on 1 and 20 DF,  p-value: 0.04661

> 
> # 5. Predict on Test Data ----------------------------------
> 
> test_data$predicted_mpg <- predict(reg_model, newdata = test_data)
> 
> # 6. Print Predictions -------------------------------------
> 
> cat("\n========== Test Data: Actual vs Predicted MPG ==========\n")

========== Test Data: Actual vs Predicted MPG ==========
> output_table <- test_data[, c("mpg", "gear", "predicted_mpg")]
> print(output_table)
                     mpg gear predicted_mpg
Mazda RX4           21.0    4      21.40538
Mazda RX4 Wag       21.0    4      21.40538
Hornet 4 Drive      21.4    3      17.59615
Valiant             18.1    3      17.59615
Merc 450SE          16.4    3      17.59615
Merc 450SL          17.3    3      17.59615
Lincoln Continental 10.4    3      17.59615
Toyota Corona       21.5    3      17.59615
Camaro Z28          13.3    3      17.59615
Pontiac Firebird    19.2    3      17.59615
> 
> # 7. (Optional) Save Output to a File ----------------------
> # If your instructor wants saved output as a file, you can
> # uncomment this block and run it once.
> 
> # sink("Assignment2_output.txt")
> # cat("========== Regression Model Summary (mpg ~ gear) ==========\n")
> # print(summary(reg_model))
> # cat("\n========== Test Data: Actual vs Predicted MPG ==========\n")
> # print(output_table)
> # sink()
> 
> ############################################################
> # End of Assignment2.R
> ############################################################
> 
> 