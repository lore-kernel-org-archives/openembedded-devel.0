Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4uaT-0007Mq-Fn for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 14:01:09 +0200
Received: from f053041069.adsl.alicedsl.de ([78.53.41.69]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4ua6-000542-So for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 12:00:47 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Oct 2010 14:00:45 +0200
Message-ID: <1286712045.3808.47.camel@mattotaupa>
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
Subject: Why did the GObject Introspection build errors only surface on my build host?
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
X-List-Received-Date: Sun, 10 Oct 2010 12:01:09 -0000
X-Groupsio-MsgNum: 24603
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ds7weVhLkrTzJ6WhcBti"

--=-ds7weVhLkrTzJ6WhcBti
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


can you tell me why I am the only one being hit by the GObject
Introspection =E2=80=9Cbreakage=E2=80=9D?

I do not have GNOME or other development packages installed locally on
my build host. Might this be the problem?

I guess most of you are using the development branch and test the latest
changes.


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/02=
5271.html
    "Inclusion of `gobject-introspection` breaks several packages."

--=-ds7weVhLkrTzJ6WhcBti
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyxqu0ACgkQPX1aK2wOHVg2jgCfWpZo0nsSewYvHfp/051dNwkq
RTsAn2rSD2xMA8BRlcfVursv82XA8beM
=s1Lq
-----END PGP SIGNATURE-----

--=-ds7weVhLkrTzJ6WhcBti--
