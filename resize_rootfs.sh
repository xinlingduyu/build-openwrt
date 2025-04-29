# 扩展分区脚本
FDISK=$(which fdisk) || { echo "E: You must have fdisk" && exit 1; }
LOSETUP=$(which losetup) || { echo "E: You must have losetup" && exit 1; }
roottype=$(findmnt -n -o SOURCE / -o FSTYPE)
case ${roottype} in
        overlay)
                FSCKF2FS=$(which fsck.f2fs) || { echo "E: You must have fsck.f2fs" && exit 1; }
                rootsource=$(findmnt -n -o SOURCE /rom)                 # i.e. /dev/mmcblk0p2
                rootdevice=${rootsource%p*}                             # i.e. /dev/mmcblk0
                partitions=${rootsource##*p}

                # Resizing partitions
                lastsector=$(${FDISK} -l ${rootdevice} |grep "Disk ${rootdevice}" |awk '{print $7}')
                lastsector=$(( $lastsector - 1 ))
                startfrom=$(${FDISK} -l ${rootdevice} |grep ${rootsource} |awk '{print $2}')
                partend=$(${FDISK} -l ${rootdevice} |grep ${rootsource} |awk '{print $3}')
                [[ $lastsector -eq $partend ]] && exit 0
                (echo d; echo $partitions; echo n; echo p; echo ; echo $startfrom; echo $lastsector ; echo w;) | fdisk $rootdevice
                sync

                # Start resizing filesystem
                LOOP="$(losetup -n -O NAME | sort | sed -n -e "1p")"
                ROOT="$(losetup -n -O BACK-FILE ${LOOP} | sed -e "s|^|/dev|")"
                OFFS="$(losetup -n -O OFFSET ${LOOP})"
                LOOP="$(losetup -f)"
                ${LOSETUP} -o ${OFFS} ${LOOP} ${ROOT}
                ${FSCKF2FS} -f ${LOOP}
                mount ${LOOP} /mnt
                umount ${LOOP}
                resize.f2fs ${LOOP}
                sync && reboot
                ;;
        ext4)
                FSCKEXT4=$(which fsck.ext4) || { echo "E: You must have fsck.ext4" && exit 1; }
                RESIZE2FS=$(which resize2fs) || { echo "E: You must have resize2fs" && exit 1; }
                rootsource=$(findmnt -n -o SOURCE / | sed 's~\[.*\]~~')         # i.e. /dev/mmcblk0p2
                rootdevice=${rootsource%p*}                                     # i.e. /dev/mmcblk0
                partitions=${rootsource##*p}

                # Resizing partitions
                lastsector=$(${FDISK} -l ${rootdevice} |grep "Disk ${rootdevice}" |awk '{print $7}')
                lastsector=$(( $lastsector - 1 ))
                startfrom=$(${FDISK} -l ${rootdevice} |grep ${rootsource} |awk '{print $2}')
                partend=$(${FDISK} -l ${rootdevice} |grep ${rootsource} |awk '{print $3}')
                [[ $lastsector -eq $partend ]] && exit 0
                (echo d; echo $partitions; echo n; echo p; echo ; echo $startfrom; echo $lastsector ; echo w;) | fdisk $rootdevice
                sync

                # Start resizing filesystem
                LOOP="$(losetup -f)"
                ${LOSETUP} ${LOOP} ${rootsource}
                ${FSCKEXT4} -y ${LOOP}
                ${RESIZE2FS} ${LOOP}
                sync
                ;;
esac

exit 0