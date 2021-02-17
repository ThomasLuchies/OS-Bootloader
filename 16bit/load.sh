nasm -f bin bootloader.asm -o boot1.bin
qemu-system-x86_64 -fda boot1.bin 
