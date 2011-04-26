Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEeFA-0008CD-NH for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 11:07:40 +0200
Received: from f053033081.adsl.alicedsl.de ([78.53.33.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEeDW-00057l-HJ for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 09:05:58 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201104252134.42402.sgh@sgh.dk>
References: <1303725452-1908-1-git-send-email-sgh@sgh.dk>
	<201104251229.57261.sgh@sgh.dk> <1303743329.15311.29.camel@mattotaupa>
	<201104252134.42402.sgh@sgh.dk>
Date: Tue, 26 Apr 2011 11:05:11 +0200
Message-ID: <1303808711.4073.37.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] wvstreams: Added recipe for wxstreams 4.6.1.
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
X-List-Received-Date: Tue, 26 Apr 2011 09:07:40 -0000
X-Groupsio-MsgNum: 31465
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-pNc8zPJE0TU8An4E3Pqo"

--=-pNc8zPJE0TU8An4E3Pqo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 25.04.2011, 21:34 +0200 schrieb S=C3=B8ren Holm:
> Is there a document describing the workflow around patchwork?

I am not sure. There is only the Wiki page in OpenEmbedded [1]. Here is
a small summary.

1. An email address for Patchwork is subscribed to openembedded-devel. A
filter searches for patches send to the list and adds it to the patch
queue.
2. The state of these patches is tracked in a database and people need
to update the default state NEW to the current one.
3. Edits can be done after registration using the Web interface or the
command line tool `pwclient`.

> I'm a bit lost as to how it is supposed to work.

Sadly, only the patch submitters are allowed to change the states in the
patch queue. Therefore the submitters have to update the state of their
patches.


Thanks,

Paul


[1] http://openembedded.org/index.php/Patchwork

--=-pNc8zPJE0TU8An4E3Pqo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk22iscACgkQPX1aK2wOHVhFewCeO+p4UoQxHixaIFbbfcB444+L
xskAniecvbEyAAKrkcuBcI4HTbbWhqw8
=B0ee
-----END PGP SIGNATURE-----

--=-pNc8zPJE0TU8An4E3Pqo--
