# E-commerce Customer RFM Analytics

Interactive portfolio dashboard built from the uploaded Online Retail II transaction files.

## Files
- `index.html` — standalone dashboard (loads Chart.js from a CDN).

## Deploy on Vercel
1. Upload `index.html` to the root of a GitHub repository.
2. Import the repository into Vercel.
3. Keep Framework Preset as **Other** and Root Directory as `./`.
4. Deploy.

## Data preparation
- Combined both Online Retail II CSV files.
- Excluded rows with missing customer IDs, cancellation invoices, non-positive quantities/prices, or invalid dates.
- Calculated revenue as Quantity × Price.
- Calculated customer Recency, Frequency and Monetary value and assigned RFM segments.
- Dashboard filters operate on the processed transaction/customer-month records.

## Important
This is an Online Retail II dataset, not confirmed IKEA company data. Keep the project title generic and credit the dataset source/original project author in your repository README as appropriate. The dashboard is an analytical portfolio project, not an official IKEA report.
