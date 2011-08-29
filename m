Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qxz7P-00056t-E2 for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 12:31:03 +0200
Received: from f053042163.adsl.alicedsl.de ([78.53.42.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qxz2k-0006gw-1p for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 10:26:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2011 12:26:02 +0200
In-Reply-To: <1313665760-21930-1-git-send-email-noor_ahsan@mentor.com>
References: <1313665760-21930-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314613573.6949.13.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH][meta-oe] python-lxml: Added new recipe in meta-oe for 2.2.8 version
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
X-List-Received-Date: Mon, 29 Aug 2011 10:31:03 -0000
X-Groupsio-MsgNum: 33864
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-MU2WLlijicwWmp+n6zT3"

--=-MU2WLlijicwWmp+n6zT3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Noor,


Am Donnerstag, den 18.08.2011, 16:09 +0500 schrieb Noor, Ahsan:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>=20
> * Added new recipe in meta-oe for 2.2.8 version

I am sorry your patch has not gotten any review and has not been pushed
to meta-oe. It would be nice though, if you could take general comments
to your other patches and apply those to for example this patch.

1. Please update the commit summary.
2. Please remove the redundant line from the commit message=E2=80=99s body.
3. Please note that you got the recipe from oe.dev. I guess you did, did
not you?
(4. Include what build and run time environment you used for testing.)
5. Now that you have got the set up to send pull requests you can then
send that a version v2 with a pull request.

> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>

With my comments addressed you can add

	Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>

to the commit message.

I am sorry that you have to resend it, but reviewing and writing
comments also takes a lot of time, people tend to not have a lot of.
Luckily Git (`git commit --amend` or `git rebase -i =E2=80=A6`) makes it ea=
sy
for you to improve patches, so it only should take a few minutes.


Thanks,

Paul

--=-MU2WLlijicwWmp+n6zT3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5baTsACgkQPX1aK2wOHVh1VwCfQrzzQuwkslwWLp40Dv6bdHw5
uHUAnRF7mEnv5F36CKkh3xTcYPwhOwJw
=eNs9
-----END PGP SIGNATURE-----

--=-MU2WLlijicwWmp+n6zT3--
