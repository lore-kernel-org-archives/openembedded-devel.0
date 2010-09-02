Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Or9jo-0007Eu-Ie for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 15:21:57 +0200
Received: from f053037242.adsl.alicedsl.de ([78.53.37.242]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Or9jH-0000Cp-Bw for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 13:21:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinhxdSG3M3ddEa6Bgtbkp4Pg8H5MSxkUAgWGZUk@mail.gmail.com>
References: <AANLkTinhxdSG3M3ddEa6Bgtbkp4Pg8H5MSxkUAgWGZUk@mail.gmail.com>
Date: Thu, 02 Sep 2010 15:21:18 +0200
Message-ID: <1283433678.3990.37.camel@mattotaupa>
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
Subject: Re: git issues: `fatal: The remote end hung up unexpectedly` and small bandwidth
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
X-List-Received-Date: Thu, 02 Sep 2010 13:21:57 -0000
X-Groupsio-MsgNum: 23075
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-dtx9mHE63qWU36+PaYcM"

--=-dtx9mHE63qWU36+PaYcM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 02.09.2010, 14:59 +0200 schrieb Frans Meulenbroeks:
> For some reason recently every once in a while on a git pull or git
> clone I get an error like this:
>=20
> git clone git://git.openembedded.net/openembedded openembedded
> Initialized empty Git repository in
> /home/frans/workspace/Linux/openembedded-test/openembedded/.git/
> fatal: The remote end hung up unexpectedly
> make: *** [all] Error 128
>=20
> Repeating the command often makes it work.

I experience the same without the `make` line. (You probably use some
Makefile to update your repository.)

> Also I notice that the transfer rate is about 100-120 KB/s
> I seem to recall Leon also reported something like this with irc.

I do not know about this, since I only update my repository fairly
often, so changes are small.

> Is this something others see as well?
> Especially the hangup does not really help to set up an automated test sy=
stem.


Thanks,

Paul

--=-dtx9mHE63qWU36+PaYcM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx/pM4ACgkQPX1aK2wOHVjFlgCcDAB1T/F4telwDFdM4NxdAxD9
p4wAmQHUIClurMnedn+/Pg8OhNzQFWc6
=JGgy
-----END PGP SIGNATURE-----

--=-dtx9mHE63qWU36+PaYcM--
