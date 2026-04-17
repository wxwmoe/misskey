#!/bin/sh
Misskey=2026.3.2
rm -rf ./temp && mkdir ./temp && cd ./temp
git clone https://github.com/misskey-dev/misskey.git misskey-${Misskey}
cd misskey-${Misskey} && git checkout ${Misskey} && git submodule update --init
sed -i "s/86b300/5db0da/g" ./packages/backend/src/server/web/manifest.json ./packages/backend/src/server/web/views/base.tsx ./packages/backend/src/core/EmailService.ts
sed -i "s|google\.com|bing.com|" ./packages/frontend/src/components/MkGoogle.vue
cp -f ../../icon/256.png ./packages/backend/assets/apple-touch-icon.png
cp -f ../../icon/192.png ./packages/backend/assets/icons/192.png
cp -f ../../icon/512.png ./packages/backend/assets/icons/512.png
cp -f ../../icon/512.png ./packages/frontend/assets/about-icon.png
cp -f ../../icon/favicon.ico ./packages/backend/assets/favicon.ico
cp -f ../../icon/favicon.png ./packages/backend/assets/favicon.png
docker buildx build -t wxwmoe/misskey .
