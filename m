Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OkewK-000860-Vc for openembedded-devel@lists.openembedded.org;
	Sun, 15 Aug 2010 17:17:12 +0200
Received: from f053041205.adsl.alicedsl.de ([78.53.41.205]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Okevr-00060K-NR for openembedded-devel@lists.openembedded.org;
	Sun, 15 Aug 2010 15:15:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
Date: Sun, 15 Aug 2010 17:15:27 +0200
Message-ID: <1281885327.3693.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Sun, 15 Aug 2010 15:17:44 -0000
X-List-Received-Date: Sun, 15 Aug 2010 15:17:44 -0000
X-Groupsio-MsgNum: 22205
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-XLzfcX+tjOrwhhl5limP"

--=-XLzfcX+tjOrwhhl5limP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Frans,


Am Sonntag, den 15.08.2010, 16:59 +0200 schrieb Frans Meulenbroeks:

> As some of you might have noticed I've been cleaning up our
> recipes.during the last week or so.
> As I had some time at hand this weekend, lots of cleaning has been done.
> I did my very best to stay within the guidelines of the TSC (as
> described in http://lists.linuxtogo.org/pipermail/openembedded-devel/2010=
-May/020047.html),
> but it is quite possible that at some point I made a mistake or so.
> If so, let me know and I'll repair things and/or revert the commit. (I
> feel if you make a mess you should also clean it yourself).

thank you for doing this =E2=80=9Cboring=E2=80=9D and unrewarding(?) task. =
I appreciate
it.

In your commit summary I would just have listed the removed version, so
people wondering where it had gone, could see it in the log more easily.
But I guess everyone knows how to search for the recipe name and look
what that commit changed.

[=E2=80=A6]


Thanks,

Paul

--=-XLzfcX+tjOrwhhl5limP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxoBIkACgkQPX1aK2wOHVg4fACeIwDZ89FDrMNmkfcxZ/YsMasI
jsEAn1z8vPFP3CFzeTfX4RHpvIFx3vS4
=EbxT
-----END PGP SIGNATURE-----

--=-XLzfcX+tjOrwhhl5limP--
