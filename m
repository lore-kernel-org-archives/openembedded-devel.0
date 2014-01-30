Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF6E6E9AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 17:59:46 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md12so3412337pbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 09:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-type;
	bh=l4sJq+55z05nDPmD1Xx2Oi+WfNNkmwj5hoZ0F3oJdpo=;
	b=NukUEeYjuCNnsxNX2FRAuFSYQUr8mOSscTFuN36T5cKo4l2DUJJPAaZ/zIba6hH2+w
	mz+yYcWGXd7M3KDh8TlpAXBtk1gGrypU6PC4EbxC4jSwxKV7j1NT3s2OnyCWnFq9IpC5
	baCpZ5oQXqNrHAV95L/t25Mtq8O8z00EjHw/vJQuI4UmyupMVZEehcWT+ld0HbK4/Jp5
	znO2c0CiaUCUuGMWuU4kbakCWlHItRT39kZn5FIilkh+KI4Zyv02yU9cp7ZTC2hWN/9W
	M7sk0EZ9VimD/0JG1yQcB/EXa7PqjyzXmDlTwAfBE6BRN+TUATPUAlqJWh//fu8Bu46u
	5iMA==
X-Received: by 10.68.226.70 with SMTP id rq6mr15850437pbc.107.1391104787543;
	Thu, 30 Jan 2014 09:59:47 -0800 (PST)
Received: from leo.localnet ([66.129.239.12])
	by mx.google.com with ESMTPSA id g6sm46873667pat.2.2014.01.30.09.59.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jan 2014 09:59:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: Ridish RA <Ridish.RA@lntinfotech.com>
Date: Thu, 30 Jan 2014 09:59:43 -0800
Message-ID: <1761269.AxNLyBI4PD@leo>
X-Face: (*D:+-|[O9m:a&dKxg#R`m^Nxy<HmNPV<Ic-_>RMPm0'o70t~39kUjcE\?l`>41l^%&x; O
	ss*RIK.m#<6OwX.R&K={4[\RYyqeUgI^7G0BRJfLXVkrEjSlX5rk\rOt"ur?`%"2}`hDBt
	QHQ|<@r6-hq"([T&r02ayw^tEXBwsh6g%qt!Q?)*H$OE6mk^BUm30s`G[u:_wi&vIUh&Lh
	L_.\+; 0Q:nB(8TJq\bWseix)aav+[*-wMDT5+55W^jS%u-J{Hv)&lSoaU^m_+*>]"
User-Agent: KMail/4.12.1 (Linux/3.12.9-1-ARCH; KDE/4.12.1; x86_64; ; )
In-Reply-To: <EFF5E6A1D0DAA14BA6B30C755A7B0FE13131B2C8EC@BLRINMSMBX01.bglrodc.lntinfotech.com>
References: <1391086167-31517-1-git-send-email-chase.maupin@ti.com>
	<CAMKF1spT1epjxfM1Nyi86wFCk23BAZ26zun-Ju94JkcYiXwE7A@mail.gmail.com>
	<EFF5E6A1D0DAA14BA6B30C755A7B0FE13131B2C8EC@BLRINMSMBX01.bglrodc.lntinfotech.com>
MIME-Version: 1.0
Cc: KalyanKumar Nagabhirava <KalyanKumar.Nagabhirava@lntinfotech.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Errors when using populate_sdk - has anyone encountered this before?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2014 17:59:48 -0000
X-Groupsio-MsgNum: 47964
Content-Type: multipart/signed; boundary="nextPart21747464.68eFLbGQJA";
	micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart21747464.68eFLbGQJA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thursday, January 30, 2014 10:55:39 PM Ridish RA wrote:
> Hi Khem Raj,
>=20
> Please do find the build configuration below:
>=20
> ridish@sanjay-Precision-M4500:~/RDK-RI-NICO-2/build-qemux86$ bitbake
> rdk-generic-image -c populate_sdk Loading cache: 100%
> |####################################################################=
######
> #####################################################################=
###|
> ETA:  00:00:00 Loaded 1942 entries from dependency cache.
> Parsing recipes: 100%
> |####################################################################=
######
> #####################################################################=
#|
> Time: 00:00:08 Parsing of 1546 .bb files complete (1543 cached, 3 par=
sed).
> 1946 targets, 107 skipped, 0 masked, 0 errors. NOTE: Resolving any mi=
ssing
> task queue dependencies
> NOTE: multiple providers are available for eglibc (eglibc,
> external-linaro-toolchain) NOTE: consider defining a PREFERRED_PROVID=
ER
> entry to match eglibc NOTE: multiple providers are available for jpeg=

> (jpeg, libjpeg-turbo) NOTE: consider defining a PREFERRED_PROVIDER en=
try to
> match jpeg


you also need to pin egibc and jpeg something like below

PREFERRED_PROVIDER_eglibc =3D "eglibc"
PREFERRED_PROVIDER_jpeg =3D "jpeg"

in one of your distro conf files. IMO look at how angstrom is doing it


>=20
> Build Configuration:
> BB_VERSION        =3D "1.20.0"
> BUILD_SYS         =3D "i686-linux"
> NATIVELSBSTRING   =3D "Ubuntu-12.04"
> TARGET_SYS        =3D "i586-rdk-linux"
> MACHINE           =3D "qemux86"
> DISTRO            =3D "rdk"
> DISTRO_VERSION    =3D "0.1+snapshot-20140130"
> TUNE_FEATURES     =3D "m32 i586"
> TARGET_FPU        =3D ""
> meta              =3D "(nobranch):198623d80d31f19c963e61d03cbcb12dd31=
8dfdf"

> toolchain-layer
> meta-multimedia
> meta-oe
> meta-networking
> meta-ruby         =3D "(nobranch):fdf74512fc4e8514ad74458601adb96916f=
7cf72"


> meta-linaro
> meta-linaro-toolchain =3D
> "(nobranch):8aaf10d8dda34bc02d4ef62d0501b83603b6f827" meta-rdk       =
   =3D
> "contrib/ndec/rdk-ri:b0bcf359aed07d86a2175df01d2bcae069e7c867" meta-q=
t5   =20
>      =3D "(nobranch):cefaba69a785c5221463f0eb496b749d5ddf8a5a" meta-r=
dk-cpc =20
>    =3D "(nobranch):80e239735dd5f1e08026d66df6b25b0f5a782bfb"

OK you seem to be on dora branches of all repos.  Follow my last email =
and set

QEMUVER =3D "1.5.0" with other things I suggested


>=20
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Command Error: exit status: 1  Output:
> Applying patch relocatable_sdk.patch
> can't find file to patch at input line 13
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
>=20
> |Upstream-Status: Inappropriate [SDK specific]
> |
> |In order to be able to change the dynamic loader path when relocatin=
g
> |binaries, the interp section has to be made big enough to accomodate=

> |the new path (4096 is the maximum path length in Linux).
> |
> |Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> |
> |Index: qemu-1.4.0/ldscripts/i386.ld
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> |--- qemu-1.4.0.orig/ldscripts/i386.ld  2013-02-15 15:05:35.000000000=
 -0800
> |+++ qemu-1.4.0/ldscripts/i386.ld       2013-02-28 22:55:36.138816418=
 -0800
>=20
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> can't find file to patch at input line 26
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
>=20
> |Index: qemu-1.4.0/ldscripts/x86_64.ld
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> |--- qemu-1.4.0.orig/ldscripts/x86_64.ld        2013-02-15
> |15:05:35.000000000 -0800 +++ qemu-1.4.0/ldscripts/x86_64.ld     2013=
=2D02-28
> |22:55:36.138816418 -0800
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> Patch relocatable_sdk.patch does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in:
> /home/ridish/RDK-RI-NICO-2/build-qemux86/tmp/work/i686-nativesdk-rdks=
dk-lin
> ux/nativesdk-qemu/1.6.0+gitAUTOINC+0706f7c85b-r2/temp/log.do_patch.21=
651
> ERROR: Task 1574
> (virtual:nativesdk:/home/ridish/RDK-RI-NICO-2/meta-linaro/meta-linaro=
/recip
> es-devtools/qemu/qemu_git.bb, do_patch) failed with exit code '1'
>=20
>=20
> Thanks,
> Ridish
> Ph: +1 (510)-434-6793
> ________________________________________
> From: Khem Raj [raj.khem@gmail.com]
> Sent: Thursday, January 30, 2014 8:53 AM
> To: Dorairaj, Sanjay
> Cc: openembedded-devel@lists.openembedded.org; KalyanKumar Nagabhirav=
a;
> Ridish RA; Nicolas Dechesne Subject: Re: Errors when using populate_s=
dk -
> has anyone encountered this before?
>=20
> Hi Sanjay
>=20
> On Thu, Jan 30, 2014 at 5:35 AM, Dorairaj, Sanjay
>=20
> <Sanjay_Dorairaj@cable.comcast.com> wrote:
> > Hi All,
> >=20
> > We are getting build error when using populate_sdk for our RDK buil=
ds. Has
> > anyone seen this?
>=20
> Would be nice if you included you Build Configuration that bitbake
> prints at beginning of build step
>=20
> > For generating sdk we use  "bitbake -c populate_sdk rdk-generic-ima=
ge"
> > command ,  we are getting below error:
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > =3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > NOTE: Applying patch 'relocatable_sdk.patch'
> > (../meta-linaro/meta-linaro/recipes-devtools/qemu/files/relocatable=
_sdk.pa
> > t
> > ch)
>=20
> OK so it seems you have meta-linaro in the layer mix. Besides
> toolchain it provided many other recipes, qemu is one of them
> and I am not sure if you are interested to use qemu also from
> meta-linaro, if you are then some of Linaro developers manitnaining
> meta-linaro might know better. It could just be an oversight. But you=

> could pin to use OE-Core qemu
>=20
> so in your distro.conf or local.conf add
>=20
> PREFERRED_PROVIDER_qemu-native =3D "qemu-native"
> PREFERRED_VERSION_qemu =3D "${QEMUVER}"
> PREFERRED_VERSION_qemu-native =3D "${QEMUVER}"
> PREFERRED_VERSION_nativesdk-qemu =3D "${QEMUVER}"
>=20
> where QEMUVER =3D "1.5.0" if you are on dora and "1.7.0" if you are o=
n
> master branch of OE-Core layer
>=20
> > ERROR: Command Error: exit status: 1  Output:
> > Applying patch relocatable_sdk.patch
> > can't find file to patch at input line 13
> > Perhaps you used the wrong -p or --strip option?
> > The text leading up to this was:
> > --------------------------
> >=20
> > |Upstream-Status: Inappropriate [SDK specific]
> > |
> > |In order to be able to change the dynamic loader path when relocat=
ing
> > |binaries, the interp section has to be made big enough to accomoda=
te
> > |the new path (4096 is the maximum path length in Linux).
> > |
> > |Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > |
> > |Index: qemu-1.4.0/ldscripts/i386.ld
> > |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > |--- qemu-1.4.0.orig/ldscripts/i386.ld  2013-02-15 15:05:35.0000000=
00
> > |-0800
> > |+++ qemu-1.4.0/ldscripts/i386.ld       2013-02-28 22:55:36.1388164=
18
> > |-0800
> >=20
> > --------------------------
> > No file to patch.  Skipping patch.
> > 1 out of 1 hunk ignored
> > can't find file to patch at input line 26
> > Perhaps you used the wrong -p or --strip option?
> > The text leading up to this was:
> > --------------------------
> >=20
> > |Index: qemu-1.4.0/ldscripts/x86_64.ld
> > |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > |--- qemu-1.4.0.orig/ldscripts/x86_64.ld        2013-02-15
> >=20
> > 15:05:35.000000000 -0800
> >=20
> > |+++ qemu-1.4.0/ldscripts/x86_64.ld     2013-02-28 22:55:36.1388164=
18
> > |-0800
> >=20
> > --------------------------
> > No file to patch.  Skipping patch.
> > 1 out of 1 hunk ignored
> > Patch relocatable_sdk.patch does not apply (enforce with -f)
> > ERROR: Function failed: patch_do_patch
> > ERROR: Logfile of failure stored in:
> > /home/ridish/RDK-RI-NICO-2/build-qemux86/tmp/work/i686-nativesdk-rd=
ksdk-li
> > n
> > ux/nativesdk-qemu/1.6.0+gitAUTOINC+0169c51155-r2/temp/log.do_patch.=
15188
> > ERROR: Task 1574
> > (virtual:nativesdk:/home/ridish/RDK-RI-NICO-2/meta-linaro/meta-lina=
ro/reci
> > p
> > es-devtools/qemu/qemu_git.bb, do_patch) failed with exit code '1'
> >=20
> >=20
> > Regards,
> >=20
> >=20
> > Sanjay
>=20
> The contents of this e-mail and any attachment(s) may contain confide=
ntial
> or privileged information for the intended recipient(s). Unintended
> recipients are prohibited from taking action on the basis of informat=
ion in
> this e-mail and  using or disseminating the information,  and must no=
tify
> the sender and delete it from their system. L&T Infotech will not acc=
ept
> responsibility or liability for the accuracy or completeness of, or t=
he
> presence of any virus or disabling code in this e-mail"

=2D-=20
=2DKhem

--nextPart21747464.68eFLbGQJA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEABECAAYFAlLqkxUACgkQuwUzVZGdMxRx5gCfbNTQx3zMDgJ5jQNG/nPJ0ijZ
0TwAniMwJYtJbjF4zEs23pRLewns0/ZB
=AE+J
-----END PGP SIGNATURE-----

--nextPart21747464.68eFLbGQJA--
