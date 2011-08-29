Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qxzjz-0006EE-W1 for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 13:10:56 +0200
Received: from f053042163.adsl.alicedsl.de ([78.53.42.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QxzfL-00076J-3y for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 11:06:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2011 13:06:04 +0200
In-Reply-To: <989A078976CDAD4CB2DC976EEF70E2A5068A589E@eu2-mail.mgc.mentorg.com>
References: <989A078976CDAD4CB2DC976EEF70E2A5068A589E@eu2-mail.mgc.mentorg.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314615966.6949.19.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: benefits of sending full request against sending individual patches
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
X-List-Received-Date: Mon, 29 Aug 2011 11:10:56 -0000
X-Groupsio-MsgNum: 33867
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-rruUAn1BQnjkOZOb/aY7"

--=-rruUAn1BQnjkOZOb/aY7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Noor,


Am Montag, den 29.08.2011, 12:51 +0200 schrieb Ahsan, Noor:

> I was just wondering that what added benefit we get by sending pull
> request instead of sending patches. As I observed patches are still
> being sent on the mailing list along the pull request.

others will have more to say, but I guess it easier to apply them.
Instead of saving each patch and use `git am` to apply them, you can
just pull them at once.


Thanks,

Paul

--=-rruUAn1BQnjkOZOb/aY7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5bcp0ACgkQPX1aK2wOHVixCACeIguq3cXQ1ykyhXt8CknxPbGZ
334An0lEfySdKcpfPNvkz8Qfac/pdKkC
=Si2b
-----END PGP SIGNATURE-----

--=-rruUAn1BQnjkOZOb/aY7--
