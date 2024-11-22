#!/bin/sh
Misskey=2024.11.0
rm -rf ./temp && mkdir ./temp && cd ./temp
git clone https://github.com/misskey-dev/misskey.git misskey-${Misskey}
cd misskey-${Misskey} && git checkout ${Misskey} && git submodule update --init
sed -i "s|l-light|l-rainy|" ./packages/frontend/src/store.ts
sed -i "s|d-green-lime|d-future|" ./packages/frontend/src/store.ts
sed -i "s/86b300/5db0da/g" ./packages/backend/src/server/web/manifest.json ./packages/backend/src/server/web/views/base.pug ./packages/backend/src/core/EmailService.ts
sed -i "s|google\.com|bing.com|" ./packages/frontend/src/components/MkGoogle.vue
sed -i "s|成功しました。|清理完成，|" ./packages/backend/src/server/web/views/flush.pug
sed -i "s|Misskeyを開き直してください。|请重新加载 Misskey。|" ./packages/backend/src/server/web/views/flush.pug
sed -i "s|失敗しました。|清理失败，|" ./packages/backend/src/server/web/views/flush.pug
sed -i "s|もう一度試してみてください。|请再试一次。|" ./packages/backend/src/server/web/views/flush.pug
sed -i "s|3回以上試しても失敗する場合、ブラウザのキャッシュを消去し、それでもだめならインスタンス管理者に連絡してみてください。|如果您尝试了 3 次以上仍然失败，请尝试清除浏览器缓存，>如果这不起作用，您可以试着联系一下实例管理员。|" ./packages/backend/src/server/web/views/flush.pug
cp -f ../../icon/256.png ./packages/backend/assets/apple-touch-icon.png
cp -f ../../icon/192.png ./packages/backend/assets/icons/192.png
cp -f ../../icon/512.png ./packages/backend/assets/icons/512.png
cp -f ../../icon/512.png ./packages/frontend/assets/about-icon.png
cp -f ../../icon/favicon.ico ./packages/backend/assets/favicon.ico
cp -f ../../icon/favicon.png ./packages/backend/assets/favicon.png
docker buildx build -t wxwmoe/misskey .
