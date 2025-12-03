# Fantasy Football Points Prediction Interface

A web-based interface for predicting fantasy football points using machine learning models trained on player statistics.

![Fantasy Football Predictor](https://img.shields.io/badge/Fantasy%20Football-Predictor-blue)
![Status](https://img.shields.io/badge/Status-Live-brightgreen)

## 🏈 Features

- **Multi-Position Support**: Predictions for Running Backs (RB), Fullbacks (FB), Wide Receivers (WR), Tight Ends (TE), and Quarterbacks (QB)
- **Interactive Interface**: Easy-to-use forms with tabbed navigation
- **Accurate Models**: Linear regression models with R² values ranging from 0.81 to 0.98
- **Real-time Predictions**: Instant calculation of predicted fantasy points

## 🚀 Live Demo

Visit the live site: [Your Vercel URL will appear here after deployment]

## 📊 Model Performance

| Position | R-squared | RMSE |
|----------|-----------|------|
| QB       | 0.982     | 1.504|
| WR       | 0.967     | 1.484|
| RB       | 0.967     | 1.493|
| TE       | 0.941     | 1.555|
| FB       | 0.806     | 1.548|

## 🛠️ Local Development

### Prerequisites

- Python 3 (for local server) OR
- Any static web server

### Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```

2. **Start a local server**

   Option 1: Using Python
   ```bash
   python3 -m http.server 8000
   ```

   Option 2: Using the provided script
   ```bash
   chmod +x start_server.sh
   ./start_server.sh
   ```

3. **Open in browser**
   ```
   http://localhost:8000/prediction_interface.html
   ```

## 📁 Project Structure

```
├── prediction_interface.html    # Main HTML interface
├── prediction_interface.css     # Styling
├── prediction_interface.js      # Prediction calculations
├── model_coefficients.json      # Trained model coefficients
├── generate_model_coefficients.R # R script to train models
├── README.md                    # This file
└── start_server.sh              # Local development server script
```

## 📝 Usage

1. Select a position tab (RB, FB, WR, TE, or QB)
2. Enter player statistics in the form fields
3. Click "Calculate Prediction" to see predicted fantasy points

**Note**: All fields default to 0. Only enter non-zero values for relevant statistics.

## 🔄 Updating Models

If you retrain your models:

1. Run the R script to generate new coefficients:
   ```bash
   Rscript generate_model_coefficients.R
   ```

2. Commit and push the updated `model_coefficients.json` file

## 🚀 Deployment

### Deploy to Vercel

1. Push your code to GitHub
2. Import your repository in [Vercel](https://vercel.com)
3. Vercel will automatically detect it as a static site
4. Your site will be live!

### Deploy to Other Platforms

This is a static website and can be deployed to:
- Netlify
- GitHub Pages
- AWS S3 + CloudFront
- Any static hosting service

## 🧪 Model Training

The models are trained using linear regression in R. To retrain:

1. Ensure you have the data files in `DATA/best model/`
2. Run `generate_model_coefficients.R`
3. The script will generate `model_coefficients.json`

## 📄 License

[Add your license here]

## 👤 Author

[Your Name]

## 🙏 Acknowledgments

- Data sources: [Mention your data sources]
- Models trained using R's `lm()` function

---

**Built with**: HTML, CSS, JavaScript, R

