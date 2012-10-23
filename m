Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TQepe-00008Y-Ul; Tue, 23 Oct 2012 15:47:47 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so3190197wib.6
	for <multiple recipients>; Tue, 23 Oct 2012 06:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o6EwX3vXeTffq2d9GvFrZvnwuXNmzrwhpDKFO/kJ8zQ=;
	b=Fy+86Z83Iqb729NAaHRyq3Vl3gdil4+jiIenCFWxKn0IImWPCaF6HJr7bk7tdIdOoT
	B1JQr4Z2vD4f1GT0SF1AGJzMKXaSXVI1yTDG9B6XdwK11qHdOlKiX17OwuAJw81Bk4Sj
	uheQy/r5vLOAy7qAdrQEagYzLCzKa8VmiKPQlKjMmn6zfTQLaofBBfAhhvolhCnLTv+b
	f+qn87GhrhNVXgg/SkERd1NDJ0gbDEMjD0TICR2cIBg60TefD3HLGBLANgFu+Ws4Jq9p
	RCoapr60UDrZaf9UMVaWiMOW1NIjuT1uG5IcM0axZOkKja0Bn6CxVQ58mtpdUrlDm8kL
	VQNA==
Received: by 10.181.11.197 with SMTP id ek5mr6578493wid.4.1350999261049;
	Tue, 23 Oct 2012 06:34:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn7sm27971790wib.8.2012.10.23.06.34.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 06:34:20 -0700 (PDT)
Date: Tue, 23 Oct 2012 15:34:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121023133436.GO3269@jama.jama.net>
References: <20121023063428.6C90910336@opal>
	<20121023131226.GN3269@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20121023131226.GN3269@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : systemd: Upgrade past v194
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
X-List-Received-Date: Tue, 23 Oct 2012 13:47:47 -0000
X-Groupsio-MsgNum: 41230
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vy1A5eXR7jld12ZH"
Content-Disposition: inline

--Vy1A5eXR7jld12ZH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 23, 2012 at 03:12:26PM +0200, Martin Jansa wrote:
> On Tue, Oct 23, 2012 at 06:34:28AM +0000, git@git.openembedded.org wrote:
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: fb368b0790a2804080f28b75cf27dcffde763c37
> > URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcomm=
it;h=3Dfb368b0790a2804080f28b75cf27dcffde763c37
> >=20
> > Author: Khem Raj <raj.khem@gmail.com>
> > Date:   Wed Oct 10 05:03:42 2012 +0000
> >=20
> > systemd: Upgrade past v194
> >=20
>=20
> Anyone seen this:
>=20
> | ./arm-oe-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompile arm-oe-li=
nux-gnueabi-gcc  -march=3Darmv4t -mthumb -mthumb-interwork -mtune=3Darm920t=
 --sysroot=3D/OE/jansa-test/shr-core/tmp-eglibc/sysroots/om-gta02 -std=3Dgn=
u99 -DHAVE_CONFIG_H -I.  -include ./config.h -DSYSCONFDIR=3D\""/etc"\" -DSY=
STEM_CONFIG_FILE=3D\"/etc/systemd/system.conf\" -DSYSTEM_CONFIG_UNIT_PATH=
=3D\"/etc/systemd/system\" -DSYSTEM_DATA_UNIT_PATH=3D\"//lib/systemd/system=
\" -DSYSTEM_SYSVINIT_PATH=3D\"/etc/init.d\" -DSYSTEM_SYSVRCND_PATH=3D\"/etc=
\" -DUSER_CONFIG_FILE=3D\"/etc/systemd/user.conf\" -DUSER_CONFIG_UNIT_PATH=
=3D\"/etc/systemd/user\" -DUSER_DATA_UNIT_PATH=3D\"/usr//lib/systemd/user\"=
 -DSYSTEMD_CGROUP_AGENT_PATH=3D\"//lib/systemd/systemd-cgroups-agent\" -DSY=
STEMD_BINARY_PATH=3D\"//lib/systemd/systemd\" -DSYSTEMD_SHUTDOWN_BINARY_PAT=
H=3D\"//lib/systemd/systemd-shutdown\" -DSYSTEMD_SLEEP_BINARY_PATH=3D\"//li=
b/systemd/systemd-sleep\" -DSYSTEMCTL_BINARY_PATH=3D\"/bin/systemctl\" -DSY=
STEMD_TTY_ASK_PASSWORD_AGENT_BINARY_PATH=3D\"/bin/systemd-tty-ask-password-=
agent\" -DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=3D\"/usr/bin/systemd-stdio-bridg=
e\" -DROOTPREFIX=3D\"\" -DRUNTIME_DIR=3D\"/run\" -DRANDOM_SEED=3D\"/var//li=
b/random-seed\" -DSYSTEMD_CRYPTSETUP_PATH=3D\"//lib/systemd/systemd-cryptse=
tup\" -DSYSTEM_GENERATOR_PATH=3D\"//lib/systemd/system-generators\" -DUSER_=
GENERATOR_PATH=3D\"/usr//lib/systemd/user-generators\" -DSYSTEM_SHUTDOWN_PA=
TH=3D\"//lib/systemd/system-shutdown\" -DSYSTEM_SLEEP_PATH=3D\"//lib/system=
d/system-sleep\" -DSYSTEMD_KBD_MODEL_MAP=3D\"/usr/share/systemd/kbd-model-m=
ap\" -DX_SERVER=3D\"/usr/bin/X\" -DUDEVLIBEXECDIR=3D\"//lib/udev\" -DPOLKIT=
_AGENT_BINARY_PATH=3D\"/usr/bin/pkttyagent\" -I ./src -I ./src/shared -I ./=
src/login -I ./src/journal -I ./src/systemd -I ./src/core -I ./src/core -I =
=2E/src/libudev -I ./src/udev -Wp,-D_FORTIFY_SOURCE=3D2       -DKBD_LOADKEY=
S=3D\"/bin/loadkeys\" -DKBD_SETFONT=3D\"/bin/setfont\"  -pipe -Wall -Wextra=
 -Wno-inline -Wundef -Wformat=3D2 -Wlogical-op -Wsign-compare -Wmissing-inc=
lude-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-=
after-statement -Wfloat-equa
>=20
> | arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=
=3Darmv4t -mthumb -mthumb-interwork -mtune=3Darm920t --sysroot=3D/OE/jansa-=
test/shr-core/tmp-eglibc/sysroots/om-gta02 -std=3Dgnu99 -DHAVE_CONFIG_H -I.=
 -include ./config.h -DSYSCONFDIR=3D\"/etc\" -DSYSTEM_CONFIG_FILE=3D\"/etc/=
systemd/system.conf\" -DSYSTEM_CONFIG_UNIT_PATH=3D\"/etc/systemd/system\" -=
DSYSTEM_DATA_UNIT_PATH=3D\"//lib/systemd/system\" -DSYSTEM_SYSVINIT_PATH=3D=
\"/etc/init.d\" -DSYSTEM_SYSVRCND_PATH=3D\"/etc\" -DUSER_CONFIG_FILE=3D\"/e=
tc/systemd/user.conf\" -DUSER_CONFIG_UNIT_PATH=3D\"/etc/systemd/user\" -DUS=
ER_DATA_UNIT_PATH=3D\"/usr//lib/systemd/user\" -DSYSTEMD_CGROUP_AGENT_PATH=
=3D\"//lib/systemd/systemd-cgroups-agent\" -DSYSTEMD_BINARY_PATH=3D\"//lib/=
systemd/systemd\" -DSYSTEMD_SHUTDOWN_BINARY_PATH=3D\"//lib/systemd/systemd-=
shutdown\" -DSYSTEMD_SLEEP_BINARY_PATH=3D\"//lib/systemd/systemd-sleep\" -D=
SYSTEMCTL_BINARY_PATH=3D\"/bin/systemctl\" -DSYSTEMD_TTY_ASK_PASSWORD_AGENT=
_BINARY_PATH=3D\"/bin/systemd-tty-ask-password-agent\" -DSYSTEMD_STDIO_BRID=
GE_BINARY_PATH=3D\"/usr/bin/systemd-stdio-bridge\" -DROOTPREFIX=3D\"\" -DRU=
NTIME_DIR=3D\"/run\" -DRANDOM_SEED=3D\"/var//lib/random-seed\" -DSYSTEMD_CR=
YPTSETUP_PATH=3D\"//lib/systemd/systemd-cryptsetup\" -DSYSTEM_GENERATOR_PAT=
H=3D\"//lib/systemd/system-generators\" -DUSER_GENERATOR_PATH=3D\"/usr//lib=
/systemd/user-generators\" -DSYSTEM_SHUTDOWN_PATH=3D\"//lib/systemd/system-=
shutdown\" -DSYSTEM_SLEEP_PATH=3D\"//lib/systemd/system-sleep\" -DSYSTEMD_K=
BD_MODEL_MAP=3D\"/usr/share/systemd/kbd-model-map\" -DX_SERVER=3D\"/usr/bin=
/X\" -DUDEVLIBEXECDIR=3D\"//lib/udev\" -DPOLKIT_AGENT_BINARY_PATH=3D\"/usr/=
bin/pkttyagent\" -I ./src -I ./src/shared -I ./src/login -I ./src/journal -=
I ./src/systemd -I ./src/core -I ./src/core -I ./src/libudev -I ./src/udev =
-Wp,-D_FORTIFY_SOURCE=3D2 -DKBD_LOADKEYS=3D\"/bin/loadkeys\" -DKBD_SETFONT=
=3D\"/bin/setfont\" -pipe -Wall -Wextra -Wno-inline -Wundef -Wformat=3D2 -W=
logical-op -Wsign-compare -Wmissing-include-dirs -Wold-style-definition -Wp=
ointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmiss=
ing-prototypes -Wstri
> | arm-oe-linux-gnueabi-gcc: error: unrecognized argument in option '-marc=
h=3Dx86-64'
> | arm-oe-linux-gnueabi-gcc: note: valid arguments to '-march=3D' are: arm=
v2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te armv6 armv6=
-m armv6j armv6k armv6s-m armv6t2 armv6z armv6zk armv7 armv7-a armv7-m armv=
7-r armv7e-m ep9312 iwmmxt iwmmxt2 native
>=20
> journal seems to be only part pulling additional -march=3Dx86-64 the rest=
 has correct -march=3Darmv4t (this is om-gta02 build)
>=20
> I'll try koen's patch and if it does not help then debug where did I get =
this extra -march.

It's from python and koen's patch to upgrade to 195 does not fix it too.

git/config.log:PYTHON_CFLAGS=3D'-I/usr/include/python2.7 -I/usr/include/pyt=
hon2.7 -fno-strict-aliasing -O2 -march=3Dx86-64 -pipe -fwrapv -DNDEBUG'
git/Makefile:PYTHON_CFLAGS =3D -I/usr/include/python2.7 -I/usr/include/pyth=
on2.7 -fno-strict-aliasing -O2 -march=3Dx86-64 -pipe -fwrapv -DNDEBUG
git/config.status:S["PYTHON_CFLAGS"]=3D"-I/usr/include/python2.7 -I/usr/inc=
lude/python2.7 -fno-strict-aliasing -O2 -march=3Dx86-64 -pipe -fwrapv -DNDE=
BUG"
git/docs/gudev/Makefile:PYTHON_CFLAGS =3D -I/usr/include/python2.7 -I/usr/i=
nclude/python2.7 -fno-strict-aliasing -O2 -march=3Dx86-64 -pipe -fwrapv -DN=
DEBUG
git/docs/libudev/Makefile:PYTHON_CFLAGS =3D -I/usr/include/python2.7 -I/usr=
/include/python2.7 -fno-strict-aliasing -O2 -march=3Dx86-64 -pipe -fwrapv -=
DNDEBUG

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Vy1A5eXR7jld12ZH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCGnOwACgkQN1Ujt2V2gBzbUACfRU1nyTW4DsZUH+5W9P6jKeJ4
U7EAoJItmGgDy6lU604BymaDnuqEgVix
=ZjJE
-----END PGP SIGNATURE-----

--Vy1A5eXR7jld12ZH--
