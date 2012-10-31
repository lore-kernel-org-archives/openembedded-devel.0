Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rangers.av@gmail.com>) id 1TTPkZ-0007O4-LV
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 05:17:55 +0100
Received: by mail-lb0-f175.google.com with SMTP id y2so718966lbk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2012 21:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rDIJ5s5Yy6ezWF/pahSF/1h7hUQOBhaXWisPvQ/F62M=;
	b=v8yuaEBA7xH5uvLZ6QWt4M2Byt9bXURYyn+gIdSjIxqPYFz3/MtBb2t6Wr+OpYfPbY
	/Wv/RLcWfoewF63M12Bf/He0b671hI1LE/gTYokub8Xgk5Xfdloz/1IPGs1wMmzbCPl6
	1HKpPNWdr7RMimjrizI3qWLx1WWJLI1pQwPfh0uP9+LobXofOnH5BxBJm3AhOoeQVlEp
	6nCrDNRzkDxvwKvt92MI4mxjaSt59RzW57qbQj0ibBnkyLpOMpXl13+MKWcehiRRu6Ik
	+y1DKtQu8scD0uTIUcB1WQr16S+FIWbOS8wEZv8cZeDH32lTj158nnsQEhCfg9vo/E5Q
	4VEA==
MIME-Version: 1.0
Received: by 10.152.110.229 with SMTP id id5mr32433477lab.36.1351656256456;
	Tue, 30 Oct 2012 21:04:16 -0700 (PDT)
Received: by 10.112.28.8 with HTTP; Tue, 30 Oct 2012 21:04:16 -0700 (PDT)
In-Reply-To: <k6o4kb$vca$1@ger.gmane.org>
References: <CAMQ5J2a8zLVVDPNw6vHhgsQ1pRhz_QdqaJJz7U_aQv2MwEg5zQ@mail.gmail.com>
	<CAMQ5J2aXaBZg3k3Guj=B+KgdKnf_Px3OmKu8C5oKmyiwdG7AFw@mail.gmail.com>
	<1514371.ACA88Gs2zU@helios> <k6o4kb$vca$1@ger.gmane.org>
Date: Wed, 31 Oct 2012 09:34:16 +0530
Message-ID: <CAMQ5J2avhf=1urHNUXr+d+GyYOAkffh0bJ7dfbiyRN7BBi7N9g@mail.gmail.com>
From: RaNgErS <rangers.av@gmail.com>
To: koen@dominion.thruhere.net
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Kernal build errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2012 04:17:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Done the same. It results in some more errors. Here the errors pasted from
log .


 Downloading
file:/home/user/oe/build/tmp/deploy/eglibc/ipk/armv7a/xserver-xorg_1.9.4-r19.0.9_armv7a.ipk.
| xserver-xorg: unsatisfied recommendation for xserver-security-policy

| Downloading
file:/home/user/oe/build/tmp/deploy/eglibc/ipk/beagleboard/task-user-demo_1.0-r16.9_beagleboard.ipk.
| package libtinfo5 suggests installing ncurses-terminfo
| package vim suggests installing diffutils
| task-distro-base: unsatisfied recommendation for kernel-module-vfat
| task-distro-base: unsatisfied recommendation for kernel-module-ext2
| task-distro-base: unsatisfied recommendation for kernel-module-ext3
| task-distro-base: unsatisfied recommendation for kernel-module-af-packet
| task-base-kernel26: unsatisfied recommendation for kernel-module-nls-utf8
| task-base-kernel26: unsatisfied recommendation for kernel-module-input
| task-base-kernel26: unsatisfied recommendation for kernel-module-uinput
| task-base-kernel26: unsatisfied recommendation for kernel-module-rtc-dev
| task-base-kernel26: unsatisfied recommendation for kernel-module-rtc-proc
| task-base-kernel26: unsatisfied recommendation for kernel-module-rtc-sysfs
| task-base-kernel26: unsatisfied recommendation for
kernel-module-rtc-sa1100
| task-base-kernel26: unsatisfied recommendation for kernel-module-unix
| task-base-alsa: unsatisfied recommendation for kernel-module-snd-mixer-oss
| task-base-alsa: unsatisfied recommendation for kernel-module-snd-pcm-oss
| task-base-vfat: unsatisfied recommendation for kernel-module-msdos
| task-base-vfat: unsatisfied recommendation for kernel-module-vfat
| task-base-vfat: unsatisfied recommendation for kernel-module-nls-iso8859-1
| task-base-vfat: unsatisfied recommendation for kernel-module-nls-cp437
| task-base-usbgadget: unsatisfied recommendation for
kernel-module-pxa27x_udc
| task-base-usbgadget: unsatisfied recommendation for kernel-module-gadgetfs
| task-base-usbgadget: unsatisfied recommendation for
kernel-module-g-file-storage
| task-base-usbgadget: unsatisfied recommendation for kernel-module-g-serial
| task-base-usbhost: unsatisfied recommendation for kernel-module-uhci-hcd
| task-base-usbhost: unsatisfied recommendation for kernel-module-ohci-hcd
| task-base-usbhost: unsatisfied recommendation for kernel-module-ehci-hcd
| task-base-usbhost: unsatisfied recommendation for kernel-module-usbcore
| task-base-usbhost: unsatisfied recommendation for kernel-module-usbhid
| task-base-usbhost: unsatisfied recommendation for kernel-module-usbnet
| task-base-usbhost: unsatisfied recommendation for kernel-module-sd-mod
| task-base-usbhost: unsatisfied recommendation for kernel-module-scsi-mod
| task-base-usbhost: unsatisfied recommendation for kernel-module-usbmouse
| task-base-usbhost: unsatisfied recommendation for kernel-module-mousedev
| task-base-usbhost: unsatisfied recommendation for
kernel-module-usb-storage
| task-base-usbhost: unsatisfied recommendation for kernel-module-asix
| task-base-usbhost: unsatisfied recommendation for kernel-module-pegasus
| task-base-nfs: unsatisfied recommendation for kernel-module-nfs
| task-base-smbfs: unsatisfied recommendation for kernel-module-smbfs
| task-base-wifi: unsatisfied recommendation for
kernel-module-ieee80211-crypt
| task-base-wifi: unsatisfied recommendation for
kernel-module-ieee80211-crypt-ccmp
| task-base-wifi: unsatisfied recommendation for
kernel-module-ieee80211-crypt-tkip
| task-base-wifi: unsatisfied recommendation for
kernel-module-ieee80211-crypt-wep
| task-base-wifi: unsatisfied recommendation for kernel-module-ecb
| task-base-wifi: unsatisfied recommendation for kernel-module-arc4
| task-base-wifi: unsatisfied recommendation for kernel-module-crypto_algapi
| task-base-wifi: unsatisfied recommendation for kernel-module-cryptomgr
| task-base-wifi: unsatisfied recommendation for kernel-module-michael-mic
| task-base-wifi: unsatisfied recommendation for kernel-module-aes
| task-base-bluetooth: unsatisfied recommendation for
kernel-module-bluetooth
| task-base-bluetooth: unsatisfied recommendation for kernel-module-l2cap
| task-base-bluetooth: unsatisfied recommendation for kernel-module-hci-vhci
| task-base-bluetooth: unsatisfied recommendation for kernel-module-hci-uart
| task-base-bluetooth: unsatisfied recommendation for kernel-module-sco
| task-base-bluetooth: unsatisfied recommendation for kernel-module-btusb
| task-base-bluetooth: unsatisfied recommendation for kernel-module-hci-usb
| gpe-shield: unsatisfied recommendation for kernel-module-ipt-state
| libcurl4: unsatisfied recommendation for curl-certs
| boost: unsatisfied recommendation for boost-test-exec-monitor
| boost: unsatisfied recommendation for boost-thread-mt


 Downloading
file:/home/user/oe/build/tmp/deploy/eglibc/ipk/armv7a/qt4-x11-free_4.7.3-r28.0.9_armv7a.ipk.
| qt4-x11-free: unsatisfied recommendation for libqtassistantclient4
| qt4-x11-free: unsatisfied recommendation for libqtopengl4
| qt4-x11-free: unsatisfied recommendation for libqtuitools4
| qt4-x11-free: unsatisfied recommendation for libqtwebkit4
| qt4-x11-free: unsatisfied recommendation for libqtopenvg4
| qt4-x11-free: unsatisfied recommendation for libqtmediaservices4
| qt4-x11-free: unsatisfied recommendation for libqtpvrqwswsegl4
| qt4-fonts: unsatisfied recommendation for qt4-fonts-ttf-vera
| qt4-fonts: unsatisfied recommendation for qt4-fonts-ttf-dejavu
| qt4-fonts: unsatisfied recommendation for qt4-fonts-pfa
| qt4-fonts: unsatisfied recommendation for qt4-fonts-pfb
| qt4-fonts: unsatisfied recommendation for qt4-fonts-qpf
| qt4-x11-free: unsatisfied recommendation for qt4-fonts-ttf-vera
| qt4-x11-free: unsatisfied recommendation for qt4-fonts-ttf-dejavu
| qt4-x11-free: unsatisfied recommendation for qt4-fonts-pfa
| qt4-x11-free: unsatisfied recommendation for qt4-fonts-pfb
| qt4-x11-free: unsatisfied recommendation for qt4-fonts-qpf
| qt4-x11-free: unsatisfied recommendation for qt4-makeqpf

* extract_archive: Cannot create symlink from ./var/run to 'volatile/run':
File exists.
|  * resolve_conffiles: Existing conffile
/home/user/oe/build/tmp/rootfs/user-demo-image/etc/device_table is
different from the conffile in the new package. The new conffile will be
placed at
/home/user/oe/build/tmp/rootfs/user-demo-image/etc/device_table-opkg.


 /home/user/oe/build/tmp/work/beagleboard-angstrom-linux-gnueabi/user-demo-image-1.0-r0/temp/run.do_rootfs.18229:
line 336: mkfs.jffs2: command not found
| ERROR: Function do_rootfs failed
NOTE: package user-demo-image-1.0-r0: task do_rootfs: Failed




On Tue, Oct 30, 2012 at 2:24 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 29-10-12 10:43, Paul Eggleton schreef:
> > On Monday 29 October 2012 13:21:50 RaNgErS wrote:
> >> I am very new to this stuff, and I tried to build an image i got some
> >> errors which are not solved even i tried for a whole week. It is from
> >> the kernal side or sth. i am attaching the log file obtained .
> >
> > The module packages specified don't exist, which means either the
> > functionality they would have included is compiled into the kernel
> > (option value = "y") or they weren't enabled at all (option value="n").
> > So you should check your kernel configuration.
> >
> > If they are enabled but you do genuinely want these to be compiled into
> > the kernel rather than as modules, the task-picop-demo recipe needs to be
> > changed to use RRECOMMENDS rather than RDEPENDS to bring in the kernel
> > modules only if they exist; that will fix the error.
>
> RDEPENDSing on kernel-modules is not allowed anyway, you should always use
> RRECOMENDS for those.
>
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQj5XPMkyGM64RGpERAlrHAJ9aLi10oRaK39QTnitb5+uutMZRLQCgh5Uq
> PMsZo20st543harAPvScJzU=
> =G4PF
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
     RaNgErS
THIS IS STRANGE

