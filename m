Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NsZdo-00057f-FO for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 11:41:24 +0100
Received: from f053035070.adsl.alicedsl.de ([78.53.35.70]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NsZar-0004o5-D5 for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 10:38:17 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BA2BB92.1050703@tait.co.nz>
References: <4BA2BB92.1050703@tait.co.nz>
Date: Fri, 19 Mar 2010 11:38:15 +0100
Message-ID: <1268995095.3893.20.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,
	MIME_QP_LONG_LINE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Patches and patchwork
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
X-List-Received-Date: Fri, 19 Mar 2010 10:41:24 -0000
X-Groupsio-MsgNum: 17853
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-40UtUPpHhgyDH8mwPeRQ"

--=-40UtUPpHhgyDH8mwPeRQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 19.03.2010, 12:47 +1300 schrieb Douglas Royds:
> I have submitted a patch, and after discussion want to correct it.
>=20
> Do I submit the corrected patch as a reply to the existing email thread,=20
> or start a new thread?

In my opinion, if it is just a single patch and not a patch series a
reply to the original message should sent.

The new patch should be marked with =C2=BBv2=C2=AB. (Look for `--subject-pr=
efix`
`git help format-patch`.)

> If I submit the new patch as a reply to the=20
> existing thread, will patchwork pick up the corrected patch, or remain=20
> on the original one?

Patchwork will create a new item for this patch. Look at the IDs 1732
and 1734 for my patches. (Although in this case the first version was
the correct one.)

You can update the state to superseded of the original patch using the
Web interface or `pwclient` [1].

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This email, including any attachments, is only for the intended
> addressee.  It is subject to copyright, is confidential and may be
> the subject of legal or other privilege, none of which is waived or
> lost by reason of this transmission.
> If the receiver is not the intended addressee, please accept our
> apologies, notify us by return, delete all copies and perform no
> other act on the email.
> Unfortunately, we cannot warrant that the email has not been
>  altered or corrupted during transmission.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Please do not sent messages with such disclaimers to public lists if you
can.


Thanks,

Paul


[1] http://patchwork.openembedded.org/project/openembedded/

--=-40UtUPpHhgyDH8mwPeRQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkujVBcACgkQPX1aK2wOHViWlgCePwrHBlycDOkfeawP3n0hiVGF
X/0AnicOffA/5D3nlJOwTDLjqmv+VKg6
=APUM
-----END PGP SIGNATURE-----

--=-40UtUPpHhgyDH8mwPeRQ--
