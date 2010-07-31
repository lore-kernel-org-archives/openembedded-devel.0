Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dangbinghoo@gmail.com>) id 1Of1Al-0000P7-Ho
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 03:47:39 +0200
Received: by gyd8 with SMTP id 8so894903gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 18:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=KPFv96B8ZSQWq5bxaDwyS4oZX6BAp4FrG9XkwWlxtHo=;
	b=qEJt6DGM7fnRORD6kVn/LfvWWBsL+XcsVHbvJeZqDA3SRsNNDLg+mznHjD8Hfi2Gr3
	jRIFjjzViPvFgb9yAyb6VfRhUo7gh0xHwZS1qkmI7WGMAtYG6bz3l/KTCx5NaGEcwRP0
	LlAeCeigF4FuNnFoMRDqO/8qHAklGPwtaWJW0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=bDEJClNRVdvFOSjbNW2odeRveDTcZhi6D8d7aCboWkytF+0RXXjDzwWpavcgBuSxgA
	AVbRhLFm80pNctYpvVlFx5vihTflm2C820yQ5Iosl6YeqHp41Y6yPvU7oWgs1KDVR0Cz
	VIhuiJIiBUlrf5pV28oM2fStmGQ2LzRpX/KaI=
MIME-Version: 1.0
Received: by 10.150.217.11 with SMTP id p11mr4363455ybg.31.1280540833238; Fri, 
	30 Jul 2010 18:47:13 -0700 (PDT)
Received: by 10.150.227.11 with HTTP; Fri, 30 Jul 2010 18:47:13 -0700 (PDT)
Date: Sat, 31 Jul 2010 09:47:13 +0800
Message-ID: <AANLkTimMJc-_V84t-oKB73Zzbo8FUYeVJMRJeF4rJLL6@mail.gmail.com>
From: Binghoo Dang <dangbinghoo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: dangbinghoo@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: translating OE manual into Chinese
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
X-List-Received-Date: Sat, 31 Jul 2010 01:47:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks Holger Freyther,
I'm from China mainland , so I use simplified Chinese, I'm now
translating chapter 8, almost complete. When the work done, I will
contact you to commit the translation.


On Sat, Jul 31, 2010 at 5:42 AM,
<openembedded-devel-request@lists.openembedded.org> wrote:
> Send Openembedded-devel mailing list submissions to
> =A0 =A0 =A0 =A0openembedded-devel@lists.openembedded.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
> =A0 =A0 =A0 =A0http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openem=
bedded-devel
>
> or, via email, send a message with subject or body 'help' to
> =A0 =A0 =A0 =A0openembedded-devel-request@lists.openembedded.org
>
> You can reach the person managing the list at
> =A0 =A0 =A0 =A0openembedded-devel-owner@lists.openembedded.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Openembedded-devel digest..."
>
>
> Today's Topics:
>
> =A0 1. [PATCH 08/10] xserver-common: xilinx virtex support
> =A0 =A0 =A0(Adrian Alonso)
> =A0 2. [PATCH 07/10] initscripts: module id xilinx virtex (Adrian Alonso)
> =A0 3. [PATCH 10/10] xserver-kdrive-common: xilinx virtex5 support
> =A0 =A0 =A0(Adrian Alonso)
> =A0 4. [PATCH 09/10] xorg-xserver-conf: virtex5 machine support
> =A0 =A0 =A0(Adrian Alonso)
> =A0 5. Re: [PATCH] bitbake.conf, cross.bbclass: Make multi-machine
> =A0 =A0 =A0toolchains to co-exist (Khem Raj)
> =A0 6. Re: translating OE manual into Chinese (Holger Freyther)
> =A0 7. Re: [PATCH] Add a waf bitbake class. (Koen Kooi) (AJ ONeal)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Fri, 30 Jul 2010 10:42:33 -0500
> From: Adrian Alonso <aalonso00@gmail.com>
> Subject: [oe] [PATCH 08/10] xserver-common: xilinx virtex support
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <1280504555-3633-8-git-send-email-aalonso00@gmail.com>
>
> * Add xilinx virtex platforms support
> * Set xserver args
> * Bump PR
>
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
> =A0recipes/xserver-common/files/Xserver-virtex.patch | =A0 14 +++++++++++=
+++
> =A0recipes/xserver-common/xserver-common_1.33.bb =A0 =A0 | =A0 =A05 +++--
> =A02 files changed, 17 insertions(+), 2 deletions(-)
> =A0create mode 100644 recipes/xserver-common/files/Xserver-virtex.patch
>
> diff --git a/recipes/xserver-common/files/Xserver-virtex.patch b/recipes/=
xserver-common/files/Xserver-virtex.patch
> new file mode 100644
> index 0000000..c7d6cc2
> --- /dev/null
> +++ b/recipes/xserver-common/files/Xserver-virtex.patch
> @@ -0,0 +1,14 @@
> +Index: xserver-common-1.13/X11/xserver-common
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- xserver-common-1.13.orig/X11/xserver-common
> ++++ xserver-common-1.13/X11/xserver-common
> +@@ -181,6 +181,9 @@ else
> + =A0 =A0 =A0 =A0 =A0 =A0 # this is to rotate X display properly, tested =
with display TX09D71VM1CCA
> + =A0 =A0 =A0 =A0 =A0 =A0 ronetix*pm9261* =A0| ronetix*pm9263*)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARGS=3D"$ARGS -screen 240/54x320/81@=
90x16" ;;
> ++ =A0 =A0 =A0 =A0"Xilinx Virtex"*)
> ++ =A0 =A0 =A0 =A0 =A0 =A0DPI=3D"96"
> ++ =A0 =A0 =A0 =A0 =A0 =A0ARGS=3D"$ARGS" ;;
> + =A0 =A0 =A0 =A0 # This is a fallback for PCs
> + =A0 =A0 =A0 =A0 "")
> + =A0 =A0 =A0 =A0 =A0 =A0 if [ -f $BINDIR/Xvesa ]; then
> diff --git a/recipes/xserver-common/xserver-common_1.33.bb b/recipes/xser=
ver-common/xserver-common_1.33.bb
> index cb644a4..71fa231 100644
> --- a/recipes/xserver-common/xserver-common_1.33.bb
> +++ b/recipes/xserver-common/xserver-common_1.33.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Common X11 scripts and support files"
> =A0LICENSE =3D "GPL"
> =A0SECTION =3D "x11"
> =A0RDEPENDS_${PN} =3D "xmodmap xrandr xdpyinfo"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0PACKAGE_ARCH =3D "all"
> =A0DEFAULT_PREFERENCE =3D "-1"
> @@ -19,7 +19,8 @@ SRC_URI[sha256sum] =3D "4576ccca80730f1860a273df38b9f91=
7cf906eca9865e108d76fc5460e
> =A0SRC_URI_append =3D " file://loop.patch;striplevel=3D3 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://rgba.diff \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://setDPI.sh \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://89xdgautostart.sh"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://89xdgautostart.sh \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://Xserver-virtex.patch"
>
> =A0SRC_URI_append_angstrom =3D " file://xtscal-fix.patch "
> =A0RDEPENDS_${PN}_append_angstrom =3D " tslib-calibrate "
> --
> 1.7.2
>
>
>
>
> ------------------------------
>
> Message: 2
> Date: Fri, 30 Jul 2010 10:42:32 -0500
> From: Adrian Alonso <aalonso00@gmail.com>
> Subject: [oe] [PATCH 07/10] initscripts: module id xilinx virtex
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <1280504555-3633-7-git-send-email-aalonso00@gmail.com>
>
> * Add machine_id support for xilinx virtex platforms
> =A0used in xserver-common for args settings
> * Bump PR
>
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
> =A0recipes/initscripts/files/functions =A0 =A0| =A0 =A07 ++++++-
> =A0recipes/initscripts/initscripts_1.0.bb | =A0 =A02 +-
> =A02 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/initscripts/files/functions b/recipes/initscripts/fi=
les/functions
> index fb9a914..3e7d687 100644
> --- a/recipes/initscripts/files/functions
> +++ b/recipes/initscripts/files/functions
> @@ -5,7 +5,12 @@
> =A0#
>
> =A0machine_id() { =A0 =A0 =A0 =A0 # return the machine ID
> - =A0 =A0awk 'BEGIN { FS=3D": " } /Hardware/ { gsub(" ", "_", $2); print =
tolower($2) } ' </proc/cpuinfo
> + =A0 =A0id=3D`awk 'BEGIN { FS=3D": " } /Hardware/ { gsub(" ", "_", $2); =
print tolower($2) } ' </proc/cpuinfo`
> + =A0 =A0if [ -n "$id" ]; then
> + =A0 =A0 =A0 =A0echo -n "${id}"
> + =A0 =A0else
> + =A0 =A0 =A0 =A0awk 'BEGIN { FS=3D": " } /platform/ { gsub(" ", "_", $2)=
; print tolower($2) } ' </proc/cpuinfo
> + =A0 =A0fi
> =A0}
>
> =A0killproc() { =A0 =A0 =A0 =A0 =A0 # kill the named process(es)
> diff --git a/recipes/initscripts/initscripts_1.0.bb b/recipes/initscripts=
/initscripts_1.0.bb
> index 1b0a94c..38fe85e 100644
> --- a/recipes/initscripts/initscripts_1.0.bb
> +++ b/recipes/initscripts/initscripts_1.0.bb
> @@ -4,7 +4,7 @@ PRIORITY =3D "required"
> =A0DEPENDS =3D "makedevs"
> =A0RDEPENDS_${PN} =3D "makedevs"
> =A0LICENSE =3D "GPL"
> -PR =3D "r121"
> +PR =3D "r122"
>
> =A0SRC_URI =3D "file://functions \
> =A0 =A0 =A0 =A0 =A0 =A0file://halt \
> --
> 1.7.2
>
>
>
>
> ------------------------------
>
> Message: 3
> Date: Fri, 30 Jul 2010 10:42:35 -0500
> From: Adrian Alonso <aalonso00@gmail.com>
> Subject: [oe] [PATCH 10/10] xserver-kdrive-common: xilinx virtex5
> =A0 =A0 =A0 =A0support
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <1280504555-3633-10-git-send-email-aalonso00@gmail.com>
>
> * Add Xserver support for virtex5 board
> * Update module id for Xilinx platforms, xserver
> =A0arguments are setup at runtime by getting
> =A0module id info from /proc/cpuinfo
> * Increase PR
>
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
> =A0.../xserver-kdrive-common/Xserver =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A09 ++++++++-
> =A0.../xserver-kdrive-common_0.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A02 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver =
b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
> index 347b005..375b787 100644
> --- a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
> +++ b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
> @@ -34,7 +34,12 @@ module_id() {
> =A0 =A0 # grep "Module ID" /proc/hal/assets | sed "s/.*://"
> =A0 =A0 ## used to read from /proc/hal/model, but that is removed in 2.6
> =A0 =A0 # echo ' iPAQ' `cat /proc/hal/model`
> - =A0 =A0awk 'BEGIN { FS=3D": " } /Hardware/ { print $2 } ' </proc/cpuinf=
o
> + =A0 =A0id=3D`awk 'BEGIN { FS=3D": " } /Hardware/ { print $2 } ' </proc/=
cpuinfo`
> + =A0 =A0 =A0 if [ -n "$id" ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n "${id}"
> + =A0 =A0else
> + =A0 =A0 =A0 =A0awk 'BEGIN { FS=3D": " } /platform/ { print $2 } ' </pro=
c/cpuinfo
> + =A0 =A0 =A0 fi
> =A0}
>
> =A0export USER=3Droot
> @@ -171,6 +176,8 @@ case `module_id` in
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if [ "$XSERVER" =3D "/usr/bin/Xorg" ];=
then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARGS=3D""
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi;; #TODO: handle kdrive
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Xilinx Virtex"*)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARGS=3D"=
$ARGS $PPM" ;;
> =A0 =A0 =A0 =A0 *)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # It is a device we do not know about, in=
 which case we force
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # kdrive to use the current framebuffer g=
eometry -- otherwise
> diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb b=
/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
> index 52a88b8..04a3f13 100644
> --- a/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
> +++ b/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Common X11 scripts"
> =A0LICENSE =3D "GPL"
> =A0SECTION =3D "x11"
> -PR =3D "r45"
> +PR =3D "r46"
>
> =A0SRC_URI =3D "\
> =A0 file://Xdefaults \
> --
> 1.7.2
>
>
>
>
> ------------------------------
>
> Message: 4
> Date: Fri, 30 Jul 2010 10:42:34 -0500
> From: Adrian Alonso <aalonso00@gmail.com>
> Subject: [oe] [PATCH 09/10] xorg-xserver-conf: virtex5 machine support
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <1280504555-3633-9-git-send-email-aalonso00@gmail.com>
>
> * Add xorg conf for virtex5 family targets
> * Increase PR
>
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
> =A0.../xserver-xorg-conf/xilinx-virtex5/xorg.conf =A0 =A0 | =A0 38 ++++++=
++++++++++++++
> =A0recipes/xorg-xserver/xserver-xorg-conf_0.1.bb =A0 =A0 =A0| =A0 =A02 +-
> =A02 files changed, 39 insertions(+), 1 deletions(-)
> =A0create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/xilinx-virte=
x5/xorg.conf
>
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf/xilinx-virtex5/xorg.c=
onf b/recipes/xorg-xserver/xserver-xorg-conf/xilinx-virtex5/xorg.conf
> new file mode 100644
> index 0000000..61f0f9f
> --- /dev/null
> +++ b/recipes/xorg-xserver/xserver-xorg-conf/xilinx-virtex5/xorg.conf
> @@ -0,0 +1,38 @@
> +# Xorg conf file for Xilinx platforms
> +Section "Monitor"
> + =A0 =A0 =A0 Identifier "LCD Panel"
> +EndSection
> +
> +Section "Device"
> + =A0 =A0Identifier =A0"Xilinx frame buffer"
> + =A0 =A0Driver =A0 =A0 =A0"fbdev"
> +EndSection
> +
> +Section "Screen"
> + =A0 =A0Identifier =A0"Default Screen"
> + =A0 =A0Device =A0 =A0 =A0"Xilinx frame buffer"
> + =A0 =A0Monitor =A0 =A0 "LCD Panel"
> + =A0 =A0 =A0 SubSection "Display"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 Depth =A0 24
> + =A0 =A0 =A0 =A0Modes =A0 "640x480"
> + =A0 =A0 =A0 EndSubSection
> +EndSection
> +
> +Section "InputDevice"
> + =A0 =A0Identifier =A0"Keyboard"
> + =A0 =A0Driver =A0 =A0 =A0"kbd"
> +EndSection
> +
> +Section "InputDevice"
> + =A0 =A0Identifier =A0"Mouse"
> + =A0 =A0Driver =A0 =A0 =A0"mouse"
> + =A0 =A0Option =A0 =A0 =A0"protocol" "auto"
> + =A0 =A0Option =A0 =A0 =A0"device" "/dev/input/mice"
> +EndSection
> +
> +Section "ServerLayout"
> + =A0 =A0Identifier =A0"Default Layout"
> + =A0 =A0Screen =A0 =A0 =A00 "Default Screen" 0 0
> + =A0 =A0InputDevice "Keyboard"
> + =A0 =A0InputDevice "Mouse"
> +EndSection
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg=
-xserver/xserver-xorg-conf_0.1.bb
> index 976dfac..c3dbb01 100644
> --- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
> +++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
> @@ -1,5 +1,5 @@
> =A0DESCRIPTION =3D "Machine specific xorg.conf files"
> -PR =3D "r29"
> +PR =3D "r30"
>
> =A0SRC_URI =3D "file://xorg.conf"
>
> --
> 1.7.2
>
>
>
>
> ------------------------------
>
> Message: 5
> Date: Fri, 30 Jul 2010 08:42:55 -0700
> From: Khem Raj <raj.khem@gmail.com>
> Subject: Re: [oe] [PATCH] bitbake.conf, cross.bbclass: Make
> =A0 =A0 =A0 =A0multi-machine =A0 toolchains to co-exist
> To: openembedded-devel@lists.openembedded.org
> Message-ID:
> =A0 =A0 =A0 =A0<AANLkTinaX2p1LD6SbY31Fgn0kZCEK3ALKKdg5P-GF=3D4y@mail.gmai=
l.com>
> Content-Type: text/plain; charset=3DISO-8859-1
>
> On Fri, Jul 30, 2010 at 2:01 AM, Koen Kooi <k.kooi@student.utwente.nl> wr=
ote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 30-07-10 09:42, Khem Raj wrote:
>>> From: Tom Rini <tom_rini@mentor.com>
>>>
>>> the patch Tom sent has line breaks etc. this is same patch formatted fo=
r anybody to test
>>
>> MACHINE=3Dbeagleboard bitbake ffmpeg:
>>
>> | running configure fragment for nptl/sysdeps/pthread
>> | configure: error: compiler support for __thread is required
>> | ERROR: Function do_configure failed
>> NOTE: package glibc-initial-2.9-r36.3: task do_configure: Failed
>
> This is because its not finding the binutils in right place I think.
>
>>
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.5 (Darwin)
>>
>> iD8DBQFMUpTbMkyGM64RGpERAt9YAJ9baoI1zJvmEuGPj9gvrR2eSkJ5CQCeKx++
>> fLr6Le14u/zC3AU41Jj0obk=3D
>> =3DitZg
>> -----END PGP SIGNATURE-----
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>
> ------------------------------
>
> Message: 6
> Date: Sat, 31 Jul 2010 02:17:31 +0800
> From: Holger Freyther <holger+oe@freyther.de>
> Subject: Re: [oe] translating OE manual into Chinese
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <4C53173B.4070303@freyther.de>
> Content-Type: text/plain; charset=3DISO-8859-1
>
> On 07/30/2010 11:11 AM, Binghoo Dang wrote:
>> Hello,
>>
>> I'm a Chinese, and now I'm working on translating OE manual into
>> Chinese. I almost done the work. Now I want to know will OE official
>> add a link to documents webpage .
>>
>> My work is done in gedit, so in text format , I think I should commit
>> a xml docbook type format , but I could not find a nice opensource xml
>> docbook editor, what was the OE written with? And, I also put my
>> translate on my blog page, if docbook can not be accept ,may be OE can
>> add a link directly to my blog.
>
> I would be happy to check-in your translation to the OpenEmbedded
> documentation repository. Regarding the usage of an editor. I have starte=
d
> with vim based on the skeleton others have created for the bitbake manual=
.
>
> PS: When you say chinese, do you mean traditional or simplified?
>
>
>
> ------------------------------
>
> Message: 7
> Date: Fri, 30 Jul 2010 15:41:10 -0600
> From: AJ ONeal <coolaj86@gmail.com>
> Subject: Re: [oe] [PATCH] Add a waf bitbake class. (Koen Kooi)
> To: Sean_Hudson@dell.com, =A0 =A0 =A0 openembedded-devel
> =A0 =A0 =A0 =A0<openembedded-devel@lists.openembedded.org>
> Message-ID:
> =A0 =A0 =A0 =A0<AANLkTimN2subbRqO5B4CEDPAQy-gd00Z8Up7V+B-suB2@mail.gmail.=
com>
> Content-Type: text/plain; charset=3Dwindows-1252
>
> Thanks for your help, I got it working.
>
> http://blog.coolaj86.info/2010/07/26/WAF-on-OpenEmbedded
>
> AJ ONeal
>
> On Tue, Jul 27, 2010 at 10:44 AM, <Sean_Hudson@dell.com> wrote:
>
>> =A0AJ,
>>
>>
>>
>> =A0 Yes, by design, WAF is generally include with the source code. =A0(s=
ee
>> this link<http://freehackers.org/~tnagy/wafbook/index.html#_installing_w=
af_on_a_system>for reference) There is no specification to WAF to cross com=
pile, rather, it
>> will pick up the environment from the OE shell and act accordingly. =A0O=
ne
>> additional thought, in order to get the example binary into the package
>> correctly, don?t forget to add a FILES_${PN} directive to your OE recipe=
.
>>
>>
>>
>> =A0 Hope this helps!
>>
>>
>>
>> =A0 =A0 -Sean
>>
>>
>>
>> *From:* AJ ONeal [mailto:coolaj86@gmail.com]
>> *Sent:* Monday, July 26, 2010 11:12 PM
>>
>> *To:* Hudson, Sean
>> *Subject:* Re: [oe] [PATCH] Add a waf bitbake class. (Koen Kooi)
>>
>>
>>
>> I'm trying to get a Hello World example together using bitbake and WAF
>>
>>
>>
>> http://blog.coolaj86.info/2010/07/26/WAF-on-OpenEmbedded
>>
>>
>>
>> Will you please help me complete this?
>>
>>
>>
>> Is WAF supposed to be packaged with the source code?
>>
>> How do we specify that WAF should cross compile rather than regular
>> compile?
>>
>>
>>
>> Thanks,
>>
>>
>>
>> AJ ONeal
>>
>> On Thu, Jul 8, 2010 at 1:15 PM, <Sean_Hudson@dell.com> wrote:
>>
>> It's quite simple. =A0In the recipe, inherit from the waf class, and you=
're
>> good to go. =A0One caveat, I didn't see this pulled into OE by one of th=
e
>> committers, so be aware that it is not available other than through the
>> mailing list...
>>
>> Sample recipe using the waf class...
>> =A0 =A0 =A0 =A0DESCRIPTION =3D "foo"
>> =A0 =A0 =A0 =A0LICENSE =3D "GPL"
>> =A0 =A0 =A0 =A0SRC_URI =3D ""
>> =A0 =A0 =A0 =A0S =3D "${WORKDIR}/trunk"
>>
>> =A0 =A0 =A0 =A0inherit waf
>>
>> From: AJ ONeal [mailto:coolaj86@gmail.com]
>> Sent: Thursday, July 08, 2010 12:42 AM
>> To: Hudson, Sean
>> Subject: Re: [oe] [PATCH] Add a waf bitbake class. (Koen Kooi)
>>
>>
>> How would I use this patch with something like Node.js, which using waf =
for
>> compiling?
>>
>> Do you have any sample .bb files that show how this is done? Or any
>> documentation?
>>
>> AJ ONeal
>>
>>
>>
>
>
> ------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> End of Openembedded-devel Digest, Vol 48, Issue 195
> ***************************************************
>


