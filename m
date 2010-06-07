Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OLhbF-0001TP-3M for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 21:03:05 +0200
Received: from f053043155.adsl.alicedsl.de ([78.53.43.155]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OLhX5-0005Vu-6L for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 18:58:47 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimXv1jPzHaADkOFjcyT3zXHXYTMAugG0mtPBvWS@mail.gmail.com>
References: <AANLkTimXv1jPzHaADkOFjcyT3zXHXYTMAugG0mtPBvWS@mail.gmail.com>
Date: Mon, 07 Jun 2010 20:58:44 +0200
Message-ID: <1275937124.10350.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: new recipie for qt thumbwheel
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
X-List-Received-Date: Mon, 07 Jun 2010 19:03:05 -0000
X-Groupsio-MsgNum: 19978
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-NjlfU1rXR0/RJGu1gSWs"

--=-NjlfU1rXR0/RJGu1gSWs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear majo,


Am Montag, den 07.06.2010, 16:56 +0200 schrieb majo huber:

> we have made a new recipie for building the qt thumbwheel (a
> touchscreen encoder wheel for the qt library).

thanks a lot.

> I'd kindly request if anybody could push that to the dev branch.
> I'd also suggest to put it in a separate directory e.g. called qt_addons.

Could you please resend this properly formatted [1] so that the
developers can commit this easily? That=E2=80=99d be great.

Especially tag the subject with [PATCH], create your proposed directory
and provide a commit message. `git format-patch` and `git send-email`
help you doing this.


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Policy

--=-NjlfU1rXR0/RJGu1gSWs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkwNQV4ACgkQPX1aK2wOHVjm0ACfTSXFqOOG9BPzVs0Bc/dzD8mQ
q+kAn22nXAYU2uMb2NOhKYo2wuPOcBel
=X7Le
-----END PGP SIGNATURE-----

--=-NjlfU1rXR0/RJGu1gSWs--
