Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P14Xl-0001ke-ED for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 23:50:33 +0200
Received: from g225082119.adsl.alicedsl.de ([92.225.82.119]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P14Xa-0006YA-Qh for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 21:50:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100928174541.200740@gmx.net>
References: <20100928174541.200740@gmx.net>
Date: Wed, 29 Sep 2010 23:50:17 +0200
Message-ID: <1285797017.27605.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [patch] cross keyword for automake warnings
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
X-List-Received-Date: Wed, 29 Sep 2010 21:50:35 -0000
X-Groupsio-MsgNum: 24191
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-cp5EIFyZwauT5aiWe/cK"

--=-cp5EIFyZwauT5aiWe/cK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 28.09.2010, 19:45 +0200 schrieb Alexander Stohr:
> each of the following two patches adds the "cross" keyword to the command=
 line option --warnings of the automake utility.

[=E2=80=A6]

> i only ran the one for 1.10.x on my build testbed.

If I understand you correctly your patches are actually for upstream
Automake and you just wanted to inform the OE folks? Do you want to have
comments? It is not exactly clear for me.

Anyway, since your patches are not applicable to the OE repository, I
set the state to =C2=BBNot Applicable=C2=AB.

	pwclient update -s "not applicable" 3086


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Patchwork

--=-cp5EIFyZwauT5aiWe/cK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyjtJkACgkQPX1aK2wOHVhpVgCcDKraeTHNHcJBBfCmR2gUn1a3
+QsAoIvMzK6YG2tbe4pnzMWMDDFsIW6t
=ImZ3
-----END PGP SIGNATURE-----

--=-cp5EIFyZwauT5aiWe/cK--
