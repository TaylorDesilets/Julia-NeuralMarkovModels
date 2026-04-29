using DataFrames, CSV
using Statistics
using StatsPlots

# Optional: nicer style
theme(:ggplot2)

# Load existing results (NO recomputation)
using CSV
CSV.write("performance_metrics.csv", df)


# MSE Comparison (main result)

boxplot(
    ["Const" "Linear" "NN"],
    [df.MSE12_const_val df.MSE12_lin_val df.MSE12_NN_val],
    ylabel = "MSE (λ12)",
    title = "MSE12 Comparison"
)

# Brier Score

boxplot(
    ["Const" "Linear" "NN"],
    [df.BS_const df.BS_lin df.BS_NN],
    ylabel="Brier Score",
    title="Brier Score Comparison"
)

# ----------------------------
# Mean ± Std (clean summary)
# ----------------------------
means = [
    mean(df.MSE12_const_val),
    mean(df.MSE12_lin_val),
    mean(df.MSE12_NN_val)
]

stds = [
    std(df.MSE12_const_val),
    std(df.MSE12_lin_val),
    std(df.MSE12_NN_val)
]

bar(
    ["Const","Linear","NN"],
    means,
    yerr=stds,
    ylabel="MSE12",
    title="Mean MSE12 ± Std",
    legend=false
)

println("Plots done")