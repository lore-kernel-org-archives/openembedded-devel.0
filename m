Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id DC17F65DAA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 08:53:24 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so2865227eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 01:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9CLYBOeA/P5zFU2Y4pV8O8GiiTeui9YLf4vcKWNO4vE=;
	b=ARmKORHHToGVpSoFk8yS4To+LyxyQRYVvZoNcf+stoZjWqjcjB8ZjXGPjzubwT96lq
	7H+NHNo5Xf2X+89n9gI8cZOulvgIL/rEFwDIWpjVJYbjw5ufdj683lvefvjnC20AzEzd
	lV0R0cZAd22+V5kWb2PqHLWDO1YBt+zQzAYucqgPpgtLReUBioGzC5Zs7X6NLHjZxYEQ
	vT+OJSAuM7fhnlMeB4C54KhJO/T/vfLxxGZYw1HNmF4c1FKZxvLcef3TzgfJPEBdOkar
	n3EyqZTp+G92LCLxqwJKUJElxXoGN8JFh5Adxv4KkqaYpqfGoE00tH54mk/89ynUTDg1
	kISg==
X-Received: by 10.14.225.73 with SMTP id y49mr36994398eep.43.1397984005747;
	Sun, 20 Apr 2014 01:53:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm92767456eeg.11.2014.04.20.01.53.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 01:53:24 -0700 (PDT)
Date: Sun, 20 Apr 2014 10:53:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420085329.GL2486@jama>
References: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-xfce/meta-gnome 00/10] world-fixes
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
X-List-Received-Date: Sun, 20 Apr 2014 08:53:26 -0000
X-Groupsio-MsgNum: 49293
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t5C3/nrmPumNj5sH"
Content-Disposition: inline

--t5C3/nrmPumNj5sH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01, 2014 at 05:21:36PM +0200, Andreas M=FCller wrote:
> mousepad seems already fixed in secret shr repo
>=20
> The following changes since commit c04626475be6f0e52400552d5aed044062aac4=
dd:
>=20
>   exo: Add intltool-native as native dependency (2014-03-29 22:51:36 +010=
0)
>=20
> are available in the git repository at:
>=20
>   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches=
-for-world
>=20
> for you to fetch changes up to 4972401d7133f07f732a06d47bc9bce664465493:
>=20
>   abiword: update to 3.0.0 to fix build (2014-04-01 17:12:30 +0200)

All merged, thanks!

>=20
> ----------------------------------------------------------------
> Andreas M=FCller (10):
>       xfce-git.bbclass initial add
>       xarchiver: fix configue
>       xfwm4: fix configue by inheriting xfce-git.bbclass
>       libxfce4ui: fix configue by inheriting xfce-git.bbclass
>       xfce4-taskmanager: fix configue by inheriting xfce-git.bbclass
>       xfce4-closebutton-plugin: fix configue by inheriting xfce-git.bbcla=
ss
>       xfce4-settings: fix configue by inheriting xfce-git.bbclass
>       xfce4-dev-tools: update to 4.11.0
>       sound-theme-freedesktop: fix configure
>       abiword: update to 3.0.0 to fix build
>=20
>  meta-gnome/recipes-gnome/abiword/abiword/abiword-cxx-for-ld-fix.patch   =
                        |  12 ---------
>  meta-gnome/recipes-gnome/abiword/abiword/abiword.fix.glib-2.32.patch    =
                        |  21 ----------------
>  meta-gnome/recipes-gnome/abiword/abiword/cdump.pl                       =
                        |  32 ------------------------
>  meta-gnome/recipes-gnome/abiword/abiword/debian_patches_boost54.patch   =
                        |  32 ++++++++++++++++++++++++
>  meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch   =
                        | 104 ---------------------------------------------=
-------------------------------
>  meta-gnome/recipes-gnome/abiword/abiword/libpng15.patch                 =
                        | 102 ---------------------------------------------=
-----------------------------
>  meta-gnome/recipes-gnome/abiword/abiword/nodolt.patch                   =
                        |  12 ---------
>  meta-gnome/recipes-gnome/abiword/{abiword_2.8.6.bb =3D> abiword_3.0.0.bb=
}                         |  39 +++++++++++------------------
>  meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb  =
                        |   2 ++
>  meta-xfce/classes/xfce-git.bbclass                                      =
                        |   5 ++++
>  meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb                       =
                        |   8 ++----
>  meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb       =
                        |   6 +----
>  meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git=
=2Ebb                     |   6 +----
>  meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb                  =
                        |   8 +-----
>  meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.10.0.bb =3D> x=
fce4-dev-tools_4.11.0.bb} |   4 +--
>  meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb             =
                        |   6 +----
>  meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb                               =
                        |   6 +----
>  17 files changed, 63 insertions(+), 342 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/abiword-cxx-=
for-ld-fix.patch
>  delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/abiword.fix.=
glib-2.32.patch
>  delete mode 100755 meta-gnome/recipes-gnome/abiword/abiword/cdump.pl
>  create mode 100644 meta-gnome/recipes-gnome/abiword/abiword/debian_patch=
es_boost54.patch
>  delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/fix.no.undef=
ined.param.patch
>  delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/libpng15.pat=
ch
>  delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/nodolt.patch
>  rename meta-gnome/recipes-gnome/abiword/{abiword_2.8.6.bb =3D> abiword_3=
=2E0.0.bb} (83%)
>  create mode 100644 meta-xfce/classes/xfce-git.bbclass
>  rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.10.0.bb=
 =3D> xfce4-dev-tools_4.11.0.bb} (78%)
>=20
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--t5C3/nrmPumNj5sH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTiwkACgkQN1Ujt2V2gBzOHgCeJV05/Hf0AFj3uVrz4K2fvnDA
oVIAoK9hO+5Is0jxcSX4HQow9Lr5QSlF
=6UlV
-----END PGP SIGNATURE-----

--t5C3/nrmPumNj5sH--
