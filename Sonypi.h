#ifndef _SONYPI_H_
#define _SONYPI_H_

/* get/set brightness */
#define SONYPI_IOCGBRT          _IOR('v', 0, __u8)
#define SONYPI_IOCSBRT          _IOW('v', 0, __u8)

/* get battery full capacity/remaining capacity */
#define SONYPI_IOCGBAT1CAP      _IOR('v', 2, __u16)
#define SONYPI_IOCGBAT1REM      _IOR('v', 3, __u16)
#define SONYPI_IOCGBAT2CAP      _IOR('v', 4, __u16)
#define SONYPI_IOCGBAT2REM      _IOR('v', 5, __u16)

/* get battery flags: battery1/battery2/ac adapter present */
#define SONYPI_BFLAGS_B1        0x01
#define SONYPI_BFLAGS_B2        0x02
#define SONYPI_BFLAGS_AC        0x04
#define SONYPI_IOCGBATFLAGS     _IOR('v', 7, __u8)

/* get/set bluetooth subsystem state on/off */
#define SONYPI_IOCGBLUE         _IOR('v', 8, __u8)
#define SONYPI_IOCSBLUE         _IOW('v', 9, __u8)

/* get/set fan state on/off */
#define SONYPI_IOCGFAN          _IOR('v', 10, __u8)
#define SONYPI_IOCSFAN          _IOW('v', 11, __u8)

/* get temperature (C) */
#define SONYPI_IOCGTEMP         _IOR('v', 12, __u8)

#endif /* _SONYPI_H_ */
