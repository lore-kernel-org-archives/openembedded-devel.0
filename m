Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ6sz-0003ad-Vh for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 19:08:37 +0100
Received: from g229060220.adsl.alicedsl.de ([92.229.60.220]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ6qm-00066W-OO for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 18:06:16 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001241558.34249.holger+oe@freyther.de>
References: <1264339371.3810.74.camel@mattotaupa>
	<201001241558.34249.holger+oe@freyther.de>
Date: Sun, 24 Jan 2010 19:06:15 +0100
Message-ID: <1264356375.3663.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH][RESEND] vdr: Put common information in separate file and require it in the recipe.
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
X-List-Received-Date: Sun, 24 Jan 2010 18:08:37 -0000
X-Groupsio-MsgNum: 16178
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-KWrGrlMJHVvv2llc6gwp"

--=-KWrGrlMJHVvv2llc6gwp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 24.01.2010, 15:58 +0100 schrieb Holger Hans Peter Freyther:

[=E2=80=A6]

> One more comment on the format, In case of big renames using git format-p=
atch=20
> -M -C (to detect renames and copies) will reduce the diff and make it mor=
e easy=20
> to review. :)

Thanks a lot for this hint! I resend it [1] and changed the state of
this patch to =C2=BBSuperseded=C2=AB.


Thanks,

Paul


[1] http://patchwork.openembedded.org/patch/1518/

--=-KWrGrlMJHVvv2llc6gwp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktcjBcACgkQPX1aK2wOHVjYeACZAaATZ1KNyW3+ZWhRZ/VRpSvq
6VQAn3M+aYXCWLwTm7BXq9B16QFgOE57
=Y2Eg
-----END PGP SIGNATURE-----

--=-KWrGrlMJHVvv2llc6gwp--
