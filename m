Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9216A76FC4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:12:42 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r129so3610432wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 06:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c+UEQl51wKMM5h1H/8NNkurM/2fYGEmT4mPRMW/kc0Q=;
	b=pzOu3a/kx0Gb2OxB+cHP5Wh7C1NOEMsmAbFzs1cr+w7cdN9bjOztlCnLjAdYu9asKi
	PZsE7C4hZYkI2HKUahCSDIUE0ayoVQbiACFOTQwdt2KT3duSobNVrNGBdhzNIX90OU0b
	G1uYguEzAYim98x2V5K+LU+P2sah3bKq+PezZRGFXX4jklJuUilJfO0VW+BNSwv6XpcP
	C5QAqJZfrE8uLlOyPLzSYZZ+YKXwOBpUy9ivhM8wu9oGj8T1O30Ya2SECeNfRLxkILyL
	yiJaItENmDr5LMLC9nMbrC/SeUxylTHvxh7wm5h6roxNR2LfI3+qhisG4/YmBmB9WcEs
	AErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=c+UEQl51wKMM5h1H/8NNkurM/2fYGEmT4mPRMW/kc0Q=;
	b=frhJGAuyySeRSfJnTLguHVGUOPUgiHxS59XQgAMSL42W+9nZ4LL6HSkvjHWmXh07iS
	qjSSHs+NFBjVfNrrGtPOWAG9116reSTJ2r2oUnuYSl+PT1o4JGrfIMiUpgSm5n/uhcu8
	XQn9OBjlfD9QLB8x3IL/8BS52Y8TK1VpHZ603CNmLXWIhVbsFcdWtQDB1DBvFrsN9EuP
	Bx/wINojTUmvYvPKOz1kcT5MP/xw5p7XnkBYvUJ5P+KPExDgYmxd21ME97hg0GYyAqpZ
	kh5MBBMireL12c6qxDF6mGRxyKKAboi8vaed5lLhhlAScyHLhUQfAGH076Xn7ewv7WGQ
	dFjA==
X-Gm-Message-State: AG10YOTS7gPHP0rML/lY4y7ml0isTWL3EDpQ60gvdFNi88r7azpPUDUKp1qB+H/MO0BHSA==
X-Received: by 10.194.24.164 with SMTP id v4mr29018705wjf.138.1453903962617;
	Wed, 27 Jan 2016 06:12:42 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m143sm7832784wma.17.2016.01.27.06.12.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jan 2016 06:12:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Jan 2016 15:14:53 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160127141453.GF2574@jama>
References: <1453474301-26578-1-git-send-email-manuel.bachmann@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1453474301-26578-1-git-send-email-manuel.bachmann@iot.bzh>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: Re: [PATCH 2/2][meta-multimedia] rygel: Update to 0.28.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jan 2016 14:12:42 -0000
X-Groupsio-MsgNum: 59721
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z+pzSjdB7cqptWpS"
Content-Disposition: inline

--z+pzSjdB7cqptWpS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2016 at 03:51:41PM +0100, Manuel Bachmann wrote:
> From: Manuel Bachmann <mbc@iot.bzh>
>=20
> Update to latest version. This mainly fixes file uploading,
> which did not work in previous version (see upstream commit
> "1d45866a3fd7ca47bdbea60156bd18b994710662" among others).
>=20
> Rygel will not keep running anymore when its "plugins"
> folder is absent or empty. Thus, to avoid disappointments,
> we now RRECOMMEND at least the "media-export" plugin.

Please resend with -M and libunistring dependency or PACKAGECONFIG.

rygel: rygel-plugin-media-export rdepends on libunistring, but it isn't a b=
uild dependency? [build-deps]

>=20
> Signed-off-by: Manuel Bachmann <mbc@iot.bzh>
> ---
>  .../recipes-connectivity/rygel/rygel_0.26.1.bb     |   58 --------------=
-----
>  .../recipes-connectivity/rygel/rygel_0.28.2.bb     |   59 ++++++++++++++=
++++++
>  2 files changed, 59 insertions(+), 58 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-connectivity/rygel/rygel_0.26=
=2E1.bb
>  create mode 100644 meta-multimedia/recipes-connectivity/rygel/rygel_0.28=
=2E2.bb
>=20
> diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb b=
/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
> deleted file mode 100644
> index af3f2be..0000000
> --- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -SUMMARY =3D "A UPnP AV media server and renderer"
> -DESCRIPTION =3D "Rygel is a home media solution (UPnP AV MediaServer) th=
at \
> -allow you to easily share audio, video and pictures to other devices. \
> -Additionally, media player software may use Rygel to become a MediaRende=
rer \
> -that may be controlled remotely by a UPnP or DLNA Controller."
> -HOMEPAGE =3D "http://live.gnome.org/Rygel"
> -
> -LICENSE =3D "LGPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522=
ec2 \
> -                    file://src/rygel/rygel-main.vala;endline=3D25;md5=3D=
a4cce4d389da1c1638fe68d07ae9d811"
> -
> -DEPENDS =3D "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1=
=2E0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0"
> -RDEPENDS_${PN} =3D "gstreamer1.0-plugins-base-playback shared-mime-info"
> -
> -GNOME_COMPRESS_TYPE =3D "xz"
> -SRC_URI[archive.md5sum] =3D "f182d54913a528bb5b4fb2f291aca0fc"
> -SRC_URI[archive.sha256sum] =3D "390740609e34399b886ddb9a8f7eca25055ad720=
48dfdd869edf02999b1e1d8f"
> -
> -inherit gnomebase vala
> -
> -EXTRA_OECONF =3D "--disable-introspection --disable-tracker-plugin --wit=
h-media-engine=3Dgstreamer"
> -
> -PACKAGECONFIG ?=3D "external mpris mediathek ruih media-export gst-launc=
h gtk+3"
> -PACKAGECONFIG[external] =3D "--enable-external-plugin,--disable-external=
-plugin"
> -PACKAGECONFIG[mpris] =3D "--enable-mpris-plugin,--disable-mpris-plugin"
> -PACKAGECONFIG[mediathek] =3D "--enable-mediathek-plugin,--disable-mediat=
hek-plugin"
> -PACKAGECONFIG[ruih] =3D "--enable-ruih-plugin,--disable-ruih-plugin"
> -PACKAGECONFIG[media-export] =3D "--enable-media-export-plugin,--disable-=
media-export-plugin,sqlite3"
> -PACKAGECONFIG[gst-launch] =3D "--enable-gst-launch-plugin,--disable-gst-=
launch-plugin"
> -PACKAGECONFIG[gtk+3] =3D ",--without-ui,gtk+3"
> -
> -LIBV =3D "2.6"
> -
> -do_install_append() {
> -       # Remove .la files for loadable modules
> -       rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
> -       rm -f ${D}/${libdir}/rygel-${LIBV}/plugins/*.la
> -}
> -
> -FILES_${PN} +=3D "${libdir}/rygel-${LIBV}/engines ${datadir}/dbus-1 ${da=
tadir}/icons"
> -FILES_${PN}-dbg +=3D "${libdir}/rygel-${LIBV}/engines/.debug ${libdir}/r=
ygel-${LIBV}/plugins/.debug"
> -
> -PACKAGES +=3D "${PN}-meta"
> -ALLOW_EMPTY_${PN}-meta =3D "1"
> -
> -PACKAGES_DYNAMIC =3D "${PN}-plugin-*"
> -
> -python populate_packages_prepend () {
> -    rygel_libdir =3D d.expand('${libdir}/rygel-${LIBV}')
> -    postinst =3D d.getVar('plugin_postinst', True)
> -    pkgs =3D []
> -
> -    pkgs +=3D do_split_packages(d, oe.path.join(rygel_libdir, "plugins")=
, 'librygel-(.*)\.so$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s',=
 postinst=3Dpostinst, extra_depends=3Dd.expand('${PN}'))
> -    pkgs +=3D do_split_packages(d, oe.path.join(rygel_libdir, "plugins")=
, '(.*)\.plugin$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s', post=
inst=3Dpostinst, extra_depends=3Dd.expand('${PN}'))
> -
> -    metapkg =3D d.getVar('PN', True) + '-meta'
> -    d.setVar('RDEPENDS_' + metapkg, ' '.join(pkgs))
> -}
> diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb b=
/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
> new file mode 100644
> index 0000000..f1c47a0
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
> @@ -0,0 +1,59 @@
> +SUMMARY =3D "A UPnP AV media server and renderer"
> +DESCRIPTION =3D "Rygel is a home media solution (UPnP AV MediaServer) th=
at \
> +allow you to easily share audio, video and pictures to other devices. \
> +Additionally, media player software may use Rygel to become a MediaRende=
rer \
> +that may be controlled remotely by a UPnP or DLNA Controller."
> +HOMEPAGE =3D "http://live.gnome.org/Rygel"
> +
> +LICENSE =3D "LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522=
ec2 \
> +                    file://src/rygel/rygel-main.vala;endline=3D27;md5=3D=
99324118da4c012d25edae2f779ae9b3"
> +
> +DEPENDS =3D "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1=
=2E0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0"
> +RDEPENDS_${PN} =3D "gstreamer1.0-plugins-base-playback shared-mime-info"
> +RRECOMMENDS_${PN} =3D "rygel-plugin-media-export"
> +
> +GNOME_COMPRESS_TYPE =3D "xz"
> +SRC_URI[archive.md5sum] =3D "9fbe4fb53b6cfa2f3f3723b7649a2215"
> +SRC_URI[archive.sha256sum] =3D "9ea23df7186caac5f1aad3137edf6d507d339b9a=
469fc3133df4043fa66b61f5"
> +
> +inherit gnomebase vala
> +
> +EXTRA_OECONF =3D "--disable-introspection --disable-tracker-plugin --wit=
h-media-engine=3Dgstreamer"
> +
> +PACKAGECONFIG ?=3D "external mpris mediathek ruih media-export gst-launc=
h gtk+3"
> +PACKAGECONFIG[external] =3D "--enable-external-plugin,--disable-external=
-plugin"
> +PACKAGECONFIG[mpris] =3D "--enable-mpris-plugin,--disable-mpris-plugin"
> +PACKAGECONFIG[mediathek] =3D "--enable-mediathek-plugin,--disable-mediat=
hek-plugin"
> +PACKAGECONFIG[ruih] =3D "--enable-ruih-plugin,--disable-ruih-plugin"
> +PACKAGECONFIG[media-export] =3D "--enable-media-export-plugin,--disable-=
media-export-plugin,sqlite3"
> +PACKAGECONFIG[gst-launch] =3D "--enable-gst-launch-plugin,--disable-gst-=
launch-plugin"
> +PACKAGECONFIG[gtk+3] =3D ",--without-ui,gtk+3"
> +
> +LIBV =3D "2.6"
> +
> +do_install_append() {
> +       # Remove .la files for loadable modules
> +       rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
> +       rm -f ${D}/${libdir}/rygel-${LIBV}/plugins/*.la
> +}
> +
> +FILES_${PN} +=3D "${libdir}/rygel-${LIBV}/engines ${datadir}/dbus-1 ${da=
tadir}/icons"
> +FILES_${PN}-dbg +=3D "${libdir}/rygel-${LIBV}/engines/.debug ${libdir}/r=
ygel-${LIBV}/plugins/.debug"
> +
> +PACKAGES +=3D "${PN}-meta"
> +ALLOW_EMPTY_${PN}-meta =3D "1"
> +
> +PACKAGES_DYNAMIC =3D "${PN}-plugin-*"
> +
> +python populate_packages_prepend () {
> +    rygel_libdir =3D d.expand('${libdir}/rygel-${LIBV}')
> +    postinst =3D d.getVar('plugin_postinst', True)
> +    pkgs =3D []
> +
> +    pkgs +=3D do_split_packages(d, oe.path.join(rygel_libdir, "plugins")=
, 'librygel-(.*)\.so$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s',=
 postinst=3Dpostinst, extra_depends=3Dd.expand('${PN}'))
> +    pkgs +=3D do_split_packages(d, oe.path.join(rygel_libdir, "plugins")=
, '(.*)\.plugin$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s', post=
inst=3Dpostinst, extra_depends=3Dd.expand('${PN}'))
> +
> +    metapkg =3D d.getVar('PN', True) + '-meta'
> +    d.setVar('RDEPENDS_' + metapkg, ' '.join(pkgs))
> +}
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z+pzSjdB7cqptWpS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlao0NwACgkQN1Ujt2V2gByvZwCcDmM35XljuuHDYyMdQ5RcTNt2
JGkAoI05sLJG4aOyR/mPc9QACObDzyc8
=Wg7d
-----END PGP SIGNATURE-----

--z+pzSjdB7cqptWpS--
