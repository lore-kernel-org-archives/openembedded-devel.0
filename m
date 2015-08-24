Return-Path: <B40290@freescale.com>
X-Greylist: delayed 1056 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Aug 2015 08:47:52 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0127.outbound.protection.outlook.com [207.46.100.127])
	by mail.openembedded.org (Postfix) with ESMTP id 770E86AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 08:47:52 +0000 (UTC)
Received: from BLUPR03MB294.namprd03.prod.outlook.com (10.141.48.15) by
	BLUPR03MB294.namprd03.prod.outlook.com (10.141.48.15) with Microsoft
	SMTP Server (TLS) id 15.1.231.21; Mon, 24 Aug 2015 08:15:44 +0000
Received: from BLUPR03MB294.namprd03.prod.outlook.com ([10.141.48.15]) by
	BLUPR03MB294.namprd03.prod.outlook.com ([10.141.48.15]) with mapi id
	15.01.0231.024; Mon, 24 Aug 2015 08:15:44 +0000
From: Guo Chunrong <B40290@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 4/5] samba: add 4.2.3
Thread-Index: AQHQ22Fbl6NkUIXjt0+Di6nunXxRL54ayjGw
Date: Mon, 24 Aug 2015 08:15:44 +0000
Message-ID: <BLUPR03MB29475AE55001B4FC7CABD8F84620@BLUPR03MB294.namprd03.prod.outlook.com>
References: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
	<1440086369-3321-5-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1440086369-3321-5-git-send-email-koen@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=B40290@freescale.com; 
x-originating-ip: [192.158.241.86]
x-microsoft-exchange-diagnostics: 1; BLUPR03MB294;
	5:vwiPG1LmezPoGkAtiHc8ipeUF/lAJNjeKxK4JpNk74orKhW1KO7/OeEO1l9j/4DxVUueuyYWZa0DqT+yNDPXmy1nmXqx/rFl2fNwCwM8aiCXvBSp09qkM3/fF1FTIWI0khCgk5TyzbFsiaMK3WyElA==;
	24:lLwCLQRyOEps3YaL7Xt2QoF+ygfCRJ7ba1KX+jvLTb5J/IkwsXc6BDEiK+NqC8ewUV5ExeOrA9W88Rd5t/IxPdM/xeRiP29Kvp8THZFgR50=;
	20:1EftEPwwzUrmJEeBN7uLImZVPWh49tjv+t35cJ30draZn5iPftyFJ/CFAPb0f9sEixKwrl8fW8ni2U/HBvlf/w==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB294;
x-microsoft-antispam-prvs: <BLUPR03MB294BD1574AC78B6175C9B4C84620@BLUPR03MB294.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001); SRVR:BLUPR03MB294;
	BCL:0; PCL:0; RULEID:; SRVR:BLUPR03MB294; 
x-forefront-prvs: 06780E24F8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(53754006)(199003)(189002)(377454003)(13464003)(43544003)(33656002)(189998001)(5004730100002)(76176999)(50986999)(101416001)(62966003)(77156002)(450100001)(110136002)(107886002)(5001960100002)(2656002)(2501003)(5002640100001)(5003600100002)(66066001)(106356001)(76576001)(87936001)(99286002)(106116001)(105586002)(1720100001)(2950100001)(92566002)(2900100001)(5007970100001)(551544002)(77096005)(68736005)(64706001)(86362001)(15975445007)(102836002)(122556002)(97736004)(81156007)(4001540100001)(74316001)(19580405001)(19580395003)(40100003)(54356999)(5001860100001)(10400500002)(2351001)(46102003)(5001830100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB294;
	H:BLUPR03MB294.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2015 08:15:44.5244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB294
Subject: Re: [meta-oe][PATCH 4/5] samba: add 4.2.3
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
X-List-Received-Date: Mon, 24 Aug 2015 08:47:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello  all,

I verified this patch set for armv8 and there are some error.

Please see log:


NOTE: Executing RunQueue Tasks
$<50>ERROR: Function failed: do_configure (log file is located at /local/ho=
me/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043ardb_release/tmp/wor=
k/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/temp/log.do_configure.4210)
$<50>ERROR: Logfile of failure stored in: /local/home/b19537/gcr/ls1043a/so=
urce/fsl-qoriq-sdk/build_ls1043ardb_release/tmp/work/aarch64-fsl-linux/samb=
a/4.2+4.3.0rc3-r0/temp/log.do_configure.4210
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function do_configure
| Checking for program gcc or cc           : ['aarch64-fsl-linux-gcc', '--s=
ysroot=3D/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043ar=
db_release/tmp/sysroots/ls1043ardb']
| Checking for program ar                  : aarch64-fsl-linux-ar
| Checking for program ranlib              : aarch64-fsl-linux-ranlib
| Checking for gcc                         : ok
| Checking for program git                 : /usr/bin/git
| Check for -MD                            : yes
| Checking for program gdb                 : not found
| Checking build system                    : Linux right 3.13.0-39-generic =
#66~precise1-Ubuntu SMP Wed Oct 29 09:56:49 UTC 2014 x86_64 x86_64 x86_64 G=
NU/Linux
| Checking for header sys/utsname.h        : yes
| Checking uname sysname type              : Traceback (most recent call la=
st):
|   File "./buildtools/bin/waf", line 76, in <module>
|     Scripting.prepare(t, cwd, VERSION, wafdir)
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/third_part=
y/waf/wafadmin/Scripting.py", line 145, in prepare
|     prepare_impl(t, cwd, ver, wafdir)
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/third_part=
y/waf/wafadmin/Scripting.py", line 135, in prepare_impl
|     main()
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/wscript", =
line 320, in main
|     wildcard_main(wildcard_cmd)
|   File "./buildtools/wafsamba/samba_wildcard.py", line 110, in wildcard_m=
ain
|     fun(ctx)
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/third_part=
y/waf/wafadmin/Scripting.py", line 241, in configure
|     conf.sub_config([''])
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/third_part=
y/waf/wafadmin/Configure.py", line 237, in sub_config
|     self.recurse(k, name=3D'configure')
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/third_part=
y/waf/wafadmin/Utils.py", line 634, in recurse
|     f(self)
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/wscript", =
line 92, in configure
|     conf.RECURSE('lib/replace')
|   File "./buildtools/wafsamba/samba_utils.py", line 486, in RECURSE
|     return ctx.sub_config(relpath)
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/third_part=
y/waf/wafadmin/Configure.py", line 237, in sub_config
|     self.recurse(k, name=3D'configure')
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/third_part=
y/waf/wafadmin/Utils.py", line 634, in recurse
|     f(self)
|   File "./buildtools/wafsamba/samba_utils.py", line 48, in runonce_wrappe=
r
|     ret =3D function(*args)
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/lib/replac=
e/wscript", line 28, in configure
|     conf.RECURSE('buildtools/wafsamba')
|   File "./buildtools/wafsamba/samba_utils.py", line 486, in RECURSE
|     return ctx.sub_config(relpath)
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/third_part=
y/waf/wafadmin/Configure.py", line 237, in sub_config
|     self.recurse(k, name=3D'configure')
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/third_part=
y/waf/wafadmin/Utils.py", line 634, in recurse
|     f(self)
|   File "./buildtools/wafsamba/samba_utils.py", line 48, in runonce_wrappe=
r
|     ret =3D function(*args)
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/lib/replac=
e/../../buildtools/wafsamba/wscript", line 301, in configure
|     conf.CHECK_UNAME()
|   File "./buildtools/wafsamba/samba_conftests.py", line 466, in CHECK_UNA=
ME
|     msg=3D"Checking uname %s type" % v):
|   File "./buildtools/wafsamba/samba_autoconf.py", line 446, in CHECK_CODE
|     conf.COMPOUND_END(conf.env[define])
|   File "./buildtools/wafsamba/samba_autoconf.py", line 70, in COMPOUND_EN=
D
|     p(result)
|   File "/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043a=
rdb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/third_part=
y/waf/wafadmin/Configure.py", line 299, in check_message_2
|     self.log.write(sr)
| TypeError: expected a character buffer object
| WARNING: /local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043=
ardb_release/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/temp/run.do_c=
onfigure.4210:1 exit 1 from
|   ./configure --prefix=3D/usr --bindir=3D/usr/bin --sbindir=3D/usr/sbin -=
-libexecdir=3D/usr/lib/samba --datadir=3D/usr/share --sysconfdir=3D/etc --s=
haredstatedir=3D/com --localstatedir=3D/var --libdir=3D/usr/lib --includedi=
r=3D/usr/include --oldincludedir=3D/usr/include --infodir=3D/usr/share/info=
 --with-libiconv=3D/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/buil=
d_ls1043ardb_release/tmp/sysroots/ls1043ardb/usr --mandir=3D/usr/share/man =
--disable-rpath --disable-rpath-install --enable-fhs --with-syslog --withou=
t-ldap --without-acl-support --without-ads --with-cluster-support --include=
dir=3D/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043ardb_=
release/tmp/sysroots/ls1043ardb/usr/include --with-shared-modules=3Didmap_a=
d,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2,pdb_tdbsam,pdb_ldap,pdb_ads,pd=
b_smbpasswd,pdb_wbc_sam,pdb_samba4,auth_unix,auth_wbc,auth_server,auth_netl=
ogond,auth_script,auth_samba4 --bundled-libraries=3D'heimdal,!asn1_compile,=
!compile_et,!zlib,!popt' --enable-avahi --without-fam --without-pam --witho=
ut-systemd --cross-compile --cross-execute=3D"${CROSS_EXEC}" --cross-answer=
s=3D/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043ardb_re=
lease/tmp/work/aarch64-fsl-linux/samba/4.2+4.3.0rc3-r0/git/cross-answers-aa=
rch64.txt
| ERROR: Function failed: do_configure (log file is located at /local/home/=
b19537/gcr/ls1043a/source/fsl-qoriq-sdk/build_ls1043ardb_release/tmp/work/a=
arch64-fsl-linux/samba/4.2+4.3.0rc3-r0/temp/log.do_configure.4210)
$<50>ERROR: Task 5 (/local/home/b19537/gcr/ls1043a/source/fsl-qoriq-sdk/met=
a-oe/meta-oe/recipes-connectivity/samba/samba_git.bb, do_configure) failed =
with exit code '1'
$<50>NOTE: Tasks Summary: Attempted 1043 tasks of which 1042 didn't need to=
 be rerun and 1 failed.
No currently running tasks (961 of 1050)

Thanks
Chunrong




-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
Sent: Thursday, August 20, 2015 11:59 PM
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi
Subject: [oe] [meta-oe][PATCH 4/5] samba: add 4.2.3

Samba is now waf based so this recipe has been written from scratch and wil=
l need more review than the usual version bump.

Waf allows two methods for site files:

1) Run qemu against sysroot
2) cross-answers.txt
3) all of the above

We're going to use 3). This allows overrides as well as building for archit=
ectures where qemu doesn't work.

Another change is that when using systemd the daemons will run in the foreg=
round instead of forking.

Build tested on x86_64 and armv7a with the Angstrom Distribution.
Runtime tested on x86_64 and armv7a with the Angstrom Distribution.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../samba/samba/cross-answers.txt                  |   1 +
 .../recipes-connectivity/samba/samba/nmb.service   |   3 +-
 .../recipes-connectivity/samba/samba/smb.service   |   3 +-
 .../samba/samba/winbind.service                    |   5 +-
 meta-oe/recipes-connectivity/samba/samba_git.bb    | 181 +++++++++++++++++=
++++
 5 files changed, 186 insertions(+), 7 deletions(-)  create mode 100644 met=
a-oe/recipes-connectivity/samba/samba/cross-answers.txt
 create mode 100644 meta-oe/recipes-connectivity/samba/samba_git.bb

diff --git a/meta-oe/recipes-connectivity/samba/samba/cross-answers.txt b/m=
eta-oe/recipes-connectivity/samba/samba/cross-answers.txt
new file mode 100644
index 0000000..10a2bcb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba/cross-answers.txt
@@ -0,0 +1 @@
+Checking uname version type: "#1 Tue Nov 1 12:34:56 UTC 2013"
diff --git a/meta-oe/recipes-connectivity/samba/samba/nmb.service b/meta-oe=
/recipes-connectivity/samba/samba/nmb.service
index 91b9975..64cefb6 100644
--- a/meta-oe/recipes-connectivity/samba/samba/nmb.service
+++ b/meta-oe/recipes-connectivity/samba/samba/nmb.service
@@ -3,9 +3,8 @@ Description=3DSamba NMB Daemon  After=3Dsyslog.target netwo=
rk.target
=20
 [Service]
-Type=3Dforking
 PIDFile=3D/var/run/nmbd.pid
-ExecStart=3D@SBINDIR@/nmbd
+ExecStart=3D@SBINDIR@/nmbd -F
 ExecReload=3D@BASE_BINDIR@/kill -HUP $MAINPID
=20
 [Install]
diff --git a/meta-oe/recipes-connectivity/samba/samba/smb.service b/meta-oe=
/recipes-connectivity/samba/samba/smb.service
index bc0707a..685480e 100644
--- a/meta-oe/recipes-connectivity/samba/samba/smb.service
+++ b/meta-oe/recipes-connectivity/samba/samba/smb.service
@@ -3,10 +3,9 @@ Description=3DSamba SMB Daemon  After=3Dsyslog.target netw=
ork.target nmb.service winbind.service
=20
 [Service]
-Type=3Dforking
 PIDFile=3D/var/run/smbd.pid
 LimitNOFILE=3D16384
-ExecStart=3D@SBINDIR@/smbd
+ExecStart=3D@SBINDIR@/smbd -F
 ExecReload=3D@BASE_BINDIR@/kill -HUP $MAINPID
=20
 [Install]
diff --git a/meta-oe/recipes-connectivity/samba/samba/winbind.service b/met=
a-oe/recipes-connectivity/samba/samba/winbind.service
index bff6fb8..ebcb230 100644
--- a/meta-oe/recipes-connectivity/samba/samba/winbind.service
+++ b/meta-oe/recipes-connectivity/samba/samba/winbind.service
@@ -1,11 +1,10 @@
-i[Unit]
+[Unit]
 Description=3DSamba Winbind Daemon
 After=3Dsyslog.target network.target nmb.service
=20
 [Service]
-Type=3Dforking
 PIDFile=3D/var/run/winbindd.pid
-ExecStart=3D@SBINDIR@/winbindd
+ExecStart=3D@SBINDIR@/winbindd -F
 ExecReload=3D@BASE_BINDIR@/kill -HUP $MAINPID
=20
 [Install]
diff --git a/meta-oe/recipes-connectivity/samba/samba_git.bb b/meta-oe/reci=
pes-connectivity/samba/samba_git.bb
new file mode 100644
index 0000000..9ed3bfa
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba_git.bb
@@ -0,0 +1,181 @@
+SUMMARY =3D "Samba is the standard Windows interoperability suite of progr=
ams for Linux and Unix."
+SECTION =3D "console/network"
+
+LICENSE =3D "GPL-3.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
+
+DEPENDS =3D "heimdal-native bash readline virtual/libiconv zlib popt gnutl=
s python talloc"
+
+PV =3D "4.2+4.3.0rc3"
+SRCREV =3D "5d9f4f950e5c63d30611e77eb7bc7fcfcf985b82"
+
+SRC_URI =3D "git://git.samba.org/samba.git;branch=3Dv4-3-stable \
+           file://volatiles.03_samba \
+           file://smb.conf \
+           file://init.samba \
+           file://init.winbind \
+           file://nmb.service \
+           file://smb.service \
+           file://winbind.service \
+           file://cross-answers.txt \
+          "
+
+S =3D "${WORKDIR}/git"
+
+inherit waf-samba
+
+inherit perlnative pythonnative update-rc.d systemd
+
+SAMBA4_IDMAP_MODULES =3D "idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_t=
db2"
+SAMBA4_PDB_MODULES =3D "pdb_tdbsam,pdb_ldap,pdb_ads,pdb_smbpasswd,pdb_wbc_=
sam,pdb_samba4"
+SAMBA4_AUTH_MODULES =3D "auth_unix,auth_wbc,auth_server,auth_netlogond,aut=
h_script,auth_samba4"
+SAMBA4_MODULES =3D "${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4=
_AUTH_MODULES}"
+
+EXTRA_OECONF =3D " \
+                --disable-rpath \
+                --disable-rpath-install \
+                --enable-fhs \
+                --with-syslog \
+                --without-ldap \
+                --without-ads \
+                --with-cluster-support \
+                --with-shared-modules=3D${SAMBA4_MODULES} \
+                --bundled-libraries=3D'heimdal,!asn1_compile,!compile_et,!=
zlib,!popt,!talloc,!pytalloc,!pytalloc-util' \
+               "
+
+PACKAGECONFIG =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d=
)} \
+                 ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd',=
 '', d)} \
+                 avahi \
+                "
+
+PACKAGECONFIG[avahi]    =3D "--enable-avahi  ,--disable-avahi    ,avahi"
+PACKAGECONFIG[pam]      =3D "--with-pam      ,--without-pam      ,libpam"
+PACKAGECONFIG[fam]      =3D "--with-fam      ,--without-fam      ,gamin"
+PACKAGECONFIG[systemd]  =3D "--with-systemd  ,--without-systemd  ,systemd"
+
+PERL_VERNDORLIB =3D "${datadir}/perl5/vendor_perl/"
+
+do_configure_prepend() {
+     # Merge waf site cache entries into one file
+     mkdir -p ${B}
+     if [ -e  ${WORKDIR}/cross-answers-${TARGET_ARCH}.txt ] ; then
+        sed -i '/uname machine type/d'  ${WORKDIR}/cross-answers-${TARGET_=
ARCH}.txt
+     fi
+     echo 'Checking uname machine type: "${TARGET_ARCH}"' >> ${WORKDIR}/cr=
oss-answers-${TARGET_ARCH}.txt
+     cat ${WORKDIR}/cross-answers.txt=20
+${WORKDIR}/cross-answers-${TARGET_ARCH}.txt > ${B}/cross-answers.txt }
+
+do_compile()  {
+    ${S}/buildtools/bin/waf build ${PARALLEL_MAKE} }
+
+do_install() {
+    ${S}/buildtools/bin/waf install --destdir=3D${D}
+
+    # Remove sysinit script if sysvinit is not in DISTRO_FEATURES
+       =20
+    install -D -m 755 ${WORKDIR}/init.samba ${D}${sysconfdir}/init.d/samba
+    install -D -m 755 ${WORKDIR}/init.winbind ${D}${sysconfdir}/init.d/win=
bind
+    install -D -m 644 ${WORKDIR}/smb.conf ${D}${sysconfdir}/samba/smb.conf
+    install -D -m 644 ${WORKDIR}/volatiles.03_samba=20
+ ${D}${sysconfdir}/default/volatiles/volatiles.03_samba
+
+    install -d ${D}/var/log/samba
+    install -d ${D}/var/spool/samba
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true'=
, d)}; then
+        rm -rf ${D}${sysconfdir}/init.d/
+    fi
+
+    install -d ${D}${systemd_unitdir}/system
+    for i in nmb smb winbind; do
+        install -m 0644 ${WORKDIR}/$i.service ${D}${systemd_unitdir}/syste=
m
+    done
+    sed -e 's,@BASE_BINDIR@,${base_bindir},g' \
+        -e 's,@SBINDIR@,${sbindir},g' \
+        -i ${D}${systemd_unitdir}/system/*.service
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false',=
 d)}; then
+	install -d ${D}${sysconfdir}/tmpfiles.d
+	echo "d ${localstatedir}/log/samba 0755 root root -" \
+            > ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
+    fi
+}
+
+SYSTEMD_PACKAGES =3D "${PN} winbind"
+SYSTEMD_SERVICE_${PN} =3D "nmb.service smb.service"
+SYSTEMD_SERVICE_winbind =3D "winbind.service"
+
+INITSCRIPT_PACKAGES =3D "samba winbind"
+INITSCRIPT_NAME_samba =3D "samba"
+INITSCRIPT_NAME_winbind =3D "winbind"
+
+# No dependencies, goes in at level 20 (NOTE: take care with the #=20
+level, later levels put the shutdown later too - see the links # in=20
+rc6.d, the shutdown must precede network shutdown).
+INITSCRIPT_PARAMS =3D "defaults"
+
+CONFFILES_${PN} =3D "${sysconfdir}/samba/smb.conf"
+
+PACKAGES =3D+ "ctdb-tests-dbg ctdb-tests samba-python-dbg samba-python sam=
ba-perl libwbclient libwinbind libwinbind-dbg libnss-winbind winbind winbin=
d-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs =
cifs-doc swat"
+
+RDEPENDS_ctdb-tests +=3D "bash"
+FILES_ctdb-tests =3D "${libdir}/ctdb-tests \
+                    ${datadir}/ctdb-tests"
+FILES_ctdb-tests-dbg =3D "${libdir}/ctdb-tests/.debug"
+
+FILES_samba-python =3D "${libdir}/python*"
+FILES_samba-python-dbg =3D "${libdir}/python*/site-packages/samba/*/.debug=
 \
+                          ${libdir}/python*/site-packages/samba/.debug \
+                          ${libdir}/python*/site-packages/.debug \
+                         "
+
+FILES_samba-perl =3D "${datadir}/perl*"
+
+FILES_winbind-dbg =3D "${libdir}/idmap/.debug/*.so \
+                     ${libdir}/security/.debug/pam_winbind.so \ "
+
+# For some reason the shlib code doesn't pick this up leading to:=20
+/usr/sbin/smbd: error while loading shared libraries: libnetapi.so.0: cann=
ot open shared object file: No such file or directory RDEPENDS_${PN} +=3D "=
libnetapi"
+
+FILES_${PN} +=3D "${libdir}/vfs/*.so \
+                ${libdir}/charset/*.so \
+                ${libdir}/*.dat \
+                ${libdir}/auth/*.so \
+                ${libdir}/security/pam_smbpass.so \
+                ${libdir}/winbind_krb5*.so \
+                ${libdir}/mit_samba*.so \ "
+
+FILES_${PN}-dbg +=3D "${libdir}/vfs/.debug \
+                    ${libdir}/charset/.debug \
+                    ${libdir}/auth/.debug \
+                    ${libdir}/security/.debug \
+                    ${libdir}/samba/*/.debug \ "
+
+FILES_libwbclient =3D "${libdir}/libwbclient.so.*"
+FILES_libnetapi =3D "${libdir}/libnetapi.so.*"
+FILES_libsmbsharemodes =3D "${libdir}/libsmbsharemodes.so.*"
+FILES_libtdb =3D "${libdir}/libtdb.so.*"
+FILES_cifs =3D "${base_sbindir}/mount.cifs ${base_sbindir}/umount.cifs"
+FILES_cifs-doc =3D "${mandir}/man8/mount.cifs.8 ${mandir}/man8/umount.cifs=
.8"
+FILES_libsmbclient =3D "${libdir}/libsmbclient.so.*"
+FILES_libsmbclient-dev =3D "${libdir}/libsmbclient.so ${includedir}"
+FILES_winbind =3D "${sbindir}/winbindd \
+                 ${bindir}/wbinfo \
+                 ${bindir}/ntlm_auth \
+                 ${sysconfdir}/init.d/winbind \
+                 ${systemd_unitdir}/system/winbind.service \ "
+FILES_libwinbind =3D "${libdir}/idmap/*.so \
+                    ${libdir}/pdb \
+                    ${libdir}/gpext \
+                    ${libdir}/perfcount \
+                    ${libdir}/security/pam_winbind.so \ "
+
+FILES_libnss-winbind =3D "${libdir}/libnss_*${SOLIBS} \
+                        ${libdir}/nss_info"
+
+FILES_swat       =3D "${sbindir}/swat ${datadir}/swat ${libdir}/*.msg"
--
2.0.1

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

