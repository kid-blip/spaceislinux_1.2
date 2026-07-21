# 1. Удаляем всё лишнее (Bloatware)
apt purge --autoremove xfce4-session xfwm4 xfce4-panel mintupdate mintreport mintwelcome thunderbird libreoffice-* transmission-* celluloid drawing sticky notes pix hypnotix -y
# 2. Обновляемся и ставим наш сверхлегкий стек
apt update
apt install openbox tint2 jgmenu picom zram-tools micro -y
# 3. Настраиваем автозапуск для Openbox (через системный шаблон)
mkdir -p /etc/skel/.config/openbox
echo -e "picom --backend xrender &\nxsetroot -cursor_name left_ptr &\ntint2 &\njgmenu_run init &" > /etc/skel/.config/openbox/autostart
# 4. Настраиваем меню
mkdir -p /etc/skel/.config/jgmenu
jgmenu_run init --prefix=/etc/skel/.config/jgmenu
# 5. Оптимизация ядра под слабый AMD C-70
echo "vm.swappiness=10" >> /etc/sysctl.conf
echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf
# 6. Настройка ZRAM (спасение для старого железа)
echo -e "ALGO=lzo-rle\nSIZE=1000\nPRIORITY=100" > /etc/default/zramswap
systemctl enable zramswap
mkdir -p /etc/skel/.config/tint2
micro /etc/skel/.config/tint2/tint2rc
echo "export EDITOR=micro" >> /etc/skel/.bashrc
apt install feh -y
mkdir -p /usr/share/backgrounds/spaceislinux
# Скачиваем атмосферный арт (космос + эстетика OneShot)
wget -O /usr/share/backgrounds/spaceislinux/wallpaper.jpg https://images.wallpapersden.com/image/download/oneshot-video-game-minimalist_bGZtZWyUmZqaraWkpJRmbmdlrWZlbWU.jpg
# Пробуем другое зеркало с артом Niko
wget -O /usr/share/backgrounds/spaceislinux/wallpaper.jpg https://raw.githubusercontent.com/Niko-The-Cat/OneShot-Wallpapers/master/Wallpaper_Lamps.png
mkdir -p /etc/skel/.config/picom
micro /etc/skel/.config/picom/picom.conf
micro /usr/bin/boost
chmod +x /usr/bin/boost
# В терминале Cubic (chroot)
mkdir -p /usr/share/backgrounds/spaceislinux
# Качаем другой качественный арт (Space/Niko Style)
wget -O /usr/share/backgrounds/spaceislinux/wallpaper.jpg https://raw.githubusercontent.com/catppuccin/wallpapers/main/misc/spaceman.png
# В терминале Cubic
mkdir -p /usr/share/backgrounds/spaceislinux
# Качаем темный космический фон
wget -O /usr/share/backgrounds/spaceislinux/wallpaper.jpg https://raw.githubusercontent.com/catppuccin/wallpapers/main/landscapes/space.png
clean
ls -l /usr/share/backgrounds/spaceislinux/wallpaper.jpg
chmod 644 /usr/share/backgrounds/spaceislinux/wallpaper.jpg
micro /etc/skel/.bashrc
# В терминале Cubic
sudo micro /etc/default/grub
update-grub
sudo micro /etc/os-release
apt install fastfetch -y
sudo apt install fastfetch -y
apt install openbox xinit lightdm-gtk-greeter -y
mkdir -p /usr/share/xsessions
micro /usr/share/xsessions/openbox.desktop
micro /etc/default/grub
rm /etc/lightdm/lightdm.conf
micro /etc/lightdm/lightdm.conf
# Проверим, где лежат картинки загрузчика
find /boot -name "*.png"
find /boot -name "*.jpg"
apt install plymouth-theme-text -y
update-alternatives --set default.plymouth /usr/share/plymouth/themes/text/text.plymouth
update-initramfs -u
# Удаляем пакеты заставки (если что-то осталось)
apt purge plymouth -y
micro /etc/default/grub
update-grub
apt install xinit xserver-xorg -y
# 1. Возвращаем сам менеджер входа (но без минтовских тем)
apt install lightdm lightdm-gtk-greeter -y
# 2. Убеждаемся, что Openbox на месте
apt install openbox -y
# 3. Перенастраиваем систему, чтобы она не искала удаленный Plymouth
update-initramfs -u
# Устанавливаем Openbox сессией по умолчанию для всех пользователей
echo "[Seat:*]
user-session=openbox" > /etc/lightdm/lightdm.conf.d/99-spaceislinux.conf
# Меняем название диска (LABEL)
micro /etc/linuxmint/info
micro /etc/default/grub
grep -r "linuxmint" /etc/ 2>/dev/null
# В терминале Cubic
micro /etc/lightdm/lightdm-gtk-greeter.conf.d/99_linuxmint.conf
# Создаем папку для нашего бренда
mkdir -p /usr/share/backgrounds/spaceislinux/
# Если ты загружал файл через интерфейс Cubic, он может лежать в /root/
# Давай переименуем его в wallpaper.jpg для удобства
mv /root/название_твоего_файла.jpg /usr/share/backgrounds/spaceislinux/wallpaper.jpg
# Создаем папку для нашего бренда
mkdir -p /usr/share/backgrounds/spaceislinux/
# Если ты загружал файл через интерфейс Cubic, он может лежать в /root/
# Давай переименуем его в wallpaper.jpg для удобства
mv /root/planety_galaktika_zvezdy_146448_3840x2400.jpg /usr/share/backgrounds/spaceislinux/wallpaper.jpg
micro /etc/lightdm/lightdm-gtk-greeter.conf.d/99_linuxmint.conf
mv /etc/lightdm/lightdm-gtk-greeter.conf.d/99_linuxmint.conf /etc/lightdm/lightdm-gtk-greeter.conf.d/99_spaceislinux.conf
mkdir -p /etc/skel/.config/openbox
micro /etc/skel/.config/openbox/autostart
apt install feh tint2 xfce4-terminal -y
mkdir -p /etc/skel/.config/openbox
micro /etc/skel/.config/openbox/autostart
micro /etc/hosts
cat /etc/hostname
echo "SpaceIsLinux" > /etc/hostname
micro /etc/os-release
hosts
micro /etc/hosts
micro /etc/default/grub
rm -rf /boot/grub/themes/linuxmint
rm -rf /usr/share/plymouth/themes/mint-*
# Обновляем конфиг GRUB
update-grub
# Обновляем образ ядра (именно тут часто прячется старое лого)
update-initramfs -u
# Удаляем Snap (это самый тяжелый балласт)
apt purge -y snapd
rm -rf /var/cache/snapd/
# Удаляем службы печати и Bluetooth (если они тебе не нужны на C-70)
apt purge -y cups cups-browsed bluez bluetooth modemmanager
# Удаляем отчеты об ошибках, которые вечно висят в памяти
apt purge -y apport apport-gtk
# Устанавливаем конфиг для zram
apt install -y zram-config
cd /etc/xdg/autostart
# Посмотри список файлов
ls
# Можешь смело удалять всё, что связано с "update-notifier", "print-applet", "nm-applet" (если не нужен Wi-Fi в трее)
rm mintupdate.desktop mintreport.desktop warpinator-autostart.desktop print-applet.desktop mintwelcome.desktop org.gnome.Evolution-alarm-notify.desktop onboard-autostart.desktop orca-autostart.desktop caribou-autostart.desktop geoclue-demo-agent.desktop
учше
cd ..
cd ...
cd ..
dpkg --list | grep linux-image
# Удаляем чисто визуальные и сервисные утилиты Mint
apt purge -y mintreport mintwelcome warpinator sticky celluloid drawing hypnotix
# Удаляем тяжелый софт, если он не критичен для первой версии
apt purge -y thunderbird libreoffice-common
# Очистка системы от осиротевших зависимостей
apt autoremove -y
# Устанавливаем zram, если еще не сделали
apt install -y zram-config
# Настраиваем агрессивность использования памяти (swappiness)
# Для слабых ПК лучше ставить значение поменьше, чтобы не лезть на диск раньше времени
echo "vm.swappiness=10" >> /etc/sysctl.conf
echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf
# Создаем правило для автоматического выбора планировщика
echo 'ACTION=="add|change", KERNEL=="sd[a-z]|mmcblk[0-9]*", ATTR{queue/scheduler}="mq-deadline"' > /etc/udev/rules.d/60-scheduler.rules
# Маскируем сервисы, чтобы systemd их игнорировал
systemctl mask plymouth-start.service
systemctl mask plymouth-read-write.service
systemctl mask plymouth-quit.service
systemctl mask plymouth-quit-wait.service
micro /etc/default/grub
update-initramfs -u
nano /usr/local/bin/space-gpu-check.sh
chmod +x /usr/local/bin/space-gpu-check.sh
nano /etc/xdg/autostart/space-gpu-check.desktop
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/*
update-initramfs -u
update-grub
rm -rf /tmp/*
rm -rf /var/tmp/*
chmod +x /usr/local/bin/space-gpu-check.sh
# Убедись, что ядро вообще на месте
ls -l /boot
# Пересборка initramfs для ВСЕХ установленных ядер
update-initramfs -u -k all
# Установим текстовую тему по умолчанию, чтобы скрипты не ругались
update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/details/details.plymouth 100
# Если папки вообще нет, создадим её и переключимся на текстовый режим
apt install --reinstall plymouth
plymouth-set-default-theme details
# Проверь этот файл:
nano /etc/initramfs-tools/conf.d/resume
# Создаем директорию, если её нет
mkdir -p /usr/share/plymouth/themes/mint-logo
# Делаем символическую ссылку: пусть система думает, что текстовая тема 'details' — это и есть логотип минта
ln -sf /usr/share/plymouth/themes/details/details.plymouth /usr/share/plymouth/themes/mint-logo/mint-logo.plymouth
# Устанавливаем 'details' как тему по умолчанию
plymouth-set-default-theme details
# На всякий случай переустановим скрипты инициализации
apt-get install --reinstall plymouth-label
update-initramfs -u -k all
# Редактируем конфиг
nano /etc/default/grub
# Обновляем конфиг GRUB внутри системы
update-grub
# Снова пересобираем initramfs (убедись, что после нашего 'ln' ошибок про plymouth нет!)
update-initramfs -u -k all
chmod 644 /boot/vmlinuz-6.8.0-38-generic
chmod 644 /boot/initrd.img-6.8.0-38-generic
cd /boot
# Посмотри точное имя твоего initrd через ls
# И создай ссылку (замени версию на свою, если она отличается)
ln -s initrd.img-6.8.0-38-generic initrd.lz
# Обновим все конфиги еще раз, теперь с нашей ссылкой
update-initramfs -u -k all
update-grub
cd /boot
# Создаем ссылки на все возможные расширения, которые может искать Cubic
ln -sf initrd.img-6.8.0-38-generic initrd.lz
ln -sf initrd.img-6.8.0-38-generic initrd.img
ln -sf initrd.img-6.8.0-38-generic initrd
ls -l /boot/initrd*
# Убедимся, что само ядро доступно для чтения загрузчиком
chmod 644 /boot/vmlinuz-6.8.0-38-generic
apt-get clean
rm -rf /var/lib/apt/lists/*
cd /boot
# Удаляем ссылки
rm initrd.lz initrd.img initrd
# Делаем реальные копии (да, это займет место, но нам нужен результат!)
cp initrd.img-6.8.0-38-generic initrd.lz
cp initrd.img-6.8.0-38-generic initrd.img
cp initrd.img-6.8.0-38-generic initrd
cp vmlinuz-6.8.0-38-generic vmlinuz.efi
cd /boot
# Сначала удалим всё, что мы наплодили ссылками
rm -f initrd.lz initrd.img initrd vmlinuz.efi
# Копируем само ядро под разными именами
cp vmlinuz-6.8.0-38-generic vmlinuz
cp vmlinuz-6.8.0-38-generic vmlinuz.efi
# Копируем initrd под всеми возможными именами (займет место, но сработает)
cp initrd.img-6.8.0-38-generic initrd.lz
cp initrd.img-6.8.0-38-generic initrd.img
cp initrd.img-6.8.0-38-generic initrd
apt-get purge -y cryptsetup cryptsetup-bin
update-initramfs -u -k all
nano /etc/default/grub
update-grub
chmod 755 /boot/vmlinuz*
chmod 755 /boot/initrd*
cd /boot
# 1. Удаляем все старые ссылки, чтобы они не мешались
rm -f initrd.lz initrd.img initrd vmlinuz.efi
# 2. Делаем РЕАЛЬНЫЕ КОПИИ ядра
# Cubic может искать vmlinuz (стандарт) или vmlinuz.efi (для UEFI)
cp vmlinuz-6.8.0-38-generic vmlinuz
cp vmlinuz-6.8.0-38-generic vmlinuz.efi
# 3. Делаем РЕАЛЬНЫЕ КОПИИ initrd
# Мы создаем файлы под всеми именами, которые когда-либо использовались в Ubuntu/Mint
cp initrd.img-6.8.0-38-generic initrd.lz
cp initrd.img-6.8.0-38-generic initrd.img
cp initrd.img-6.8.0-38-generic initrd
# 4. Проверяем результат
ls -lh /boot
zramctl
# или
systemctl status zram-config  # если ставил через пакет
# или просто посмотри логи
dmesg | grep zram
# 1. Проверяем, есть ли модуль в ядре
sudo modprobe zram
# 2. Устанавливаем алгоритм сжатия (zstd быстрее, lzo экономнее)
echo zstd | sudo tee /sys/block/zram0/comp_algorithm
# 3. Задаем размер (например, 2ГБ для твоего нетбука)
echo 2G | sudo tee /sys/block/zram0/disksize
# 4. Активируем как swap
sudo mkswap /dev/zram0
sudo swapon /dev/zram0 -p 100
dpkg --list | grep linux-image
ls /boot
ls -l /lib/modules
# Удаляем все модули, кроме нужных
mkdir -p /etc/skel/Desktop
nano /etc/skel/Desktop/install.desktop
chmod +x /etc/skel/Desktop/install.desktop
ls -la /lib/modules
cat /etc/systemd/system/zram-config.service
find /lib/systemd/system /etc/systemd/system -name "*zram*"
apt-get purge zram-config zramswap-enabler
rm /lib/systemd/system/zram-config.service
rm /lib/systemd/system/zramswap.service
rm /etc/systemd/system/multi-user.target.wants/zram-config.service
systemctl daemon-reload
ln -s /etc/systemd/system/zram-config.service /etc/systemd/system/multi-user.target.wants/zram-config.service
nano /etc/init.d/zram-start
chmod +x /etc/init.d/zram-start
update-rc.d zram-start defaults
nano /etc/init.d/zram-start
# Проверь, что файл на месте
mkdir -p /etc/skel/Desktop
cp ~/install.desktop /etc/skel/Desktop/ 2>/dev/null || true
# Даем права всем
chmod +x /etc/skel/Desktop/install.desktop
dbus-launch gio set /etc/skel/Desktop/install.desktop metadata::xfce-exe-checksum "$(sha256sum /etc/skel/Desktop/install.desktop | cut -d' ' -f1)"
dbus-uuidgen --ensure=/etc/machine-id
dbus-uuidgen --ensure
rm -f /etc/machine-id /var/lib/dbus/machine-id
dbus-uuidgen --ensure=/etc/machine-id
mkdir -p /var/lib/dbus
dbus-uuidgen --ensure=/etc/machine-id
dbus-uuidgen --ensure
mkdir -p /var/lib/dbus
dbus-launch gio set /etc/skel/Desktop/install.desktop metadata::xfce-exe-checksum "$(sha256sum /etc/skel/Desktop/install.desktop | cut -d' ' -f1)"
apt-get install icewm icewm-themes
add-apt-repository universe
add-apt-repository multiverse
apt-get update
apt-get install icewm icewm-themes icewm-common
apt-get install icewm icewm-common icewm-default-themes -y
apt-get install icewm icewm-common -y
mkdir -p /etc/skel/Desktop
cat << EOF > /etc/skel/Desktop/INSTALL_GUIDE.txt
=========================================
      SPACE IS LINUX - INSTALLER
=========================================

Чтобы начать установку системы на диск:
1. Открой терминал (Ctrl+Alt+T)
2. Введи команду: sudo ubiquity
3. Следуй инструкциям на экране.

Удачи, исследователь.
=========================================
EOF

chmod 644 /etc/skel/Desktop/INSTALL_GUIDE.txt
mkdir -p /etc/skel/Desktop
cat << EOF > /etc/skel/Desktop/INSTALL_GUIDE.txt
=========================================
      SPACE IS LINUX - INSTALLER
=========================================

To install the system onto your drive:
1. Open terminal (Ctrl+Alt+T)
2. Type the following command: sudo ubiquity
3. Follow the instructions on the screen.

Good luck, explorer.
=========================================
EOF

chmod 644 /etc/skel/Desktop/INSTALL_GUIDE.txt
cat << EOF >> /etc/sysctl.conf
# ZSWAP Optimization for SpaceIsLinux
vm.swappiness=80
vm.vfs_cache_pressure=50
EOF

echo "zstd" >> /etc/modules
echo "zstd_compress" >> /etc/modules
nano /etc/init.d/zswap-enable
chmod +x /etc/init.d/zswap-enable
update-rc.d zswap-enable defaults
mkdir -p /etc/skel/Desktop
cat << EOF > /etc/skel/Desktop/INSTALLER_INFO.txt
=========================================
      SPACE IS LINUX - VERSION 1.1
=========================================

The installer icon is hidden to save resources.
To start the installation process:

1. Open Terminal (Ctrl+Alt+T)
2. Type: sudo ubiquity
3. Press Enter

System optimization (ZSWAP/ZSTD) is active.
=========================================
EOF

chmod 644 /etc/skel/Desktop/INSTALLER_INFO.txt
# Принудительно выставляем приоритет для IceWM
update-alternatives --install /usr/bin/x-session-manager x-session-manager /usr/bin/icewm-session 100
update-alternatives --set x-session-manager /usr/bin/icewm-session
mkdir -p /etc/skel/Desktop
cat << EOF > /etc/skel/Desktop/README_FIRST.txt
=========================================
      SPACE IS LINUX | OS CORE 1.1 
=========================================

SYSTEM OPTIMIZATION:
- ZSWAP: Enabled in kernel 6.8.0-38
- UI: IceWM (Minimalist mode active)

HOW TO INSTALL:
1. Open Terminal (Ctrl+Alt+T)
2. Type: sudo ubiquity
3. Press Enter and follow the wizard.

P.S. Low-end hardware optimization is 
applied. Check 'free -m' for RAM status.
=========================================
EOF

chmod 644 /etc/skel/Desktop/README_FIRST.txt
# Добавляем параметры в конфиг инициализации
echo "zswap.enabled=1" >> /etc/initramfs-tools/modules
echo "zswap.compressor=zstd" >> /etc/initramfs-tools/modules
echo "zstd" >> /etc/initramfs-tools/modules
echo "zstd_compress" >> /etc/initramfs-tools/modules
# Обновляем образ загрузки для твоего ядра 6.8.0-38
update-initramfs -u -k 6.8.0-38-generic
fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
# Прописываем в fstab, чтобы монтировался всегда
echo "/swapfile none swap sw 0 0" >> /etc/fstab
# Принудительно отключаем своп, если он активен
swapoff /swapfile 2>/dev/null
# Теперь форматируем и включаем заново
mkswap /swapfile
chmod 600 /swapfile
# Принудительно отключаем своп, если он активен
swapoff /swapfile 2>/dev/null
# Теперь форматируем и включаем заново
mkswap /swapfile
chmod 600 /swapfile
# Принудительно отключаем своп, если он активен
swapoff /swapfile 2>/dev/null
# Теперь форматируем и выставляем права
mkswap /swapfile
chmod 600 /swapfile
# Проверяем, есть ли запись в fstab, чтобы не дублировать
grep -q "/swapfile" /etc/fstab || echo "/swapfile none swap sw 0 0" >> /etc/fstab
sudo dmesg | grep zswap
mkdir -p /etc/skel/Desktop
cat << EOF > /etc/skel/Desktop/INSTALL_INFO.txt
=========================================
      SPACE IS LINUX | CORE 1.1
=========================================

SYSTEM OPTIMIZATION:
- ZSWAP: Hardcoded (ZSTD)
- UI: IceWM (Lite-mode active)

TO INSTALL SYSTEM:
1. Open Terminal (Ctrl+Alt+T)
2. Type: sudo ubiquity
3. Follow the wizard.

P.S. Optimized for AMD C-70 and low RAM.
=========================================
EOF

chmod 644 /etc/skel/Desktop/INSTALL_INFO.txt
tail -n 1 /etc/fstab
# Создаем папку рабочего стола для стандартного пользователя Live-сессии
mkdir -p /home/mint/Desktop
mkdir -p /root/Desktop
# Пишем файл напрямую к нему
cat << EOF > /home/mint/Desktop/INSTALL_GUIDE.txt
=========================================
      SPACE IS LINUX | RELEASE CANDIDATE
=========================================

TO INSTALL THE SYSTEM:
1. Open Terminal (Ctrl+Alt+T)
2. Type: sudo ubiquity
3. Follow the wizard.

OPTIMIZATIONS:
- ZSWAP: Hardcoded in /etc/fstab
- UI: IceWM set as default session
=========================================
EOF

# Копируем и в skel на будущее, и даем права
cp /home/mint/Desktop/INSTALL_GUIDE.txt /etc/skel/Desktop/
chown -R 999:999 /home/mint/Desktop/  # 999 - это обычно ID live-юзера
chmod 644 /home/mint/Desktop/INSTALL_GUIDE.txt
# Удаляем стандартную сессию Mint, чтобы у системы не было выбора
rm -f /usr/share/xsessions/lightdm-xsession.desktop
rm -f /usr/share/xsessions/xfce.desktop
# Создаем свою сессию для IceWM
cat << EOF > /usr/share/xsessions/icewm.desktop
[Desktop Entry]
Name=IceWM
Comment=Lightweight window manager
Exec=icewm-session
Terminal=false
Type=Application
EOF

# 1. Создаем папку для настроек сессий, если её нет
mkdir -p /usr/share/xsessions
# 2. Удаляем ВСЕ другие сессии (Openbox, XFCE, и т.д.), чтобы остался только IceWM
# ВНИМАНИЕ: Это жесткий метод, но он гарантирует результат.
rm -f /usr/share/xsessions/openbox.desktop
rm -f /usr/share/xsessions/xfce.desktop
rm -f /usr/share/xsessions/lightdm-xsession.desktop
# 3. Создаем единственный верный файл сессии для IceWM
cat << EOF > /usr/share/xsessions/icewm.desktop
[Desktop Entry]
Name=IceWM
Comment=SpaceIsLinux Default Session
Exec=icewm-session
Terminal=false
Type=Application
EOF

# 4. Принудительно выставляем права
chmod 644 /usr/share/xsessions/icewm.desktop
# Для текущего live-пользователя
mkdir -p /home/mint/Desktop
cat << EOF > /home/mint/Desktop/README_INSTALL.txt
=========================================
      SPACE IS LINUX | RELEASE CANDIDATE
=========================================

1. Open Terminal: Ctrl+Alt+T
2. Run: sudo ubiquity
3. Follow the wizard.

ZSWAP: Active
UI: IceWM (Standard Panel included)
=========================================
EOF

# Копируем в шаблон для всех новых юзеров
mkdir -p /etc/skel/Desktop
cp /home/mint/Desktop/README_INSTALL.txt /etc/skel/Desktop/
chmod -R 777 /home/mint/Desktop/
cat << EOF > /home/mint/IMPORTANT_READ_ME.txt
=========================================
      SPACE IS LINUX | RC 1.1
=========================================
1. TERMINAL: Ctrl+Alt+T
2. INSTALL: sudo ubiquity
3. ZSWAP is ACTIVE.
=========================================
EOF

cp /home/mint/IMPORTANT_READ_ME.txt /etc/skel/
# Создаем директорию конфигов для пользователя по умолчанию
mkdir -p /etc/skel/.icewm
# Пишем скрипт автозапуска
cat << EOF > /etc/skel/.icewm/startup
#!/bin/bash
icewmbg &          # Обои
icewm-session &    # Сессия и панель
EOF

chmod +x /etc/skel/.icewm/startup
# Копируем это же текущему live-юзеру, чтобы изменения были видны сразу
mkdir -p /home/mint/.icewm
cp /etc/skel/.icewm/startup /home/mint/.icewm/startup
chown -R 999:999 /home/mint/.icewm
apt update
apt install --no-install-recommends network-manager nm-tray ubiquity ubiquity-frontend-gtk
apt install xserver-xorg-video-ati xserver-xorg-video-radeon firmware-amd-graphics
# Обновляем списки, чтобы система знала о новых путях
apt update
# В новых версиях Ubuntu/Mint все прошивки GPU находятся здесь
apt install --no-install-recommends linux-firmware xserver-xorg-video-amdgpu xserver-xorg-video-ati xserver-xorg-video-radeon
# Также убедись, что установлен драйвер для дисплея
apt install x11-xserver-utils
# 1. Посмотрим, какие ядра сейчас установлены
dpkg --list | grep linux-image
# 2. Удаляем старые ядра (замени X.X.X на версии, которые хочешь убрать)
# ОСТАВЬ только самое последнее (например, 6.8.0-38)
apt purge linux-image-X.X.X-generic linux-headers-X.X.X-generic
# 3. После удаления обязательно обнови GRUB и initramfs
update-initramfs -u
update-grub
# Удаляем метапакеты, чтобы они не занимали место (само ядро останется)
apt purge linux-image-generic linux-headers-generic
# Очищаем кэш apt (это то, что крадет твои гигабайты!)
apt clean
apt autoremove --purge
mkdir -p /etc/skel/.icewm
cat <<EOF > /etc/skel/.icewm/startup
#!/bin/bash
icewmbg -i /usr/share/backgrounds/space.jpg &
nm-tray &
EOF

chmod +x /etc/skel/.icewm/startup
mkdir -p /etc/skel/.icewm
nano /etc/skel/.icewm/startup
ls /usr/share/backgrounds/
ls /usr/share/backgrounds/spaceislinux
# 1. Создаем системную папку для обоев
mkdir -p /usr/share/backgrounds/
# 2. Переносим файл из /root в системную папку
mv /root/space_is_linux.jpg /usr/share/backgrounds/space_is_linux.jpg
# 3. Настраиваем автозагрузку, чтобы IceWM видел именно этот файл
mkdir -p /etc/skel/.icewm
cat <<EOF > /etc/skel/.icewm/startup
#!/bin/bash
icewmbg -i /usr/share/backgrounds/space_is_linux.jpg &
nm-tray &
EOF

# 4. Делаем скрипт исполняемым
chmod +x /etc/skel/.icewm/startup
#!/bin/bash
# ZRAM Aggressive Optimization for SpaceIsLinux
modprobe zram num_devices=1
# Выделяем 60% от 2GB RAM (или сколько там на C-70)
echo lzo-rle > /sys/block/zram0/comp_algorithm
echo 1G > /sys/block/zram0/disksize
mkswap /dev/zram0
swapon -p 100 /dev/zram0
# Убедись, что установлены модули именно для твоего ядра
apt install --no-install-recommends linux-modules-extra-$(uname -r)
echo 'ACTION=="add|change", KERNEL=="sd[a-z]*|mmcblk[0-9]*", ATTR{queue/scheduler}="noop"' > /etc/udev/rules.d/60-scheduler.rules
# Оставь только AMD и базовые вещи
cd /lib/firmware
# (Осторожно! Оставь только то, что нужно для C-70)
ls
# 1. Создаем временную директорию
mkdir /tmp/firmware_backup
# 2. Перемещаем туда только то, что нужно для C-70 и системы
mv amd amd-ucode amdgpu radeon regulatory.db* /tmp/firmware_backup/
# 3. Удаляем всё остальное (будь крайне осторожен)
# Если у тебя есть Wi-Fi адаптер (например Atheros или MediaTek), 
# добавь его папку в список mv выше перед этим шагом!
rm -rf /lib/firmware/*
# 4. Возвращаем нужное обратно
mv /tmp/firmware_backup/* /lib/firmware/
# 5. Удаляем временную папку
rmdir /tmp/firmware_backup
lspci -k
# Пример "золотой середины" для человеческого дистрибутива:
mkdir /tmp/keep
# Видео
mv /lib/firmware/i915 /lib/firmware/amdgpu /lib/firmware/radeon /lib/firmware/nouveau /tmp/keep/
# Сеть
mv /lib/firmware/intel /lib/firmware/iwlwifi /lib/firmware/rtlwifi /lib/firmware/realtek /lib/firmware/ath* /tmp/keep/
# Звук и тачпады
mv /lib/firmware/intel/sof* /tmp/keep/ # Современный звук Intel
# Микрокод
mv /lib/firmware/intel-ucode /lib/firmware/amd-ucode /tmp/keep/
rm -rf /lib/firmware/*
mv /tmp/keep/* /lib/firmware/
ls -F /lib/firmware
apt update
apt install --reinstall linux-firmware
# 1. Создаем временный бункер для нужных прошивок
mkdir -p /tmp/keep
# 2. Переносим то, что "оживит" любой старый ноутбук (Видео, Процессоры, Сеть)
# Графика
mv /lib/firmware/i915 /lib/firmware/amdgpu /lib/firmware/radeon /lib/firmware/nouveau /tmp/keep/ 2>/dev/null
# Микрокод
mv /lib/firmware/intel-ucode /lib/firmware/amd-ucode /tmp/keep/ 2>/dev/null
# Wi-Fi и Ethernet (самые ходовые в старых ноутах)
mv /lib/firmware/rtlwifi /lib/firmware/realtek /lib/firmware/iwlwifi /lib/firmware/ath* /lib/firmware/b43* /lib/firmware/brcm /tmp/keep/ 2>/dev/null
# Звук и общие компоненты Intel
mv /lib/firmware/intel /tmp/keep/ 2>/dev/null
# База частот Wi-Fi
mv /lib/firmware/regulatory* /tmp/keep/ 2>/dev/null
# 3. УДАЛЯЕМ всё остальное (серверные Mellanox, Netronome, LiquidIO и прочий мусор)
rm -rf /lib/firmware/*
# 4. Возвращаем жизненно важные органы на место
mv /tmp/keep/* /lib/firmware/
# 5. Подметаем за собой
rmdir /tmp/keep
cd ..
sudo update-initramfs -u -k all
sudo modprobe zram
lsmod | grep zram
# Настраиваем 1 устройство
zramctl --find --size 1G --algorithm zstd
# Или если zstd нет в списке lsmod, используй lz4 (он быстрее для слабых CPU)
# zramctl --find --size 1G --algorithm lz4
# Создаем своп
mkswap /dev/zram0
swapon /dev/zram0 -p 100
apt update
apt install zram-tools
# Открой файл через nano или просто перепиши его:
cat <<EOF > /etc/default/zramswap
# Алгоритм сжатия (lz4 — лучший баланс скорости для старых ноутов)
ALGO=lz4

# Сколько памяти выделить под zRAM (60% — золотая середина)
PERCENT=60

# Приоритет выше, чем у дискового свопа
PRIORITY=100
EOF

systemctl enable zramswap
dpkg -l | grep zram
# 1. Удаляем путаницу (оставляем только zram-tools)
apt purge zram-config -y
# 2. Теперь пробуем активировать службу снова
systemctl enable zramswap
cat <<EOF > /etc/systemd/system/zram.service
[Unit]
Description=ZRAM Optimized Swap for Old PCs
After=multi-user.target

[Service]
Type=oneshot
RemainAfterExit=yes
# Загружаем модуль
ExecStartPre=/sbin/modprobe zram
# Настройка: используем lz4 (лучший для старых CPU) и выделяем 60% от RAM
ExecStart=/bin/sh -c 'echo lz4 > /sys/block/zram0/comp_algorithm &&                       echo \$((\$(free -b | grep Mem | awk "{print \$2}") * 60 / 100)) > /sys/block/zram0/disksize &&                       /sbin/mkswap /dev/zram0 &&                       /sbin/swapon /dev/zram0 -p 100'
ExecStop=/bin/sh -c '/sbin/swapoff /dev/zram0 && echo 1 > /sys/block/zram0/reset'

[Install]
WantedBy=multi-user.target
EOF

systemctl enable zram.service
echo "vm.swappiness = 100" >> /etc/sysctl.conf
echo "vm.vfs_cache_pressure = 50" >> /etc/sysctl.conf
# Создаем файл переопределения для Cinnamon (самый частый вариант для Mint)
cat <<EOF > /usr/share/glib-2.0/schemas/99_space-detected-theme.gschema.override
[org.cinnamon.desktop.background]
picture-uri='file:///usr/share/backgrounds/space_is_linux.jpg'
picture-options='zoom'

[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/space_is_linux.jpg'
picture-options='zoom'
EOF

glib-compile-schemas /usr/share/glib-2.0/schemas
[org.cinnamon.desktop.screensaver]
picture-uri='file:///usr/share/backgrounds/space_is_linux.jpg'
cat <<EOF > /usr/share/glib-2.0/schemas/99_space-detected-theme.gschema.override
[org.cinnamon.desktop.background]
picture-uri='file:///usr/share/backgrounds/space_is_linux.jpg'
picture-options='zoom'

[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/space_is_linux.jpg'
picture-options='zoom'

[org.cinnamon.desktop.screensaver]
picture-uri='file:///usr/share/backgrounds/space_is_linux.jpg'
EOF

glib-compile-schemas /usr/share/glib-2.0/schemas
cat <<EOF > /usr/share/glib-2.0/schemas/99_space-detected-theme.gschema.override
[org.cinnamon.desktop.background]
picture-uri='file:///usr/share/backgrounds/space_is_linux.jpg'
picture-options='zoom'

[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/space_is_linux.jpg'
picture-options='zoom'

[org.cinnamon.desktop.screensaver]
# В новых версиях ключ может называться так или отсутствовать в этой схеме
picture-path='/usr/share/backgrounds/space_is_linux.jpg'
EOF

glib-compile-schemas /usr/share/glib-2.0/schemas
cat <<EOF > /usr/share/glib-2.0/schemas/99_space-detected-theme.gschema.override
[org.cinnamon.desktop.background]
picture-uri='file:///usr/share/backgrounds/space_is_linux.jpg'
picture-options='zoom'

[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/space_is_linux.jpg'
picture-options='zoom'
EOF

glib-compile-schemas /usr/share/glib-2.0/schemas
# 1. Убеждаемся, что модуль загрузится ядром
echo "zram" >> /etc/modules
# 2. Правим конфиг пакета напрямую
cat <<EOF > /etc/default/zramswap
ALGO=lz4
PERCENT=60
PRIORITY=100
EOF

# 3. Принудительно включаем службу
systemctl enable zramswap
# 1. Принудительная загрузка модуля при старте ядра
echo "zram" >> /etc/modules
# 2. Создаем файл инициализации, который сработает ВНЕ ЗАВИСИМОСТИ от пакетов
cat <<EOF > /etc/rc.local
#!/bin/bash
modprobe zram
zramctl --find --size 1G --algorithm lz4
mkswap /dev/zram0
swapon /dev/zram0 -p 100
exit 0
EOF

# 3. Даем права на исполнение
chmod +x /etc/rc.local
# Находим ВСЕ стандартные обои и заменяем их твоим файлом
find /usr/share/backgrounds -type f -name "*.jpg" -exec cp /usr/share/backgrounds/space_is_linux.jpg {} \;
find /usr/share/backgrounds -type f -name "*.png" -exec cp /usr/share/backgrounds/space_is_linux.jpg {} \;
echo "zram" >> /etc/modules
update-initramfs -u -k all
apt clean
# Удаляем ВСЁ в папке backgrounds, кроме твоего космоса
find /usr/share/backgrounds -type f ! -name "space_is_linux.jpg" -delete
echo 'KERNEL=="zram0", ATTR{comp_algorithm}="lz4", ATTR{disksize}="1G", RUN+="/sbin/mkswap /dev/zram0", RUN+="/sbin/swapon /dev/zram0 -p 100"' > /etc/udev/rules.d/99-zram.rules
cat <<EOF > /etc/init.d/zram-start
#!/bin/bash
modprobe zram
zramctl --find --size 1G --algorithm lz4
mkswap /dev/zram0
swapon /dev/zram0 -p 100
EOF

chmod +x /etc/init.d/zram-start
update-rc.d zram-start defaults
apt update
apt install lxqt-core lxqt-panel pcmanfm-qt lximage-qt
apt purge icewm  # Удаляем источник проблем
apt autoremove
mkdir -p /etc/skel/.config/pcmanfm-qt/lxqt/
mkdir -p /etc/skel/.config/pcmanfm-qt/lxqt/ && echo -e "[Desktop]\nWallpaper=/usr/share/backgrounds/space_is_linux.jpg\nWallpaperMode=stretch" > /etc/skel/.config/pcmanfm-qt/lxqt/settings.conf
echo "zram" >> /etc/modules
# Создаем простой скрипт запуска
cat <<EOF > /usr/local/bin/zram-start.sh
#!/bin/bash
modprobe zram
zramctl --find --size 1G --algorithm lz4
mkswap /dev/zram0
swapon /dev/zram0 -p 100
EOF

# Даем права на выполнение
chmod +x /usr/local/bin/zram-start.sh
# Добавляем его в rc.local, чтобы он сработал при загрузке системы
echo "/usr/local/bin/zram-start.sh" >> /etc/rc.local
chmod +x /etc/rc.local
apt upgrade -y
# Создаем простой скрипт запуска
cat <<EOF > /usr/local/bin/zram-start.sh
#!/bin/bash
modprobe zram
zramctl --find --size 1G --algorithm lz4
mkswap /dev/zram0
swapon /dev/zram0 -p 100
EOF

# Даем права на выполнение
chmod +x /usr/local/bin/zram-start.sh
# Добавляем его в rc.local, чтобы он сработал при загрузке системы
echo "/usr/local/bin/zram-start.sh" >> /etc/rc.local
chmod +x /etc/rc.local
update-initramfs -u -k all
# 1. Даем файлу установщика права на выполнение
chmod +x /etc/skel/Desktop/ubiquity-gtk-installer.desktop
# 2. Помечаем файл как "доверенный" для LXQt/PCManFM
# (Это делается через gvfs metadata, но мы применим прямой хак, создав конфиг)
mkdir -p /etc/skel/.local/share/gvfs-metadata
echo -n "trusted" > /etc/skel/.local/share/gvfs-metadata/`sha1sum /etc/skel/Desktop/ubiquity-gtk-installer.desktop | cut -d' ' -f1`
# Примечание: Метод выше сложен. Проще всего сделать вот так:
mkdir -p /etc/skel/.config/libfm/
echo -e "[default]\ntrust_executables=1" > /etc/skel/.config/libfm/libfm.conf
find /etc/skel -name "*install*" -exec chmod +x {} \;
mkdir -p /etc/skel/.config/libfm/
echo -e "[default]\ntrust_executables=1" > /etc/skel/.config/libfm/libfm.conf
cp /usr/share/backgrounds/space_is_linux.jpg /usr/share/lxqt/themes/debian/wallpaper.svg
update-initramfs -u -k all
# Удаляем конфликтный пакет
apt purge zram-tools -y
# Проверяем, есть ли скрипт, который мы создавали
ls -l /usr/local/bin/zram-start.sh
# Если его нет — пересоздай его одной строкой:
# Принудительно прописываем запуск в самый верх rc.local перед exit 0
sed -i 's/^exit 0/\/usr/local/bin/zram-start.sh\nexit 0/' /etc/rc.local
# Переходим в папку рабочего стола в skel
cd /etc/skel/Desktop/
# Убираем проверку через создание desktop-файла, который LXQt считает "родным"
gio set ubiquity-gtk-installer.desktop metadata::trusted true 2>/dev/null || true
# Если gio нет, просто разреши ВСЁ в конфиге pcmanfm-qt (финальный аккорд)
echo "ConfirmFirstDelete=false
Don'tAskAgainUntilExit=true
TrustAllExecutables=true" >> /etc/skel/.config/pcmanfm-qt/lxqt/settings.conf
# Создаем скрипт заново, используя одинарные кавычки
echo '#!/bin/bash
modprobe zram
zramctl --find --size 1G --algorithm lz4
mkswap /dev/zram0
swapon /dev/zram0 -p 100' > /usr/local/bin/zram-start.sh
chmod +x /usr/local/bin/zram-start.sh
# Добавляем запуск скрипта перед exit 0
sed -i 's|^exit 0|/usr/local/bin/zram-start.sh\nexit 0|' /etc/rc.local
# Создаем файл настроек, который принудительно доверяет ярлыкам
mkdir -p /etc/skel/.config/pcmanfm-qt/lxqt/
echo "[Desktop]
Wallpaper=/usr/share/backgrounds/space_is_linux.jpg
WallpaperMode=stretch
TrustAllExecutables=true" > /etc/skel/.config/pcmanfm-qt/lxqt/settings.conf
cat /etc/rc.local
cat <<'EOF' > /etc/rc.local
#!/bin/bash
# Space.Detected OS - ZRAM Initialization
modprobe zram
zramctl --find --size 1G --algorithm lz4
mkswap /dev/zram0
swapon /dev/zram0 -p 100
exit 0
EOF

chmod +x /etc/rc.local
lsmod | grep zram
apt update
# Устанавливаем стек сети и полный набор драйверов ядра
apt install network-manager network-manager-gnome linux-firmware -y
# Очищаем rc.local до заводских настроек
cat <<EOF > /etc/rc.local
#!/bin/bash
exit 0
EOF

# Ставим нативный конфигуратор (он сам создаст swap в ОЗУ под каждое ядро CPU)
apt install zram-config -y
# Прописываем Openbox дефолтным оконным менеджером для LXQt
mkdir -p /etc/xdg/lxqt
cat <<EOF > /etc/xdg/lxqt/session.conf
[General]
window_manager=openbox
EOF

# Добавляем сетевой апплет в автозапуск окружения
mkdir -p /etc/skel/.config/autostart
cat <<EOF > /etc/skel/.config/autostart/nm-applet.desktop
[Desktop Entry]
Name=Network Management
Comment=Manage network connections
Exec=nm-applet
Terminal=false
Type=Application
Icon=nm-device-wireless
EOF

mkdir -p /etc/skel/.config/pcmanfm-qt/lxqt
cat <<EOF > /etc/skel/.config/pcmanfm-qt/lxqt/settings.conf
[Desktop]
Wallpaper=/usr/share/lxqt/themes/debian/wallpaper.svg
WallpaperMode=stretch

[Behavior]
TrustAllExecutables=true
EOF

update-initramfs -u -k all
CHROOT
chroot
# Устанавливаем инструментарий musl и компилятор для статической сборки
apt update
apt install musl musl-dev musl-tools -y
apt install network-manager-gnome linux-firmware -y
apt install zram-config -y
apt install musl-tools -y
mkdir -p /etc/skel/.config/autostart
cat <<EOF > /etc/skel/.config/autostart/nm-applet.desktop
[Desktop Entry]
Name=Network
Exec=nm-applet
Terminal=false
Type=Application
EOF

# Уменьшаем таймаут ожидания зависших служб с 90 до 10 секунд
sed -i 's/#DefaultTimeoutStartSec=90s/DefaultTimeoutStartSec=10s/' /etc/systemd/system.conf
sed -i 's/#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=10s/' /etc/systemd/system.conf
# Отключаем ожидание сети при старте системы (чтобы система загружалась мгновенно даже без Wi-Fi)
systemctl disable systemd-networkd-wait-online.service
# Переводим логгер systemd в режим работы только в RAM
mkdir -p /etc/systemd/journald.conf.d/
cat <<EOF > /etc/systemd/journald.conf.d/00-volatile.conf
[Journal]
Storage=volatile
SystemMaxUse=50M
EOF

# Запрещаем APT удалять или случайно обновлять ключевые компоненты среды
apt-mark hold openbox lxqt-core network-manager zram-config
# Настраиваем надежный запуск LightDM
mkdir -p /etc/lightdm/lightdm.conf.d/
cat <<EOF > /etc/lightdm/lightdm.conf.d/80-display-setup.conf
[Seat:*]
pam-service=lightdm
pam-autologin-service=lightdm-autologin
autologin-user=mint
autologin-user-timeout=0
user-session=lxqt
EOF

apt clean && apt autoremove --purge -y && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*
apt upgrade
apt clean && apt autoremove --purge -y && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*
exit
micro /etc/rc.local
apt clean && apt autoremove --purge -y && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*
# Удаляем текстовые инструкции с рабочего стола и из дефолтного профиля
rm -f /etc/skel/Desktop/INSTALL_GUIDE.txt
rm -f /etc/skel/IMPORTANT_READ_ME.txt
# На всякий случай чистим их у пользователя mint, если файлы остались там
rm -f /home/mint/Desktop/INSTALL_GUIDE.txt
rm -f /home/mint/IMPORTANT_READ_ME.txt
cat <<EOF > .gitignore
*.iso
*.iso.tmp
*.log
EOF

ls
cd /
ls
cd root
cd /
cd proc
micro wantchu_gone.tx
micro wantchu_gone.txt
micro wantchu_gone
cd /
cd usr
micro wantchu_gone
cd /
cd bin
micro sil-fetch.c
cd /
cat <<'EOF' > /etc/issue
 \e[1;35m
 ____                       ___     _     _                  
/ ___| _ __   __ _  ___ ___|_ _|___| |   (_)_ __  _   ___  __
\___ \| '_ \ / _` |/ __/ _ \| |/ __| |   | | '_ \| | | \ \/ /
 ___) | |_) | (_| | (_|  __/| |\__ | |___| | | | | |_| |>  < 
|____/| .__/ \__,_|\___\___|___|___|_____|_|_| |_|\__,_/_/\_\
      |_|                                                    
 \e[0m
 SpaceIsLinux OS (Sil-1.3 Venus) \n \l

EOF

cd bin
musl-gcc sil-fetch.c -o sil-fetch
cd /tmp
cat <<'EOF' > sil-fetch.c
#include <stddef.h>
#include <stdio.h>
#include <sys/utsname.h>
#include <sys/sysinfo.h>

int main() {
    struct utsname buffer;
    struct sysinfo info;
    
    uname(&buffer);
    sysinfo(&info);

    long total_ram = info.totalram / (1024 * 1024);
    long free_ram = (info.totalram - info.freeram) / (1024 * 1024);

    printf("\033[1;35m");
    printf(" ____                       ___     _     _                  \n");
    printf("/ ___| _ __   __ _  ___ ___|_ _|___| |   (_)_ __  _   ___  __\n");
    printf("\\___ \\| '_ \\ / _` |/ __/ _ \\| |/ __| |   | | '_ \\| | | \\ \\/ /\n");
    printf(" ___) | |_) | (_| | (_|  __/| |\\__ | |___| | | | | |_| |>  < \n");
    printf("|____/| .__/ \\__,_|\\___\\___|___|___|_____|_|_| |_|\\__,_/_/\\_\\\n");
    printf("      |_|                                                    \n");
    printf("\033[0m\n");

    printf("\033[1;36mOS: \033[0mSpace.Detected Linux (Sil-1.3 Venus)\n");
    printf("\033[1;32mKernel: \033[0m%s\n", buffer.release);
    printf("\033[1;32mUptime: \033[0m%ld mins\n", info.uptime / 60);
    printf("\033[1;32mRAM:    \033[0m%ldMB / %ldMB\n", free_ram, total_ram);
    printf("\033[1;32mArch:   \033[0m%s\n\n", buffer.machine);

    return 0;
}
EOF

musl-gcc -O2 -static sil-fetch.c -o /usr/local/bin/sil-fetch
cd /
sil-fetch
cd bin
cd /tmp
cd /
cd /tmp
cat <<'EOF' > sil-fetch.c
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/utsname.h>
#include <sys/sysinfo.h>
#include <sys/statvfs.h>
#include <ifaddrs.h>
#include <netinet/in.h>
#include <arpa/inet.h>

// Функция получения локального IP и типа интерфейса
void get_net_info(char *iface_out, char *ip_out) {
    struct ifaddrs *ifaddr, *ifa;
    strcpy(iface_out, "Disconnected");
    strcpy(ip_out, "N/A");

    if (getifaddrs(&ifaddr) == -1) return;

    for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next) {
        if (ifa->ifa_addr == NULL) continue;
        if (ifa->ifa_addr->sa_family == AF_INET) { // IPv4
            if (strcmp(ifa->ifa_name, "lo") != 0) { // Игнорируем loopback
                void *tmpAddrPtr = &((struct sockaddr_in *)ifa->ifa_addr)->sin_addr;
                inet_ntop(AF_INET, tmpAddrPtr, ip_out, 16);
                
                if (strncmp(ifa->ifa_name, "wl", 2) == 0) {
                    strcpy(iface_out, "Wi-Fi");
                } else if (strncmp(ifa->ifa_name, "en", 2) == 0 || strncmp(ifa->ifa_name, "eth", 3) == 0) {
                    strcpy(iface_out, "Ethernet");
                } else {
                    strncpy(iface_out, ifa->ifa_name, 15);
                }
                break;
            }
        }
    }
    freeifaddrs(ifaddr);
}

// Функция получения инфы о видеокарте и VRAM
void get_gpu_info(char *gpu_out, char *vram_out) {
    strcpy(gpu_out, "Unknown GPU");
    strcpy(vram_out, "N/A");

    // Читаем название GPU из lspci
    FILE *fp = popen("lspci | grep -E 'VGA|3D' | cut -d ':' -f3 | sed 's/ (rev .*//' | xargs", "r");
    if (fp) {
        if (fgets(gpu_out, 128, fp) != NULL) {
            gpu_out[strcspn(gpu_out, "\n")] = 0; // убираем переносы
        }
        pclose(fp);
    }

    // Читаем VRAM из sysfs (для AMD/Intel/Nvidia)
    FILE *f_vram = fopen("/sys/class/drm/card0/device/mem_info_vram_total", "r");
    FILE *f_used = fopen("/sys/class/drm/card0/device/mem_info_vram_used", "r");
    if (f_vram && f_used) {
        unsigned long total = 0, used = 0;
        fscanf(f_vram, "%lu", &total);
        fscanf(f_used, "%lu", &used);
        snprintf(vram_out, 64, "%luMB / %luMB", used / (1024 * 1024), total / (1024 * 1024));
        fclose(f_vram);
        fclose(f_used);
    } else {
        strcpy(vram_out, "Shared System RAM");
    }
}

int main() {
    struct utsname buffer;
    struct sysinfo info;
    struct statvfs disk;

    uname(&buffer);
    sysinfo(&info);

    // RAM
    long total_ram = info.totalram / (1024 * 1024);
    long free_ram = (info.totalram - info.freeram) / (1024 * 1024);

    // Disk (корневой раздел /)
    statvfs("/", &disk);
    double total_disk = (double)(disk.f_blocks * disk.f_frsize) / (1024 * 1024 * 1024);
    double free_disk = (double)(disk.f_bfree * disk.f_frsize) / (1024 * 1024 * 1024);
    double used_disk = total_disk - free_disk;
    int disk_pct = (int)((used_disk / total_disk) * 100);

    // Network & GPU
    char iface[32], ip[32], gpu[128], vram[64];
    get_net_info(iface, ip);
    get_gpu_info(gpu, vram);

    // Вывод ASCII арта
    printf("\033[1;35m");
    printf(" ____                       ___     _     _                  \n");
    printf("/ ___| _ __   __ _  ___ ___|_ _|___| |   (_)_ __  _   ___  __\n");
    printf("\\___ \\| '_ \\ / _` |/ __/ _ \\| |/ __| |   | | '_ \\| | | \\ \\/ /\n");
    printf(" ___) | |_) | (_| | (_|  __/| |\\__ | |___| | | | | |_| |>  < \n");
    printf("|____/| .__/ \\__,_|\\___\\___|___|___|_____|_|_| |_|\\__,_/_/\\_\\\n");
    printf("      |_|                                                    \n");
    printf("\033[0m\n");

    // Вывод параметров
    printf("\033[1;36mOS:      \033[0mSpace.Detected Linux (Sil-1.3 Venus)\n");
    printf("\033[1;32mKernel:  \033[0m%s\n", buffer.release);
    printf("\033[1;32mUptime:  \033[0m%ld mins\n", info.uptime / 60);
    printf("\033[1;32mCPU:     \033[0m%s\n", buffer.machine);
    printf("\033[1;32mGPU:     \033[0m%s\n", gpu);
    printf("\033[1;32mVRAM:    \033[0m%s\n", vram);
    printf("\033[1;32mRAM:     \033[0m%ldMB / %ldMB\n", free_ram, total_ram);
    printf("\033[1;32mDisk:    \033[0m%.1fGB / %.1fGB (%d%%)\n", used_disk, total_disk, disk_pct);
    printf("\033[1;32mNet:     \033[0m%s (%s)\n\n", iface, ip);

    return 0;
}
EOF

micro sil-fetch.c
# Компилируем и заменяем старый бинарник
musl-gcc -O2 -static sil-fetch.c -o /usr/local/bin/sil-fetch
# Запускаем!
sil-fetch
# 1. Монтируем системные директории
sudo mount --bind /dev custom-root/dev
sudo mount --bind /run custom-root/run
sudo mount -t proc proc custom-root/proc
sudo mount -t sysfs sys custom-root/sys
# 2. Входим в окружение
sudo chroot custom-root /bin/bash
mkdir -p /dev/pts
mount -t devpts devpts /dev/pts
gcc -O3 /tmp/sil-fetch.c -o /usr/local/bin/sil-fetch 2>/dev/null || true
chmod +x /usr/local/bin/sil-fetch
chmod +x /usr/local/bin/sil-*
apt-get clean
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/* /var/tmp/*
exit
