Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P6hS4-0002tT-6U for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 12:23:52 +0200
Received: from f053038067.adsl.alicedsl.de ([78.53.38.67]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P6hRc-0002he-FB for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 10:23:24 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimdcdr2mSBOzaKJ2FTuR=KBbropdvobucfQx5Wx@mail.gmail.com>
References: <AANLkTimdcdr2mSBOzaKJ2FTuR=KBbropdvobucfQx5Wx@mail.gmail.com>
Date: Fri, 15 Oct 2010 12:23:22 +0200
Message-ID: <1287138202.4233.5.camel@mattotaupa>
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
Subject: Re: Bitbaking while modifying recipes
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
X-List-Received-Date: Fri, 15 Oct 2010 10:23:52 -0000
X-Groupsio-MsgNum: 24887
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-UxenofU9jhVutv/9KXzO"

--=-UxenofU9jhVutv/9KXzO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 14.10.2010, 13:14 -0700 schrieb Ash Charles:

> At what point in bitbaking a recipe is it safe to start modifying the
> recipe without risk of messing up the current bitbake build?  I often
> find myself kicking off a bitbake and then wanting to do some git
> operations in my openembedded recipes tree.  Previously I've resisted
> the urge to mess around until whatever is being bitbaked is done but I
> suspect that I'd be fine to make changes as soon as the parse step is
> completed.  Is this correct?

Yes, I think so. I am doing it this way, but I do not know for sure.


Thanks,

Paul

--=-UxenofU9jhVutv/9KXzO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky4K5oACgkQPX1aK2wOHVh54ACfaSlwoXkiz4xMBuV3vSqCqpBQ
xnUAn3IIFnoiLDu+rhukcxBPxdMokhKU
=w5c8
-----END PGP SIGNATURE-----

--=-UxenofU9jhVutv/9KXzO--
