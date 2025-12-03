# Deployment Guide - GitHub & Vercel

## Step 1: Push to GitHub

### Option A: Using Command Line (Recommended)

1. **Initialize Git Repository**
   ```bash
   git init
   ```

2. **Add all files**
   ```bash
   git add prediction_interface.html prediction_interface.css prediction_interface.js model_coefficients.json README.md vercel.json .gitignore
   ```

3. **Make your first commit**
   ```bash
   git commit -m "Initial commit: Fantasy Football Prediction Interface"
   ```

4. **Create a new repository on GitHub**
   - Go to https://github.com/new
   - Name your repository (e.g., "fantasy-football-predictor")
   - **Don't** initialize with README, .gitignore, or license
   - Click "Create repository"

5. **Connect and push to GitHub**
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
   git branch -M main
   git push -u origin main
   ```

### Option B: Using GitHub Desktop

1. Download GitHub Desktop: https://desktop.github.com/
2. File → Add Local Repository → Select your Capstone folder
3. Commit your changes
4. Publish repository to GitHub

## Step 2: Deploy to Vercel

### Option A: Import from GitHub (Recommended)

1. **Go to Vercel**
   - Visit https://vercel.com
   - Sign up/Login with your GitHub account

2. **Import Project**
   - Click "Add New..." → "Project"
   - Select your GitHub repository
   - Vercel will auto-detect settings

3. **Configure Project**
   - **Framework Preset**: Other
   - **Root Directory**: `./` (leave as is)
   - **Build Command**: Leave empty (static site)
   - **Output Directory**: Leave empty

4. **Deploy**
   - Click "Deploy"
   - Wait for deployment (usually 1-2 minutes)
   - Your site will be live!

5. **Access Your Site**
   - Vercel will provide a URL like: `https://your-project.vercel.app`
   - Your interface will be at: `https://your-project.vercel.app/prediction_interface.html`

### Option B: Using Vercel CLI

1. **Install Vercel CLI**
   ```bash
   npm install -g vercel
   ```

2. **Login to Vercel**
   ```bash
   vercel login
   ```

3. **Deploy**
   ```bash
   vercel
   ```

4. **Follow the prompts**
   - Link to existing project or create new
   - Deploy to production

## Step 3: Set Up Custom Domain (Optional)

1. Go to your project settings in Vercel
2. Click "Domains"
3. Add your custom domain
4. Follow DNS configuration instructions

## Step 4: Update README

After deployment, update the README.md with your actual Vercel URL:

```markdown
## 🚀 Live Demo

Visit the live site: https://your-project.vercel.app/prediction_interface.html
```

## Troubleshooting

### JSON file not loading
- Make sure `model_coefficients.json` is committed to GitHub
- Check browser console for CORS errors
- Verify the JSON file path in the code

### Styles/CSS not loading
- Check that all CSS files are committed
- Verify file paths in HTML are correct

### Vercel deployment fails
- Make sure all necessary files are in the repository
- Check Vercel build logs for errors
- Ensure `vercel.json` is properly configured

## Next Steps

- Set up automatic deployments (Vercel does this automatically)
- Add analytics (Vercel Analytics or Google Analytics)
- Customize the domain
- Add more features!

