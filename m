Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PlMey-0004Me-Vy for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 15:29:17 +0100
Received: from f053034071.adsl.alicedsl.de ([78.53.34.71]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PlMe5-0007rN-9z for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 14:28:21 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1296469935-30638-1-git-send-email-fabian@progra.de>
References: <1296209389-20272-1-git-send-email-fabian@progra.de>
	<1296469935-30638-1-git-send-email-fabian@progra.de>
Date: Fri, 04 Feb 2011 15:28:21 +0100
Message-ID: <1296829701.3967.23.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH v2] totem-pl-parser_2.30.0: fix configure without gobject introspection
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
X-List-Received-Date: Fri, 04 Feb 2011 14:29:17 -0000
X-Groupsio-MsgNum: 28819
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-5PvJN3t3c/qsx9gyaBQA"

--=-5PvJN3t3c/qsx9gyaBQA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 31.01.2011, 11:32 +0100 schrieb Fabian Ruff:
> this bugfix removes the configure error:
>   HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
>=20
> Signed-off-by: Fabian Ruff <fabian@progra.de>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
Tested-by: Paul Menzel <paulepanter@users.sourceforge.net>
  `angstrom-2008.1` for `MACHINE =3D "beagleboard"`

[=E2=80=A6]

Someone else has to commit and push [1], since I have no commit access.


Thanks,

Paul


PS: It would be nice if you could respond to my question in my last
message.


[1] http://patches.openembedded.org/patch/409/

--=-5PvJN3t3c/qsx9gyaBQA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1MDQUACgkQPX1aK2wOHVhDcACfRQ1y3TFxGtfC83ZdG1WNUfVl
FhIAoILR4x1e2MeOzDO+h//87EtYd9Hf
=FpWZ
-----END PGP SIGNATURE-----

--=-5PvJN3t3c/qsx9gyaBQA--
