# Konfigurasi
VPS_IP="192.168.1.7"
VPS_USER="vboxuser"
APP_DIR="~/apps/my-cloud-app"
REPO_URL="https://github.com/username/my-cloud-app.git"

echo "🚀 Starting deployment to VPS..."

# 1. Push latest code ke GitHub
echo "📤 Pushing code to GitHub..."
git push origin master

# 2. SSH ke VPS dan pull latest code
echo "🖥️  Connecting to VPS and pulling updates..."
ssh $VPS_USER@$VPS_IP << 'REMOTE'
  cd ~/apps/my-cloud-app
  echo "⬇️  Pulling latest code..."
  git pull origin master

  echo "📦 Installing dependencies..."
  npm install --production

  echo "🔄 Restarting application with PM2..."
  pm2 reload my-cloud-app --update-env

  echo "✅ Deployment completed!"
REMOTE

echo "🎉 Deploy finished successfully!"
echo "🌐 Check: http://$VPS_IP"
