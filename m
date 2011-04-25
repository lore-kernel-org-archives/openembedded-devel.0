Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QENEa-0003sG-Mw for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 16:57:56 +0200
Received: from f053045128.adsl.alicedsl.de ([78.53.45.128]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QENCw-0003Mg-1m for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 14:56:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201104251229.57261.sgh@sgh.dk>
References: <1303725452-1908-1-git-send-email-sgh@sgh.dk>
	<ip3h06$kfq$1@dough.gmane.org>  <201104251229.57261.sgh@sgh.dk>
Date: Mon, 25 Apr 2011 16:55:29 +0200
Message-ID: <1303743329.15311.29.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] wvstreams: Added recipe for wxstreams 4.6.1.
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
X-List-Received-Date: Mon, 25 Apr 2011 14:57:57 -0000
X-Groupsio-MsgNum: 31436
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-mdQe1JyyenWUwsEU3J6l"

--=-mdQe1JyyenWUwsEU3J6l
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 25.04.2011, 12:29 +0200 schrieb S=C3=B8ren Holm:
> I will edit the recipe a bit. It is just a copy of the 4.6.0 recipe.

Please pass `-M -C -C` to `git format-patch` next time, so that copies
or renames are detected.

Please also add what build configurations you used for testing next
time. I have build 4.6.1 successfully in several configurations and I
pushed your patch [1].

Please update the patch queue [2] using the Web interface or the
following command.

	$ pwclient update -s Accepted -c aaf30cc3e147816c63e694ef65951b3cd2dc48c5 =
2815

Your earlier message was also recorded, so you could do something like
the following.

	$ pwclient update -s Superseded 2813

Please post a follow up patch (in a new thread) addressing the things
Koen pointed out.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Daaf30cc=
3e147816c63e694ef65951b3cd2dc48c5
[2] http://openembedded.org/index.php/Patchwork

--=-mdQe1JyyenWUwsEU3J6l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk21i2AACgkQPX1aK2wOHVgnJwCfXCU8keDGbGrLn9ho+DQEiRlE
pfcAn0Rib490RxhTWDTY1i+ve9zOAXvv
=mece
-----END PGP SIGNATURE-----

--=-mdQe1JyyenWUwsEU3J6l--
