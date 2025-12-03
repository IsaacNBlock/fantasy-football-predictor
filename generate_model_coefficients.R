# Script to train models and export coefficients to JSON for web interface
# This script trains all position models and exports coefficients

library(jsonlite)

# Set working directory to the data folder
setwd("/Users/isaacblock/Desktop/YU/Fall 2025/Capstone/DATA/best model")

# Read the data files
RB_data <- read.csv("RB_bestModel.csv")
FB_data <- read.csv("FB_bestModel.csv")
WR_data <- read.csv("WR_bestModel.csv")
TE_data <- read.csv("TE_bestModel.csv")
QB_data <- read.csv("QB_bestModel.csv")

# Set seed for reproducibility
set.seed(123)

# ===== TRAIN RB MODEL =====
rbsamp1 <- sample(1:nrow(RB_data), floor(nrow(RB_data)/2))
train_model_rb <- lm(formula = pointsuse ~ total_yards + total_tds + receptions + 
                    receiving_touchdown + fumble_lost + interception + passing_yards + 
                    season_average_fumble_lost + season_average_third_down_failed + 
                    season_ypr + draft_pick + delta_team_offense_snaps + 
                    season_average_interception + qb_scramble + 
                    season_average_receptions_redzone + career_rec_td_pct + 
                    fumble_forced + delta_ypc + season_pass_touchdown_pct + 
                    career_average_complete_pass_redzone + delta_pass_td_pct + 
                    pass_td_pct + pass_attempts_gtg + career_total_tds + 
                    depth_team + season_average_rush_attempts + 
                    season_average_yards_after_catch + rush_touchdown + 
                    rush_touchdown_gtg + season_targets_redzone + 
                    season_yards_after_catch + team_targets_share + season_targets, 
                  data = RB_data[rbsamp1,])

# ===== TRAIN FB MODEL =====
fbsamp1 <- sample(1:nrow(FB_data), floor(nrow(FB_data)/2))
train_model_fb <- lm(pointsuse ~ total_yards + total_tds + receptions + 
                       pass_touchdown + fumble_lost + interception + 
                       season_average_offense_snaps + receptions_gtg + 
                       season_rush_touchdown_gtg + season_rush_td_pct + 
                       delta_rush_attempts_gtg + career_fourth_down_converted + 
                       career_ypg + offense_snaps + team_rush_touchdown_share + 
                       shotgun + season_average_third_down_failed + 
                       receiving_touchdown_redzone + 
                       season_average_receiving_touchdown_redzone + career_ypr + 
                       season_average_no_huddle + season_td_pct + 
                       season_rush_touchdown + season_rush_attempts_gtg + 
                       season_receiving_touchdown_gtg + 
                       career_average_receiving_touchdown_gtg + first_down_pass + 
                       season_average_fumble_out_of_bounds + delta_rush_td_pct + 
                       receptions_redzone + ayptarget + rush_td_pct, 
                     data = FB_data[fbsamp1,])

# ===== TRAIN WR MODEL =====
wrsamp1 <- sample(1:nrow(WR_data), floor(nrow(WR_data)/2))
train_model_wr <- lm(formula = pointsuse ~ total_yards + total_tds + receptions + 
                       interception + fumble_lost + receiving_touchdown + ypa + 
                       career_average_rush_touchdown_redzone + 
                       career_average_incomplete_pass + team_receiving_yards_share + 
                       team_targets_share + delta_pass_attempts + 
                       season_average_fumble_not_forced + career_rec_ypg + age + 
                       delta_total_tds + season_average_pass_touchdown_gtg + 
                       career_average_rush_touchdown + delta_rush_attempts_gtg + 
                       season_average_rush_attempts_redzone + years_exp + 
                       season_rush_touchdown_redzone + season_rush_td_pct + 
                       season_targets + season_targets_redzone + delta_passing_yards + 
                       team_receptions_share + season_average_safety + 
                       career_rec_td_pct + season_receiving_touchdown, 
                     data = WR_data[wrsamp1,])

# ===== TRAIN TE MODEL =====
tesamp1 <- sample(1:nrow(TE_data), floor(nrow(TE_data)/2))
train_model_te <- lm(formula = pointsuse ~ total_yards + total_tds + receptions + 
                       interception + fumble_lost + rush_touchdown + 
                       season_average_first_down_pass + int_pct + career_td_pct + 
                       pass_touchdown_redzone + receptions_redzone + 
                       delta_rush_touchdown_gtg + season_average_rush_touchdown_gtg + 
                       delta_passer_rating + team_receptions_share + 
                       season_average_receptions_redzone + yptouch + season_yptarget + 
                       team_receiving_yards_share + season_rush_attempts_redzone + 
                       career_comp_pct + career_receiving_touchdown_gtg + 
                       career_average_fumble_out_of_bounds + 
                       career_average_fumble_lost + career_yards_after_catch + 
                       team_rush_attempts_share + season_rushing_yards + 
                       season_first_down_rush + passing_air_yards + 
                       season_pass_attempts + season_average_pass_attempts_gtg + 
                       career_average_rush_attempts_redzone + 
                       season_average_interception + pass_attempts_gtg + 
                       pass_attempts_redzone + season_pass_attempts_gtg + 
                       delta_pass_attempts + targets_gtg + 
                       receiving_touchdown_redzone + targets, 
                     data = TE_data[tesamp1,])

# ===== TRAIN QB MODEL =====
qbsamp1 <- sample(1:nrow(QB_data), floor(nrow(QB_data)/2))
train_model_qb <- lm(formula = pointsuse ~ total_tds + total_yards + 
                       interception + fumble_lost + passing_yards + 
                       rec_td_pct + receptions + receiving_touchdown + 
                       season_fumble_out_of_bounds + season_comp_pct + 
                       rush_attempts_gtg + rush_attempts + career_qb_scramble + 
                       draft_ovr + delta_complete_pass + fumble_not_forced + 
                       season_average_rush_touchdown_redzone + 
                       season_tackled_for_loss + career_rushing_yards + 
                       int_pct + career_average_rush_attempts_gtg + 
                       career_average_third_down_converted + 
                       career_average_fourth_down_converted + 
                       third_down_failed + ayptarget + 
                       team_receiving_yards_share + adot + 
                       career_average_receiving_touchdown_gtg + 
                       season_receiving_touchdown_gtg + season_targets_gtg + 
                       career_average_receptions_redzone + 
                       career_fumble_not_forced + career_rush_touchdown + 
                       season_receptions_redzone + season_rec_td_pct + 
                       career_rush_ypg + yptarget, 
                     data = QB_data[qbsamp1,])

# Extract coefficients for each model
extract_coefficients <- function(model) {
  coefs <- coef(model)
  # Convert to named list, handling NA values
  coef_list <- as.list(coefs)
  # Replace NA with 0
  coef_list[is.na(coef_list)] <- 0
  return(coef_list)
}

# Create coefficients object
coefficients <- list(
  RB = extract_coefficients(train_model_rb),
  FB = extract_coefficients(train_model_fb),
  WR = extract_coefficients(train_model_wr),
  TE = extract_coefficients(train_model_te),
  QB = extract_coefficients(train_model_qb)
)

# Export to JSON
setwd("/Users/isaacblock/Desktop/YU/Fall 2025/Capstone")
write_json(coefficients, "model_coefficients.json", pretty = TRUE, auto_unbox = TRUE)

cat("Model coefficients exported to model_coefficients.json\n")
cat("Models trained and ready for predictions!\n")

