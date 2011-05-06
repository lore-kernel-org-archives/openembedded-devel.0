Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIT0c-0000gL-Va for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 23:56:26 +0200
Received: from f053032229.adsl.alicedsl.de ([78.53.32.229]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QISzA-000215-Uv for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 21:54:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <iq0f30$tm6$1@dough.gmane.org>
References: <1304324573-31754-1-git-send-email-koen@openembedded.org>
	<1304337015.3949.62.camel@mattotaupa>	<1304340997.3949.64.camel@mattotaupa>
	<1304673598.4041.17.camel@mattotaupa>  <iq0f30$tm6$1@dough.gmane.org>
Date: Fri, 06 May 2011 23:53:46 +0200
Message-ID: <1304718826.3928.14.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] systemd: update to v26
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
X-List-Received-Date: Fri, 06 May 2011 21:56:27 -0000
X-Groupsio-MsgNum: 31670
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-eiCv2Q10+Oet9cqqQfN/"

--=-eiCv2Q10+Oet9cqqQfN/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 06.05.2011, 11:30 +0200 schrieb Koen Kooi:

> On 06-05-11 11:19, Paul Menzel wrote:

[=E2=80=A6]

> > why did you ignore my comments and pushed anyway in 1f14659d [1]?
>=20
> You might have noticed that the patch I pushed is quite different from
> the one I sent to this list.

Right. Still there were parts I had commented on that were the same and
you did not fix [1][2].

> Anyway, Henning OK'd the patch:
>=20
> 10:00 < koen> woglinde_: OK to commit the patch so you can fix up epoll
> later?
> 10:01 < woglinde_> koen its booting
> 10:01 < woglinde_> so commit it
>=20
> And since he's the maintainer I pushed it.

Leaving aside that this is not documented anywhere (please do not get me
wrong, I am glad that Henning is the maintainer and you are improving
the recipe), you should have put his Acked-by line into the commit
message. How should I know otherwise?


Thanks and good night,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Db8f1b8e=
7c876d6171839dfee6e48a2b73df54002
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Def7114f=
6ac9145eb31639cc65dfdc7f3615ece9e

--=-eiCv2Q10+Oet9cqqQfN/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3EbeoACgkQPX1aK2wOHVhiMgCfdFUeA+eL24THeAU5Elr+SWKa
Pp0AniQR4/rtJjCaXhqAUq2Pb9mgOsjz
=mS2v
-----END PGP SIGNATURE-----

--=-eiCv2Q10+Oet9cqqQfN/--
