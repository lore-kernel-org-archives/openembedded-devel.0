Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYo9o-0008JQ-73 for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 23:08:43 +0100
Received: from e178248110.adsl.alicedsl.de ([85.178.248.110]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYo7b-0000iT-N6 for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 22:06:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B584F62.1050406@balister.org>
References: <4B584F62.1050406@balister.org>
Date: Sat, 23 Jan 2010 23:06:22 +0100
Message-ID: <1264284382.3738.175.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Using `git send-email` (was: Number 1 tip for getting your patch committed)
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
X-List-Received-Date: Sat, 23 Jan 2010 22:08:43 -0000
X-Groupsio-MsgNum: 16125
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-iu4DWLTR6FouIxa3hFw8"

--=-iu4DWLTR6FouIxa3hFw8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Sorry guys for spamming the list with my messages. But I want to get my
questions out to you so that I can scratch it from my list.]


Am Donnerstag, den 21.01.2010, 07:58 -0500 schrieb Philip Balister:
> Follow the commit log message policy at:
>=20
> http://wiki.openembedded.net/index.php/Commit_log_example
>=20
> and use git send-email to send the patch to the list. If you do this, it=20
> makes the act of retrieving the patch from patchwork trivial (see=20
> contrib/patchwprk/pw-am.sh).
>=20
> This leaves you in a position where you can discuss the patch with=20
> someone with commit access and they can easily apply and push the patch.

I have two problems with this.

Firstly using `git send-email` is nowhere mentioned in the commit policy
[1].

Secondly for a lot of people using `git send-email` is no option because
setup is too difficult, their MUA does not integrate well with `git
send-email` so the address book is not available, they do want to have
sent messages archived in their Sent folder, they want to ask some
questions regarding the patch and therefore need to write a message and
attach it.

In my opinion we should therefore find a way to also work easily with
attached patches having been created with `git format-patch`. Can some
of the developers mention what the disadvantage of attached patches is.
You can easily quote them to and saving and applying should be as easy
as with messages sent using `git send-email`.

The only disadvantage I can think of seems to be that it is not
displayed in the mailing list archive.

And of course that it is not easy to retrieve them from Patchwork. If
that is the only obstacle I would try to contact the Patchwork hackers
and ask them to implement an option to retrieve the attachment if it has
for example the extension =C2=BBpatch=C2=AB or =C2=BBdiff=C2=AB.


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Commit_Policy

--=-iu4DWLTR6FouIxa3hFw8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktbct0ACgkQPX1aK2wOHVhoMQCeL1P0nyxmv43XSb6DtDMDnv1Z
6N0AniEwM/Aibmh5BXnrLS/8F0BjHIbu
=mp+A
-----END PGP SIGNATURE-----

--=-iu4DWLTR6FouIxa3hFw8--
