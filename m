Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QRKYQ-0008Lg-Dx for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 10:43:58 +0200
Received: from f053045255.adsl.alicedsl.de ([78.53.45.255]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QRKVv-0004tD-Hm for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 08:41:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201105302229.01288.schnitzeltony@gmx.de>
References: <201105220001.36288.schnitzeltony@gmx.de>
	<201105220143.54594.schnitzeltony@gmx.de>
	<1306782978.4106.483.camel@mattotaupa>
	<201105302229.01288.schnitzeltony@gmx.de>
Date: Tue, 31 May 2011 10:40:49 +0200
Message-ID: <1306831249.4991.62.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] Revert "perl-native: create_wrapper on perl${PV} too"
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
X-List-Received-Date: Tue, 31 May 2011 08:43:58 -0000
X-Groupsio-MsgNum: 32411
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-AEfUfxjKSboN58oGopYK"

--=-AEfUfxjKSboN58oGopYK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Andreas,


Am Montag, den 30.05.2011, 22:29 +0200 schrieb Andreas Mueller:
> On Monday, May 30, 2011 09:16:18 PM Paul Menzel wrote:
> > From: Paul Menzel <paulepanter@users.sourceforge.net>
> > Date: Mon, 30 May 2011 21:08:24 +0200
> >=20
> > This reverts commit 1e255fbd296e95ff178d66c4a1fe4875a988d7e1.

[=E2=80=A6]

> > [1]
> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/032981=
.ht
> > ml

Please make sure to not line wrap quoted texts.

[=E2=80=A6]

> Isn't that exactly what [1] wants to fix

Yes. I thought that such a patch was sent to the list, but I could not
find it in my inbox because I had deleted you message already and I only
searched for perl in Patchwork [3].

> and was described in [2] (sorry for late night english written there :-)

Yes. That is why I even sent this patch even as a reply in this thread.

Since I have deleted the patch already could you please resend the patch
as a reply to your original patch message so I can add my Acked-by line.

I will update the status of my patch soonish.


Thanks,

Paul


PS: Do you have commit access already?


> [1] http://patches.openembedded.org/patch/4923/
> [2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/0329=
81.html
[3] http://patches.openembedded.org/project/oe/list/

--=-AEfUfxjKSboN58oGopYK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3kqZEACgkQPX1aK2wOHVikywCdFQqBGOs8eFUY9UXws0xHlL86
IBkAnR4oyGypJ+P7W2aM4pJcKcVcQUpI
=0GIL
-----END PGP SIGNATURE-----

--=-AEfUfxjKSboN58oGopYK--
