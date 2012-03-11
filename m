Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1S6m4W-0003W2-TG for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2012 17:56:40 +0100
Received: from f053036207.adsl.alicedsl.de ([78.53.36.207]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1S6lwM-0002dC-VO for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2012 16:48:15 +0000
Message-ID: <1331484468.3414.34.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2012 17:47:48 +0100
In-Reply-To: <1329916893.4422.8.camel@jethro.cheepee.homedns.org>
References: <1329869118-16435-1-git-send-email-cheepeero@gmx.net>
	<ji29qe$565$1@dough.gmane.org>
	<1329916893.4422.8.camel@jethro.cheepee.homedns.org>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH v2] v4l-utils: skip qv4l2 instead of using host toolchain
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
X-List-Received-Date: Sun, 11 Mar 2012 16:56:41 -0000
X-Groupsio-MsgNum: 37721
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-yFFKpXfb1SG2Bo/MjOwf"

--=-yFFKpXfb1SG2Bo/MjOwf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ciprian,


thank you for your patch, but please adhere to the netiquette [1]. In
particular please use interleaved quoting style.


Am Mittwoch, den 22.02.2012, 15:21 +0200 schrieb Ciprian Ciubotariu:

> On Wed, 2012-02-22 at 09:42 +0100, Koen Kooi wrote:
> >=20
> > Op 22-02-12 01:05, Ciprian Ciubotariu schreef:
> > > See #2134
> >=20
> > What does that mean?
>
> It's a reference to our internal issue tracker, which scans commit
> messages for such 'See #blah' references and makes a nice list of
> commits attached to each issue.
>=20
> I can strip that if needed.
>=20
> I was actually wondering how one can obey commit policies of more than
> one community, and still make use of git's DSCM abilities.

Well you could provide more context so that it does not disturb the
reader. Either appending

        =C2=BBThis issue is reported as ticket #2134 in the internal issue
        tracker of *your company name*.=C2=AB

or including it with more context in the commit message.

Additionally more importantly your patch is missing the Signed-off-by
line.


Thanks,

Paul


[1] http://en.opensuse.org/openSUSE:Mailing_list_netiquette

--=-yFFKpXfb1SG2Bo/MjOwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAk9c1zQACgkQPX1aK2wOHVgn0gCfXY+D89m5o9pQmFnd+aI9iTni
B9UAniLLfSYwNe8zmgVlZuAI802W16cK
=naVl
-----END PGP SIGNATURE-----

--=-yFFKpXfb1SG2Bo/MjOwf--
