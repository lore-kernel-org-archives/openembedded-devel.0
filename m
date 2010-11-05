Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEV0L-0006Ue-Ql for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 23:43:31 +0100
Received: from f053040076.adsl.alicedsl.de ([78.53.40.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEUzW-00027c-8e for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 22:42:38 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1288995940-1827-1-git-send-email-angelo@pynell.com>
References: <angelo@pynell.com>
	<1288995940-1827-1-git-send-email-angelo@pynell.com>
Date: Fri, 05 Nov 2010 23:42:37 +0100
Message-ID: <1288996957.4113.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] recipes/fluxbox/fluxbox_1.1.1.bb - Fixed depends for libxpm recipes/initscripts/file/halt - Fixed poweroff when booted from NFS
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
X-List-Received-Date: Fri, 05 Nov 2010 22:43:31 -0000
X-Groupsio-MsgNum: 25936
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-kbg+FJ82bLksY8YwvPsA"

--=-kbg+FJ82bLksY8YwvPsA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 05.11.2010, 20:25 -0200 schrieb Angelo S. Mavridis Bartolom=
e:
> * Fix to halt courtesy by penghb,patch by angelox_123
> * Fix to fluxbox compile with libxpm by angelox_123

Where are the nicknames from? IRC?

> Signed-off-by: Angelo S. Mavridis Bartolome <angelo@pynell.com>
> ---
>  recipes/fluxbox/fluxbox_1.1.1.bb |    2 +-
>  recipes/initscripts/files/halt   |    2 +-

[=E2=80=A6]

Please send a patch for each change. You could

	git commit patch/to/changed/file

to create separate commits. Please only put the recipe name to the
beginning of the commit summary as demanded by OE=E2=80=99s commit policy [=
1].

I would love to see your build configuration and your build error in the
commit log too and, if you know it, a small comment why this fix is
needed. These files seem to have been around for quite some time so I
find it strange that these issues have not been surfaced earlier.


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Policy

--=-kbg+FJ82bLksY8YwvPsA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzUiFYACgkQPX1aK2wOHVi37ACeO9IMxl7E4kKEnoJUPHIBes6l
qgcAn1YtJmU5JwOtWgufyuJwalsRhCma
=IQQL
-----END PGP SIGNATURE-----

--=-kbg+FJ82bLksY8YwvPsA--
