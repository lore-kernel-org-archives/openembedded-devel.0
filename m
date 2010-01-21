Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NXtc0-0007Ic-Dp for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 10:46:03 +0100
Received: from f053040193.adsl.alicedsl.de ([78.53.40.193]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NXtZp-0000PJ-LN for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 09:43:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jan 2010 10:43:44 +0100
Message-ID: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Getting patches committed
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
X-List-Received-Date: Thu, 21 Jan 2010 09:46:03 -0000
X-Groupsio-MsgNum: 15951
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Xb7lyDcnTZLdWOzrRrF2"

--=-Xb7lyDcnTZLdWOzrRrF2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE developers,


during the last week (or two) I have the feeling that a lot of patches
are send to the list by developers with no commit access and they are
not reviewed, commented or committed.

I am well aware that you all have better or more important things to do.
But the problem is you are the only one who can commit this stuff.

There is also Patchwork, where you can see what patches are sitting on
the list.

So now my question is, is there a temporary reason for this lack of time
by developers or is that a fundamental problem so a solution is needed?

1. It looks like nobody of the developers is using Patchwork yet. It
looks like everybody can register an account and update the statuses. Is
there a demand for it? Maybe we can find some non-developers (including
me) volunteering to do this?

2. Is there a way to have a staging branch where all patches are
committed to, which have not been reviewed for let us say one week, to
get more testing and before they go into the dev branch? Maybe it is
easier for people to at least test build such a branch?

Sorry if I made wrong assumptions and there is no problem at all.


Thanks,

Paul


[1] http://patchwork.openembedded.org/project/openembedded/list/

--=-Xb7lyDcnTZLdWOzrRrF2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktYIckACgkQPX1aK2wOHVghGgCeNJRjE6fsDVVoTd5pgnVBmrZM
nMoAn1yQ4DKgLgFvKad4OQDCxwmsZYP+
=bYdk
-----END PGP SIGNATURE-----

--=-Xb7lyDcnTZLdWOzrRrF2--
