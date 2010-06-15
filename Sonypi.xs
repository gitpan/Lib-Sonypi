/* $Id$ */

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <getopt.h>
#include <errno.h>
#include <linux/types.h>
#include <stdio.h>

#include "Sonypi.h"

static int   fd = 0;
static char *dev = "/dev/sonypi";

static int
_open()
{
   int fd;

   if ((fd = open(dev, O_RDWR)) == -1) {
      perror(dev);
      return -1;
   }

   return fd;
}

static int
_close(int fd)
{
   if (close(fd) == -1) {
      perror("close");
      return -1;
   }

   return 0;
}

static __u8
_ioctl_get8(int op)
{
   __u8 val = -1;

   if (ioctl(fd, op, &val) < 0) {
      perror("ioctl: get8");
      return -1;
   }

   return val;
}

static __u8
_ioctl_set8(int op, __u8 val)
{
   if (ioctl(fd, op, &val) < 0) {
      perror("ioctl: set8");
      return -1;
   }
   return val;
}

static __u16
_ioctl_get16(int op)
{
   __u16 val = -1;

   if (ioctl(fd, op, &val) < 0) {
      perror("ioctl: get16");
      return -1;
   }

   return val;
}

static __u16
_ioctl_set16(int op, __u16 val)
{
   if (ioctl(fd, op, &val) < 0) {
      perror("ioctl: set16");
      return -1;
   }
   return val;
}


MODULE = Lib::Sonypi  PACKAGE = Lib::Sonypi
PROTOTYPES: DISABLE

int
getbrt()
   CODE:
      if ((fd = _open()) == -1) {
         RETVAL = -1;
      }
      else {
         RETVAL = _ioctl_get8(SONYPI_IOCGBRT);
         _close(fd);
      }
   OUTPUT:
      RETVAL

int
setbrt(val)
      int val
   CODE:
      if ((fd = _open()) == -1) {
         RETVAL = -1;
      }
      else {
         RETVAL = _ioctl_set8(SONYPI_IOCSBRT, (__u8) val);
         _close(fd);
      }
   OUTPUT:
      RETVAL

int
getbat1cap()
   CODE:
      if ((fd = _open()) == -1) {
         RETVAL = -1;
      }
      else {
         RETVAL = _ioctl_get16(SONYPI_IOCGBAT1CAP);
         _close(fd);
      }
   OUTPUT:
      RETVAL

int
getbat1rem()
   CODE:
      if ((fd = _open()) == -1) {
         RETVAL = -1;
      }
      else {
         RETVAL = _ioctl_get16(SONYPI_IOCGBAT1REM);
         _close(fd);
      }
   OUTPUT:
      RETVAL

int
getbat2cap()
   CODE:
      if ((fd = _open()) == -1) {
         RETVAL = -1;
      }
      else {
         RETVAL = _ioctl_get16(SONYPI_IOCGBAT2CAP);
         _close(fd);
      }
   OUTPUT:
      RETVAL

int
getbat2rem()
   CODE:
      if ((fd = _open()) == -1) {
         RETVAL = -1;
      }
      else {
         RETVAL = _ioctl_get16(SONYPI_IOCGBAT2REM);
         _close(fd);
      }
   OUTPUT:
      RETVAL

int
getbatflags()
   CODE:
      if ((fd = _open()) == -1) {
         RETVAL = -1;
      }
      else {
         RETVAL = _ioctl_get8(SONYPI_IOCGBATFLAGS);
         _close(fd);
      }
   OUTPUT:
      RETVAL

int
getblue()
   CODE:
      if ((fd = _open()) == -1) {
         RETVAL = -1;
      }
      else {
         RETVAL = _ioctl_get8(SONYPI_IOCGBLUE);
         _close(fd);
      }
   OUTPUT:
      RETVAL

int
setblue(value)
      int value
   CODE:
      if ((fd = _open()) == -1) {
         RETVAL = -1;
      }
      else {
         RETVAL = _ioctl_set8(SONYPI_IOCSBLUE, (__u8) value);
         _close(fd);
      }
   OUTPUT:
      RETVAL

int
getfan()
   CODE:
      if ((fd = _open()) == -1) {
         RETVAL = -1;
      }
      else {
         RETVAL = _ioctl_get8(SONYPI_IOCGFAN);
         _close(fd);
      }
   OUTPUT:
      RETVAL

int
setfan(value)
      int value
   CODE:
      if ((fd = _open()) == -1) {
         RETVAL = -1;
      }
      else {
         RETVAL = _ioctl_set8(SONYPI_IOCSFAN, (__u8) value);
         _close(fd);
      }
   OUTPUT:
      RETVAL

int
gettemp()
   CODE:
      if ((fd = _open()) == -1) {
         RETVAL = -1;
      }
      else {
         RETVAL = _ioctl_get8(SONYPI_IOCGTEMP);
         _close(fd);
      }
   OUTPUT:
      RETVAL
