# Fantasy Football Points Prediction Interface

This interface allows you to input player statistics for different positions (RB, FB, WR, TE, QB) and get predicted fantasy points based on trained linear regression models.

## Files

- `prediction_interface.html` - Main HTML interface
- `prediction_interface.css` - Styling for the interface
- `prediction_interface.js` - JavaScript for calculations
- `model_coefficients.json` - Model coefficients (generated from R models)
- `generate_model_coefficients.R` - R script to train models and export coefficients

## Setup

1. **Generate Model Coefficients** (if not already done):
   ```bash
   Rscript generate_model_coefficients.R
   ```
   This will create `model_coefficients.json` with all the trained model coefficients.

2. **Open the Interface**:
   - Simply open `prediction_interface.html` in a web browser
   - Or serve it through a local web server (recommended):
     ```bash
     # Using Python 3
     python3 -m http.server 8000
     
     # Using Python 2
     python -m SimpleHTTPServer 8000
     
     # Then navigate to: http://localhost:8000/prediction_interface.html
     ```

## Usage

1. **Select a Position**: Click on the tab for the position you want to predict (RB, FB, WR, TE, or QB)

2. **Enter Statistics**: Fill in the player statistics in the form fields. All fields default to 0, so you only need to enter non-zero values.

3. **Calculate Prediction**: Click the "Calculate Prediction" button to see the predicted fantasy points.

4. **View Results**: The predicted points will be displayed in a highlighted box below the form.

## Notes

- All input fields accept decimal numbers
- Leave fields as 0 if the statistic doesn't apply or is unknown
- The predictions are based on linear regression models trained on historical data
- Model performance metrics:
  - RB: R-squared = 0.967, RMSE = 1.493
  - FB: R-squared = 0.806, RMSE = 1.548
  - WR: R-squared = 0.967, RMSE = 1.484
  - TE: R-squared = 0.941, RMSE = 1.555
  - QB: R-squared = 0.982, RMSE = 1.504

## Updating Models

If you retrain your models, run `generate_model_coefficients.R` again to update the coefficients file. The interface will automatically use the new coefficients when you reload the page.

## Troubleshooting

- **Coefficients not loading**: Make sure `model_coefficients.json` is in the same directory as `prediction_interface.html`
- **CORS errors**: If opening the file directly, use a local web server instead of `file://` protocol
- **Predictions seem off**: Verify that all relevant statistics are entered correctly, especially key metrics like total yards and touchdowns

