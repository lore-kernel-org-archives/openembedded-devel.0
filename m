Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QlpVS-0007d0-BA for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 23:49:38 +0200
Received: from f053039182.adsl.alicedsl.de ([78.53.39.182]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QlpSR-0000ic-0d for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 21:46:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4E2F0089.2020103@softplc.com>
References: <4E2F0089.2020103@softplc.com>
Date: Tue, 26 Jul 2011 23:45:25 +0200
Message-ID: <1311716725.3735.563.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] enhance lib/oe/unpack.py for ".tar.lzma" files
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
X-List-Received-Date: Tue, 26 Jul 2011 21:49:38 -0000
X-Groupsio-MsgNum: 33342
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-PHr7OdvwhZDccTn4oXN8"

--=-PHr7OdvwhZDccTn4oXN8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 26.07.2011, 12:59 -0500 schrieb Dick Hollenbeck:
> The boys a mingw started packaging binutils as .tar.lzma files.
> This is the only trick I found to unpack them.  It works.
> (I am trying to revitalize canadian-sdk at newer component versions.)

Please follow the commit policy [1][2]. At least your Signed-off-by line
is missing and the commit summary does not follow the pattern(?).

Please resend your patch as =C2=BBv2=C2=AB [3] and update the state of your=
 patch
in the patch queue [4].

Otherwise your patch looks fine. Is it guaranteed that `tar` supports
`lzma`?


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Policy
[2] http://openembedded.org/index.php/Commit_log_example
[3] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded
[4] http://openembedded.org/index.php/Patchwork

--=-PHr7OdvwhZDccTn4oXN8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4vNXUACgkQPX1aK2wOHVjWcwCdHtuD5DW6RNYE4VpSdZQhJ/P5
mPgAn1wXWQffkdx6169zX4xaqVcKimPH
=YaBY
-----END PGP SIGNATURE-----

--=-PHr7OdvwhZDccTn4oXN8--
