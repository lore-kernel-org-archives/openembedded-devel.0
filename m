Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJMl9-0003Fp-UC for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 11:28:11 +0200
Received: from f053041075.adsl.alicedsl.de ([78.53.41.75]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJMjk-0004Oa-JB for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:26:44 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110509091348.GA32544@excalibur.local>
References: <cover.1304925139.git.stefan@buglabs.net>
	<dda8ff6c3b7e006ed3114bc7de15dbf8b1742313.1304925139.git.stefan@buglabs.net>
	<1304931412.3791.2.camel@mattotaupa>
	<20110509091348.GA32544@excalibur.local>
Date: Mon, 09 May 2011 11:25:28 +0200
Message-ID: <1304933128.3791.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 2011.03-maintenance 1/7] icedtea6-native_1.7.10: Remove reference to deleted patch.
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
X-List-Received-Date: Mon, 09 May 2011 09:28:12 -0000
X-Groupsio-MsgNum: 31787
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-j3OrJugbAChkMH5KcKBY"

--=-j3OrJugbAChkMH5KcKBY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Stefan,


Am Montag, den 09.05.2011, 11:13 +0200 schrieb Stefan Schmidt:

> On Mon, 2011-05-09 at 10:56, Paul Menzel wrote:
> >=20
> > Am Montag, den 09.05.2011, 09:29 +0200 schrieb Stefan Schmidt:
> > > From: Stefan Schmidt <stefan@buglabs.net>
> > >=20
> > > During my cherry-pick of Henning's patch from master I somehow b0rked=
 the commit
> > > by loosing this hunk that also deletes the reference to the deleted p=
atch file.
> >=20
> > why is not it possible to fix the borked commit using `git rebase` or
> > just squash this patch and Hennings and resend the pull request?
>=20
> Because the broken commit was in my _last_ pull request which already
> is pulled into the 2011.03 maintenance branch.
>=20
> As this is a public branch we can't rebase it and thus I'm going with
> an incremental fix. Hope that clears it up. Maybe the changelog should
> have been more clear that I meant an old commit already sitting in the
> tree.

thank you for the clarification. I guess the commit id of the borked
commit would be handy too.

> Normally I squash and rebase a lot on non-public or temp branches. :)

It is a great feature!


Thanks,

Paul

--=-j3OrJugbAChkMH5KcKBY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3HswgACgkQPX1aK2wOHViFBwCcClbs5KH54pIGySmwwYa2MX0b
N+MAn2MjrPO2EfQGUtmjjxS8TDTur2bu
=AHSh
-----END PGP SIGNATURE-----

--=-j3OrJugbAChkMH5KcKBY--
