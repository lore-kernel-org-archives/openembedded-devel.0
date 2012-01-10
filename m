Received: from 15.mo5.mail-out.ovh.net ([178.33.107.29]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.gardet@oliseo.fr>) id 1Rkfvs-0005j1-FA
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 18:56:24 +0100
Received: from mail404.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 32210FFA07B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2012 18:10:07 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 10 Jan 2012 19:08:51 +0200
Received: from 164.60-224-89.dsl.completel.net (HELO ?192.168.1.111?)
	(guillaume.gardet@oliseo.fr@89.224.60.164)
	by ns0.ovh.net with SMTP; 10 Jan 2012 19:08:49 +0200
Message-ID: <4F0C70A1.1080603@oliseo.fr>
Date: Tue, 10 Jan 2012 18:08:49 +0100
From: =?ISO-8859-1?Q?Guillaume_GARDET_-_Olis=E9o?= <guillaume.gardet@oliseo.fr>
Organization: =?ISO-8859-1?Q?OLIS=C9O?=
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111220 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
References: <1323265584-7090-1-git-send-email-guillaume.gardet@oliseo.fr>
In-Reply-To: <1323265584-7090-1-git-send-email-guillaume.gardet@oliseo.fr>
X-Enigmail-Version: 1.3.4
X-Ovh-Tracer-Id: 8115768004859804489
X-Ovh-Remote: 89.224.60.164 (164.60-224-89.dsl.completel.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeefledrtdefucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucenucfhrhhomhepifhuihhllhgruhhmvggpifettfffgffvpgdqpgfqlhhishorohcuoehguhhilhhlrghumhgvrdhgrghruggvthesohhlihhsvghordhfrheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfjughrpefkfffhohgfggfvufhfjggtgfesthekrgdttdefud
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeefledrtdefucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucenucfhrhhomhepifhuihhllhgruhhmvggpifettfffgffvpgdqpgfqlhhishorohcuoehguhhilhhlrghumhgvrdhgrghruggvthesohhlihhsvghordhfrheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfjughrpefkfffhohgfggfvufhfjggtgfesthekrgdttdefud
Subject: Re: [PATCH v2] Fix git URL to linux-omap git repo.
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
X-List-Received-Date: Tue, 10 Jan 2012 17:56:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ping again...


Le 07/12/2011 14:46, Guillaume GARDET a =E9crit :
> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> ---
>  recipes/linux/linux-kexecboot_2.6.32.bb |    2 +-
>  recipes/linux/linux-omap2_git.bb        |    2 +-
>  recipes/linux/linux-omap_2.6.26.bb      |    2 +-
>  recipes/linux/linux-omap_2.6.27.bb      |    2 +-
>  recipes/linux/linux-omap_2.6.28.bb      |    2 +-
>  recipes/linux/linux-omap_2.6.29.bb      |    2 +-
>  recipes/linux/linux-omap_2.6.31.bb      |    2 +-
>  recipes/linux/linux-omap_2.6.32.bb      |    2 +-
>  recipes/linux/linux-omap_2.6.37.bb      |    2 +-
>  recipes/linux/linux-omap_2.6.38.bb      |    2 +-
>  recipes/linux/linux-omap_2.6.39.bb      |    2 +-
>  recipes/linux/linux-omap_git.bb         |    2 +-
>  12 files changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/recipes/linux/linux-kexecboot_2.6.32.bb b/recipes/linux/li=
nux-kexecboot_2.6.32.bb
> index 4c3294a..0c0d2af 100644
> --- a/recipes/linux/linux-kexecboot_2.6.32.bb
> +++ b/recipes/linux/linux-kexecboot_2.6.32.bb
> @@ -21,7 +21,7 @@ SRC_URI +=3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2=
.6/linux-${PV}.tar.bz2;name=3Dk
>  SRC_URI[kernel.md5sum] =3D "260551284ac224c3a43c4adac7df4879"
>  SRC_URI[kernel.sha256sum] =3D "5099786d80b8407d98a619df00209c2353517f2=
2d804fdd9533b362adcb4504e"
> =20
> -SRC_URI_append_omap3 =3D " git://git.kernel.org/pub/scm/linux/kernel/g=
it/tmlind/linux-omap-2.6.git;protocol=3Dgit;rev=3D6833f1a8cdcb65a370f898b=
de6b6af63f81962df \
> +SRC_URI_append_omap3 =3D " git://git.kernel.org/pub/scm/linux/kernel/g=
it/tmlind/linux-omap.git;protocol=3Dgit;rev=3D6833f1a8cdcb65a370f898bde6b=
6af63f81962df \
>  file://defconfig \
>  file://sctp-fix.patch \
>  file://cm-t35/0001-omap3-cm-t35-add-mux-initialization.patch \
> diff --git a/recipes/linux/linux-omap2_git.bb b/recipes/linux/linux-oma=
p2_git.bb
> index cb427e3..ad3a7eb 100644
> --- a/recipes/linux/linux-omap2_git.bb
> +++ b/recipes/linux/linux-omap2_git.bb
> @@ -8,7 +8,7 @@ PV =3D "2.6.26"
>  #PV =3D "2.6.26+2.6.27-rc1+${PR}+git${SRCREV}"
>  PR =3D "r64"
> =20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap-2.6.git;protocol=3Dgit \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap.git;protocol=3Dgit \
>  	   file://defconfig"
> =20
>  SRC_URI_append_beagleboard =3D " file://no-harry-potter.diff \
> diff --git a/recipes/linux/linux-omap_2.6.26.bb b/recipes/linux/linux-o=
map_2.6.26.bb
> index 0c8dcd9..0d74820 100644
> --- a/recipes/linux/linux-omap_2.6.26.bb
> +++ b/recipes/linux/linux-omap_2.6.26.bb
> @@ -5,7 +5,7 @@ SRCREV =3D "d6daf8d8cc5ccf90247def5551ee9c3e8555e848"
>  PV =3D "2.6.26"
>  PR =3D "r65"
> =20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap-2.6.git;protocol=3Dgit \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap.git;protocol=3Dgit \
>  	   file://defconfig"
> =20
>  SRC_URI_append_beagleboard =3D " file://no-harry-potter.diff \
> diff --git a/recipes/linux/linux-omap_2.6.27.bb b/recipes/linux/linux-o=
map_2.6.27.bb
> index fdf0fdd..36f86d9 100644
> --- a/recipes/linux/linux-omap_2.6.27.bb
> +++ b/recipes/linux/linux-omap_2.6.27.bb
> @@ -8,7 +8,7 @@ COMPATIBLE_MACHINE =3D "omap5912osk|omap1710h3|omap2430=
sdp|omap2420h4|beagleboard|
>  SRCREV =3D "2a3408be17f287fdb5809c9b6c68e7ad96d25b74"
>  PR =3D "r14"
> =20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap-2.6.git;protocol=3Dgit \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap.git;protocol=3Dgit \
>  	   file://defconfig"
> =20
>  SRC_URI_append =3D " \
> diff --git a/recipes/linux/linux-omap_2.6.28.bb b/recipes/linux/linux-o=
map_2.6.28.bb
> index 622a38d..53fcc83 100644
> --- a/recipes/linux/linux-omap_2.6.28.bb
> +++ b/recipes/linux/linux-omap_2.6.28.bb
> @@ -11,7 +11,7 @@ SRCREV =3D "79d042a081d3e467c735bb0d9569ed6296f85a3c"
> =20
>  PV =3D "2.6.28"
> =20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap-2.6.git;branch=3Domap-2.6.28;protocol=3Dgit \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap.git;branch=3Domap-2.6.28;protocol=3Dgit \
>  	   file://defconfig"
> =20
>  SRC_URI_append =3D " \
> diff --git a/recipes/linux/linux-omap_2.6.29.bb b/recipes/linux/linux-o=
map_2.6.29.bb
> index a87fb25..3248dc3 100644
> --- a/recipes/linux/linux-omap_2.6.29.bb
> +++ b/recipes/linux/linux-omap_2.6.29.bb
> @@ -17,7 +17,7 @@ SRCREV =3D "58cf2f1425abfd3a449f9fe985e48be2d2555022"
>  # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machi=
ne/include/omap3.inc
>  PR_append =3D "+gitr${SRCREV}"
> =20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap-2.6.git;protocol=3Dgit \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap.git;protocol=3Dgit \
>  	   file://defconfig"
> =20
>  SRC_URI_append =3D " \
> diff --git a/recipes/linux/linux-omap_2.6.31.bb b/recipes/linux/linux-o=
map_2.6.31.bb
> index 0f1e79b..2b627ca 100644
> --- a/recipes/linux/linux-omap_2.6.31.bb
> +++ b/recipes/linux/linux-omap_2.6.31.bb
> @@ -13,7 +13,7 @@ SRCREV =3D "945044d157dd63c6af0f2ed40a5346382af94eb4"
>  #PV =3D "2.6.30+2.6.31-rc8+gitr${SRCREV}"
>  PV =3D "2.6.31"
> =20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap-2.6.git;protocol=3Dgit \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap.git;protocol=3Dgit \
>  	   file://defconfig"
> =20
>  SRC_URI_append =3D " \
> diff --git a/recipes/linux/linux-omap_2.6.32.bb b/recipes/linux/linux-o=
map_2.6.32.bb
> index 348ec96..f5aacda 100644
> --- a/recipes/linux/linux-omap_2.6.32.bb
> +++ b/recipes/linux/linux-omap_2.6.32.bb
> @@ -13,7 +13,7 @@ SRCREV =3D "89c9eaeb92c97348dcabd6cb377b646c00855f6a"
>  # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machi=
ne/include/omap3.inc
>  PV =3D "2.6.32"
> =20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap-2.6.git;protocol=3Dgit \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap.git;protocol=3Dgit \
>  	   file://defconfig"
> =20
>  SRC_URI_append =3D " \
> diff --git a/recipes/linux/linux-omap_2.6.37.bb b/recipes/linux/linux-o=
map_2.6.37.bb
> index 9c7ce01..6c63fa7 100644
> --- a/recipes/linux/linux-omap_2.6.37.bb
> +++ b/recipes/linux/linux-omap_2.6.37.bb
> @@ -12,7 +12,7 @@ SRCREV =3D "fa3b4e23ec20cfc944db7cc2b30b0d82c20e4472"
> =20
>  FILESPATHPKG_prepend =3D "linux-omap-2.6.37:"
> =20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap-2.6.git;protocol=3Dgit \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap.git;protocol=3Dgit \
>  	   file://defconfig"
> =20
>  SRC_URI_append =3D " \
> diff --git a/recipes/linux/linux-omap_2.6.38.bb b/recipes/linux/linux-o=
map_2.6.38.bb
> index b79d701..732e6df 100644
> --- a/recipes/linux/linux-omap_2.6.38.bb
> +++ b/recipes/linux/linux-omap_2.6.38.bb
> @@ -12,7 +12,7 @@ SRCREV =3D "73ee404d7dedd23e35aae3ce516c504db783716f"
> =20
>  FILESPATHPKG_prepend =3D "linux-omap-2.6.38:"
> =20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap-2.6.git;protocol=3Dgit \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap.git;protocol=3Dgit \
>  	   file://defconfig"
> =20
>  SRC_URI_append =3D " file://base/0001-ARM-OMAP-beagleboard-Add-infrast=
ructure-to-do-fixups.patch \
> diff --git a/recipes/linux/linux-omap_2.6.39.bb b/recipes/linux/linux-o=
map_2.6.39.bb
> index 3880aa1..8172d5a 100644
> --- a/recipes/linux/linux-omap_2.6.39.bb
> +++ b/recipes/linux/linux-omap_2.6.39.bb
> @@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append =3D "o"
> =20
>  FILESPATHPKG_prepend =3D "linux-omap-2.6.39:"
> =20
> -SRC_URI +=3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/lin=
ux-omap-2.6.git;protocol=3Dgit \
> +SRC_URI +=3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/lin=
ux-omap.git;protocol=3Dgit \
>              file://defconfig"
> =20
>  SRC_URI_append =3D " \
> diff --git a/recipes/linux/linux-omap_git.bb b/recipes/linux/linux-omap=
_git.bb
> index e74e8cf..1d729c2 100644
> --- a/recipes/linux/linux-omap_git.bb
> +++ b/recipes/linux/linux-omap_git.bb
> @@ -15,7 +15,7 @@ FILESPATHPKG_prepend =3D "linux-omap-2.6.31:"
>  #PV =3D "2.6.30+2.6.31-rc8+gitr${SRCREV}"
>  PV =3D "2.6.31"
> =20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap-2.6.git;protocol=3Dgit \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap.git;protocol=3Dgit \
>  	   file://defconfig"
> =20
>  SRC_URI_append =3D " \


