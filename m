Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TQeUC-00082T-U1; Tue, 23 Oct 2012 15:25:37 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so3167146wib.6
	for <multiple recipients>; Tue, 23 Oct 2012 06:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eqYn/c8ZiZK58adDeZ92Wq+5crB0gnHLiCfYl9q6T4c=;
	b=VOdEI7sjWER7zkEBXGb7igPRS4L0Ch7gr7cY7XpZPSl/9bjiu7mKYkJcPXeZ42V7q3
	/nfsgnU7fJFn+2F0o6GPdvrwvJaRbUqaaHqXY63pCjj+3I8xVs/0oge/kcKaCFAGCGzv
	HK6N7zkWbBqltXyKfsgjiUF0K3nEnr8FH3vcQyjwpTWpE5v5CGN1BJRu+M0xy9+7pRXW
	vtwHlq0vRv0yQfY47r4Fa3+0N5nN1hqcbffTahOHzEqamAJX8X0rlsoi9r+stWnYl98H
	oKIq7toS9a2dq14PyS3Aaywv5Ok9YOoZ6XsMZXdpSxillCF8hh1XW3KaGJNujxYXsBFW
	jebA==
Received: by 10.216.201.143 with SMTP id b15mr7000118weo.96.1350997930730;
	Tue, 23 Oct 2012 06:12:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a10sm27861114wiz.4.2012.10.23.06.12.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 06:12:09 -0700 (PDT)
Date: Tue, 23 Oct 2012 15:12:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121023131226.GN3269@jama.jama.net>
References: <20121023063428.6C90910336@opal>
MIME-Version: 1.0
In-Reply-To: <20121023063428.6C90910336@opal>
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
X-List-Received-Date: Tue, 23 Oct 2012 13:25:37 -0000
X-Groupsio-MsgNum: 41228
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N/GrjenRD+RJfyz+"
Content-Disposition: inline

--N/GrjenRD+RJfyz+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 23, 2012 at 06:34:28AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: fb368b0790a2804080f28b75cf27dcffde763c37
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Dfb368b0790a2804080f28b75cf27dcffde763c37
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Wed Oct 10 05:03:42 2012 +0000
>=20
> systemd: Upgrade past v194
>=20

Anyone seen this:

| ./arm-oe-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompile arm-oe-linu=
x-gnueabi-gcc  -march=3Darmv4t -mthumb -mthumb-interwork -mtune=3Darm920t -=
-sysroot=3D/OE/jansa-test/shr-core/tmp-eglibc/sysroots/om-gta02 -std=3Dgnu9=
9 -DHAVE_CONFIG_H -I.  -include ./config.h -DSYSCONFDIR=3D\""/etc"\" -DSYST=
EM_CONFIG_FILE=3D\"/etc/systemd/system.conf\" -DSYSTEM_CONFIG_UNIT_PATH=3D\=
"/etc/systemd/system\" -DSYSTEM_DATA_UNIT_PATH=3D\"//lib/systemd/system\" -=
DSYSTEM_SYSVINIT_PATH=3D\"/etc/init.d\" -DSYSTEM_SYSVRCND_PATH=3D\"/etc\" -=
DUSER_CONFIG_FILE=3D\"/etc/systemd/user.conf\" -DUSER_CONFIG_UNIT_PATH=3D\"=
/etc/systemd/user\" -DUSER_DATA_UNIT_PATH=3D\"/usr//lib/systemd/user\" -DSY=
STEMD_CGROUP_AGENT_PATH=3D\"//lib/systemd/systemd-cgroups-agent\" -DSYSTEMD=
_BINARY_PATH=3D\"//lib/systemd/systemd\" -DSYSTEMD_SHUTDOWN_BINARY_PATH=3D\=
"//lib/systemd/systemd-shutdown\" -DSYSTEMD_SLEEP_BINARY_PATH=3D\"//lib/sys=
temd/systemd-sleep\" -DSYSTEMCTL_BINARY_PATH=3D\"/bin/systemctl\" -DSYSTEMD=
_TTY_ASK_PASSWORD_AGENT_BINARY_PATH=3D\"/bin/systemd-tty-ask-password-agent=
\" -DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=3D\"/usr/bin/systemd-stdio-bridge\" -=
DROOTPREFIX=3D\"\" -DRUNTIME_DIR=3D\"/run\" -DRANDOM_SEED=3D\"/var//lib/ran=
dom-seed\" -DSYSTEMD_CRYPTSETUP_PATH=3D\"//lib/systemd/systemd-cryptsetup\"=
 -DSYSTEM_GENERATOR_PATH=3D\"//lib/systemd/system-generators\" -DUSER_GENER=
ATOR_PATH=3D\"/usr//lib/systemd/user-generators\" -DSYSTEM_SHUTDOWN_PATH=3D=
\"//lib/systemd/system-shutdown\" -DSYSTEM_SLEEP_PATH=3D\"//lib/systemd/sys=
tem-sleep\" -DSYSTEMD_KBD_MODEL_MAP=3D\"/usr/share/systemd/kbd-model-map\" =
-DX_SERVER=3D\"/usr/bin/X\" -DUDEVLIBEXECDIR=3D\"//lib/udev\" -DPOLKIT_AGEN=
T_BINARY_PATH=3D\"/usr/bin/pkttyagent\" -I ./src -I ./src/shared -I ./src/l=
ogin -I ./src/journal -I ./src/systemd -I ./src/core -I ./src/core -I ./src=
/libudev -I ./src/udev -Wp,-D_FORTIFY_SOURCE=3D2       -DKBD_LOADKEYS=3D\"/=
bin/loadkeys\" -DKBD_SETFONT=3D\"/bin/setfont\"  -pipe -Wall -Wextra -Wno-i=
nline -Wundef -Wformat=3D2 -Wlogical-op -Wsign-compare -Wmissing-include-di=
rs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-s=
tatement -Wfloat-equal -Wmissing-prototypes -Wstrict-prototypes -Wredundant=
-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -W=
cast-align -Wstrict-aliasing=3D2 -Wwrite-strings -Wno-long-long -Wno-overle=
ngth-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unu=
sed-result -Werror=3Doverflow -ffast-math -fno-common -fdiagnostics-show-op=
tion -fno-strict-aliasing -fvisibility=3Dhidden -ffunction-sections -fdata-=
sections -fstack-protector --param=3Dssp-buffer-size=3D4 -fvisibility=3Ddef=
ault -I/usr/include/python2.7 -I/usr/include/python2.7 -fno-strict-aliasing=
 -O2 -march=3Dx86-64 -pipe -fwrapv -DNDEBUG -O2 -pipe -g -feliminate-unused=
-debug-types -c -o src/python-systemd/_journal_la-_journal.lo `test -f 'src=
/python-systemd/_journal.c' || echo './'`src/python-systemd/_journal.c

| arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=
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
ing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations=
 -Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing=
=3D2 -Wwrite-strings -Wno-long-long -Wno-overlength-strings -Wno-unused-par=
ameter -Wno-missing-field-initializers -Wno-unused-result -Werror=3Doverflo=
w -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -f=
visibility=3Dhidden -ffunction-sections -fdata-sections -fstack-protector -=
-param=3Dssp-buffer-size=3D4 -fvisibility=3Ddefault -I/usr/include/python2.=
7 -I/usr/include/python2.7 -fno-strict-aliasing -O2 -march=3Dx86-64 -pipe -=
fwrapv -DNDEBUG -O2 -pipe -g -feliminate-unused-debug-types -c src/python-s=
ystemd/_journal.c  -fPIC -DPIC -o src/python-systemd/.libs/_journal_la-_jou=
rnal.o
| arm-oe-linux-gnueabi-gcc: error: unrecognized argument in option '-march=
=3Dx86-64'
| arm-oe-linux-gnueabi-gcc: note: valid arguments to '-march=3D' are: armv2=
 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te armv6 armv6-m=
 armv6j armv6k armv6s-m armv6t2 armv6z armv6zk armv7 armv7-a armv7-m armv7-=
r armv7e-m ep9312 iwmmxt iwmmxt2 native

journal seems to be only part pulling additional -march=3Dx86-64 the rest h=
as correct -march=3Darmv4t (this is om-gta02 build)

I'll try koen's patch and if it does not help then debug where did I get th=
is extra -march.

Cheers,

--N/GrjenRD+RJfyz+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCGl7oACgkQN1Ujt2V2gByB+QCbBhQhJqbpROnAw0JokEYCMXbO
5P0An1Ar+6BV26QuEncKDfzSdCtTbyti
=ID4y
-----END PGP SIGNATURE-----

--N/GrjenRD+RJfyz+--
