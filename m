Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYouR-0002BJ-02 for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 23:56:54 +0100
Received: from e178248110.adsl.alicedsl.de ([85.178.248.110]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYosE-0002DG-5b for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 22:54:34 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B5B78D9.5060809@soundmetrics.com>
References: <1264273402-29910-1-git-send-email-john@soundmetrics.com>
	<1264276434.3738.53.camel@mattotaupa.wohnung.familie-menzel.net>
	<4B5B78D9.5060809@soundmetrics.com>
Date: Sat, 23 Jan 2010 23:54:32 +0100
Message-ID: <1264287272.3738.222.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] socat: Add version 1.7.1.2
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
X-List-Received-Date: Sat, 23 Jan 2010 22:56:54 -0000
X-Groupsio-MsgNum: 16127
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-IxegBBpBU7W4cXw+hWZ7"

--=-IxegBBpBU7W4cXw+hWZ7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 23.01.2010, 14:31 -0800 schrieb John Faith:
> Paul Menzel wrote:

[=E2=80=A6]

> > Please fix this up and resend with `[PATCH v2]` in the subject line and
> > a note in the commit message.
> >  =20
> git send-email really doesn't want to put "[PATCH v2]" in the mail=20
> subject even when I specify --subject on the command line.

`git help send-email` says that this just kicks in when `--compose` is
specified too.

> Could you point me to the trick to do this?

Good question. The subject seems to be set when you do `git
format-patch`. There you have an option `--subject-prefix`. So
`--subject-prefix=3D"PATCH v2"` should do the trick.

As you can see in [1] some people also briefly note what changed in the
patch revisions. But that is optional I think.


Thanks,

Paul


[1] http://sourceforge.net/mailarchive/forum.php?thread_name=3D1264014090-1=
8814-1-git-send-email-luca%40luca-barbieri.com&forum_name=3Ddri-devel
    (Different style of subject. ;-))

--=-IxegBBpBU7W4cXw+hWZ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktbfigACgkQPX1aK2wOHVgYHwCfaqs+S+20Dsju4TCMi3JdfTM4
f+sAoIr2iRD5BT8pG/fPjm821XkVFL9g
=O1JJ
-----END PGP SIGNATURE-----

--=-IxegBBpBU7W4cXw+hWZ7--
