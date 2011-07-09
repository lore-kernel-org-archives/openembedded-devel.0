Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QfY3a-0005uR-Bc for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 15:58:54 +0200
Received: from f053045224.adsl.alicedsl.de ([78.53.45.224]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QfY0F-0000On-Mr for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 13:55:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1310217452.54283.YahooMailNeo@web27502.mail.ukl.yahoo.com>
References: <1309949864.34662.YahooMailRC@web27502.mail.ukl.yahoo.com>
	<1310217452.54283.YahooMailNeo@web27502.mail.ukl.yahoo.com>
Date: Sat, 09 Jul 2011 15:55:00 +0200
Message-ID: <1310219700.4123.127.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: update proposals
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
X-List-Received-Date: Sat, 09 Jul 2011 13:58:54 -0000
X-Groupsio-MsgNum: 33092
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-GJl7OLeOHXChXGpRygRr"

--=-GJl7OLeOHXChXGpRygRr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Fabien,


Am Samstag, den 09.07.2011, 14:17 +0100 schrieb fabien comte:

> This archive contain some updates for recipes. Could you integrate it ?

thank you for your updates. Unfortunately we cannot integrate those as
is, because they do not follow our commit policy [1].

Please submit each change separately with a description of the problem,
the solution and your Signed-off-by line.

> All are ok but I cannot rebuild jamvm 1.5.4 since icedted build fails.
> Could you fix icedted if you want that I test jamvm again (i did it
> few month before and it worked) ?

Please open a new thread for this problem with a descriptive subject
line so that people can help you [3].
=20
> I hope that it will help some users.

Thank you for your improvements and hopefully you can spend another our
to format your updates correctly so that we can include them.


Thanks,

Paul


[1] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded
[2] http://openembedded.org/index.php/Commit_Policy
[3] http://en.opensuse.org/openSUSE:Mailing_list_netiquette

--=-GJl7OLeOHXChXGpRygRr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4YXbQACgkQPX1aK2wOHVg8/ACeI7xiv1bV8SGwAaf6vE7fBJD+
vTEAn0p8PjFM36X9ClY9ul4fkyle/Igv
=/WhZ
-----END PGP SIGNATURE-----

--=-GJl7OLeOHXChXGpRygRr--
