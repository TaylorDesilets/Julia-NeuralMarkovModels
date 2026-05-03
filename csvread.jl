using CSV
using DataFrames
using Statistics

# Read directly from file (no reused df)
data = CSV.read("performance_metrics.csv", DataFrame)

# Compute means
summary = DataFrame(
    model = ["Constant", "Linear", "NN"],
    final_loss = [
        mean(data.loss_const_val),
        mean(data.loss_lin_val),
        mean(data.loss_NN_val)
    ],
    mse_12 = [
        mean(data.MSE12_const_val),
        mean(data.MSE12_lin_val),
        mean(data.MSE12_NN_val)
    ],
    mse_13 = [
        mean(data.MSE13_const_val),
        mean(data.MSE13_lin_val),
        mean(data.MSE13_NN_val)
    ]
)

# Write to new CSV
CSV.write("metrics_julia.csv", summary)

println(summary)