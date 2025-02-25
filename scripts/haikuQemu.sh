#!sh

args=(
	-display haiku
	-machine q35
	-accel tcg
	-cpu max
	-m 1G
	-serial stdio
	-parallel none
	-monitor none
#	-bios "OVMF.fd"
	-device cirrus-vga
	-smp 8

	-device nec-usb-xhci,id=xhci
	-device usb-tablet,bus=xhci.0
	-device usb-kbd,bus=xhci.0

	-device nvme,drive=x1,serial=deadbeaf1
	-drive file="/Opslag/Haiku/haiku/generated.x86_64/haiku-nightly-anyboot.iso",format=raw,if=none,id=x1
)

qemu-system-x86_64 "${args[@]}"
