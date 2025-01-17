# Food Delivery App
Sebuah aplikasi mobile yang dibuat dengan Dart, Flutter, PHP, Laravel, Postgree SQL pada database untuk penilaian UTS mobile programming.

## Cara Menjalankan Aplikasi
1. Lakukan setup pada bagian backend
2. Buka terminal lalu ke directory backend-mobile dan ke directory example-app
3. Installasi Laravel Sanctum bisa melalui composer maupun melalui install:api
4. Setup database pada env
5. Run "php artisan migrate"
6. Buka file constant.dart (uts_mobile_programming < lib < services)
7. Ganti baseURL dengan IP sesuai dengan network masing-masing
8. Run "php artisan serv --host {ip di baseURL} --port 8000"
9. Installasi APK ke smartphone atau melalui emulator seperti android studio
10. Buka file APK yang telah diinstallasi
