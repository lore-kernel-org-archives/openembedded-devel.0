Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QPIuA-00017i-Cw for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 20:34:02 +0200
Received: from f053034074.adsl.alicedsl.de ([78.53.34.74]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QPIrZ-0002OJ-IE for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 18:31:21 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <irjgl2$jur$1@dough.gmane.org>
References: <1306336287-23286-1-git-send-email-eyalr@ti.com>
	<1306345185.4888.2.camel@mattotaupa>  <irjgl2$jur$1@dough.gmane.org>
Date: Wed, 25 May 2011 20:31:00 +0200
Message-ID: <1306348260.28917.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCHv2] wpa-gui-e: build the latest version from git sources
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
X-List-Received-Date: Wed, 25 May 2011 18:34:02 -0000
X-Groupsio-MsgNum: 32295
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-rKeaaHY78d3zj7chu7kK"

--=-rKeaaHY78d3zj7chu7kK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 25.05.2011, 20:09 +0200 schrieb Koen Kooi:

> On 25-05-11 19:39, Paul Menzel wrote:
> > Am Mittwoch, den 25.05.2011, 18:11 +0300 schrieb Eyal Reizer:
> >> Builds wpa-gui for qt4-embedded from the latest wpa-supplicant (0.8x)
> >> git sources
> >>
> >> update based on comments from comunity members.
> >=20
> > This is only useful for reviews and therefore should go after the `---`
> > so that it is not included into the commit message.
> >=20
> >> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> >> ---
> >>  recipes/wpa-supplicant/wpa-gui-e_git.bb |   29 ++++++++++++++++++++++=
+++++++
> >=20
> > Why do you use that recipe name?
>=20
> '-e' is for qt/e builds and '' or '-qt4' for qt4/x11 builds

[=E2=80=A6]

> >> +S =3D "${WORKDIR}/git/wpa_supplicant/wpa_gui-qt4"

So the Qt4 version is build?


Thanks,

Paul

--=-rKeaaHY78d3zj7chu7kK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3dSt4ACgkQPX1aK2wOHVgRzACfZ/Zh6h981djwJl1maA39Es8A
SXAAnjv1HXA0ypkDm/WVy/virM2Klj+c
=ZFsW
-----END PGP SIGNATURE-----

--=-rKeaaHY78d3zj7chu7kK--
