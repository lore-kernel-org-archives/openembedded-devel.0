Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SXJ27-0008LS-VA
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 May 2012 23:23:57 +0200
Received: by pbbrq2 with SMTP id rq2so9452535pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2012 14:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=buGC5bgDbO5hBSYdiCYbj++JEg5pi0vhoRS+x1Lp7i8=;
	b=MYZLr5k/b2ORySa0jN2iRz6BiquwuhF7X4V6JlpP8e0ENkMl3KK+y7sfZZHT+a5f8Y
	qMqjQQBcxQEiKrHsdGTGLPvOrVapEFeuZIiJ8JhYGMijc5F/GWjDA6yWCULPmoW0mW/q
	y3Cwitk4Ab0Uz/3Y+IdTgOO6GCSFwtgsyHqUR87X27d7GKqS8xLJMr2ilz/LVw7G3QZB
	SZzWMRPjFQILvAYGCaiIKb/FxMZkLezhV6K34O1qcwSbmXlwHpvsJpQsgWKt2B9elPkv
	B72mYUF14WjZ0EmQUWcp17kmOJnenOIFcV/hsqQt18mM0LaYdeoya+9OtJ6+JutKM56d
	a8pw==
Received: by 10.68.192.5 with SMTP id hc5mr7259889pbc.49.1337807620676;
	Wed, 23 May 2012 14:13:40 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id py5sm3022250pbb.1.2012.05.23.14.13.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 14:13:38 -0700 (PDT)
Date: Wed, 23 May 2012 14:13:38 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120523211338.GA13334@bill-the-cat>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCHv2 00/70] [2011.03-maintenance] Pull request 20120521
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
X-List-Received-Date: Wed, 23 May 2012 21:24:02 -0000
X-Groupsio-MsgNum: 39012
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 21, 2012 at 09:28:59AM -0500, Chase Maupin wrote:
> All,
>=20
> Updated in version2
>     * Split the libtasn changes into one change for the licensing and
>       another change to inherit lib_package.
>     * Modified the commit messages to add the license settings.
>     * This was to address feedback from Paul Menzel.
>=20
> The following changes since commit 36a56cbb69cda0c89f478e01183d61c6a66525=
c9:
>   Steffen Sledz (1):
>         icedtea6-native-1.7.10: backport S7103224
>=20
> are available in the git repository at:
>=20
>   http://arago-project.org/git/projects/arago-oe-amsdk.git update-licenses
>=20
> Chase Maupin (70):
>       gnutls: update LICENSE setting to GPLv3 and LGPLv2.1
>       libtasn1: update LICENSE setting to GPLv3 and LGPLv2.1
>       libtasn1: inherit lib_package to split GPLv3 packages
>       bonnie: Update LICENSE field version to GPLv2
>       canutils: Update LICENSE field version GPLv2
>       debianutils: Update LICENSE field version GPLv2
>       gtk+: Update LICENSE field version for 2.20.1 to LGPLv2
>       gnome-keyring: Update LICENSE field version to GPLv2
>       gnome-vfs: Update LICENSE field version to GPLv2
>       hicolor-icon-theme: Update LICENSE field version to GPLv2
>       hostap-daemon: Update LICENSE field version to GPLv2
>       liba52: Update LICENSE field version to GPLv2
>       atk: Update LICENSE field version to GPLv2
>       audiofile: Update LICENSE field version to GPLv2 and LGPLv2
>       avahi: Update LICENSE field version to GPLv2 and LGPLv2.1
>       cairo: Update LICENSE field version to MPL-1 and LGPLv2.1
>       libcap2: Update LICENSE field version to GPLv2 or BSD
>       libcroco: Update LICENSE field version to LGPLv2 and LGPLv2.1
>       esound: Update LICENSE field version to LGPLv2
>       faac: Update LICENSE field version to LGPLv2
>       faad2: Update LICENSE field version to GPLv2
>       flac: Update LICENSE field version to GPLv2 and LGPLv2.1
>       libgcrypt: Update LICENSE field version to GPLv2 and LGPLv2.1
>       gdbm: Update LICENSE field version to GPLv2
>       libgpg-error: Update LICENSE field version to GPLv2 and LGPLv2.1
>       libical: Update LICENSE field version to LGPLv2.1 or MPL-1
>       libid3tag: Update LICENSE field version to GPLv2
>       libidl: Update LICENSE field version to LGPLv2
>       libmad: Update LICENSE field version to GPLv2
>       libmodplug: Update LICENSE field version to PD
>       lame: Update LICENSE field version to LGPLv2
>       mpeg2dec: Update LICENSE field version to GPLv2
>       mysql5: Update LICENSE field version to GPLv2
>       libnl: Update LICENSE field version to LGPLv2.1
>       libproxy: Update LICENSE field version to LGPLv2.1
>       librsvg: Update LICENSE field version to LGPLv2
>       libsamplerate0: Update LICENSE field version to GPLv2
>       schroedinger: Update LICENSE field version to GPLv2 and LPGLv2
>       libsdl: Update LICENSE field version to LGPLv2.1
>       libsidplay: Update LICENSE field version to GPLv2
>       libsndfile1: Update LICENSE field version to LGPLv2.1
>       libsocketcan: Update LICENSE field version to LGPLv2.1
>       libsoup-2.4: Update LICENSE field version to LGPLv2
>       libvisual: Update LICENSE field version to LGPLv2.1
>       x264: Update LICENSE field version to GPLv2
>       libxv: Update LICENSE field version to MIT-style
>       lmbench: Update LICENSE field version to GPLv2
>       makedevs: Update LICENSE field version to GPLv2
>       nfs-utils: Update LICENSE field version to GPLv2
>       orbit2: Update LICENSE field version to GPLv2
>       pango: Update LICENSE field version to LGPLv2
>       shared-mime-info: Update LICENSE field version to GPLv2
>       wireless-tools: Update LICENSE field version to GPLv2 and LGPLv2.1
>       gnome-common: Update LICENSE field version to GPLv3
>       cups: Update LICENSE field version to GPLv2 and LGPLv2
>       gnome-mime-data: Update LICENSE field version to GPLv2
>       gtk-doc: Update LICENSE field version to LGPLv2
>       intltool: Update LICENSE field version to GPLv2
>       libart-lgpl: Update LICENSE field version to LGPLv2
>       libdaemon: Update LICENSE field version to LGPLv2.1
>       libdiscid: Update LICENSE field version to LGPLv2.1
>       libglade: Update LICENSE field version to LGPLv2
>       libmikmod: Update LICENSE field version to LGPLv2.1
>       libmusicbrainz: Update LICENSE field version to LGPLv2.1
>       neon: Update LICENSE field version to LGPLv2
>       libnfnetlink: Update LICENSE field version to GPLv2
>       python-pycairo: Update LICENSE field version to LGPLv2.1
>       python-pygobject: Update LICENSE field version to LGPLv2.1
>       python-pygtk: Update LICENSE field version to LGPLv2.1
>       time: Update LICENSE field version to GPLv2

Applied, thanks.

--=20
Tom

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk+9UwIACgkQdZngf2G4WwMjwgCeI9nZjaeohDFL397MaXi3bWCf
bhUAoItPb8SmXa2Ntfx1785tosiWZKqU
=Dbzg
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
