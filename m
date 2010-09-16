Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OwH5s-0004Um-GG for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 18:13:56 +0200
Received: from f053044210.adsl.alicedsl.de ([78.53.44.210]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OwH56-0006KZ-0o for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 16:13:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=m8Sg5JtcczZaohgrgmN+y5EbQRYzn6eYoPUVj@mail.gmail.com>
References: <1284615893-18010-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
	<1284623776.3825.5.camel@mattotaupa>
	<AANLkTi=m8Sg5JtcczZaohgrgmN+y5EbQRYzn6eYoPUVj@mail.gmail.com>
Date: Thu, 16 Sep 2010 18:13:00 +0200
Message-ID: <1284653580.3747.13.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: Update recipe for all version
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
X-List-Received-Date: Thu, 16 Sep 2010 16:13:58 -0000
X-Groupsio-MsgNum: 23653
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-KmLwDzn6oIgIyCNCQDRL"

--=-KmLwDzn6oIgIyCNCQDRL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 16.09.2010, 07:31 -0700 schrieb Khem Raj:
> On Thu, Sep 16, 2010 at 12:56 AM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
> > Could you please add more information to the patch headers [1]. Like,
> > were do they come from, links to more information why they are needed
> > and possibly upstream tickets or commits.
>
> its already there in the patch headers.

Just for `sh4_set_fpscr.patch` and not for the other two

        sh4_set_fpscr_2.12.patch
        sh4_local-fpscr_values.patch

as far as I can see.

And looking at [1] from `sh4_set_fpscr.patch` this patch looks like a
subset than the one in the Debian BTS [2]. So if this has been applied
upstream yet I would prefer a link to the commit.

I am sorry to bother you with this. But this is my perspective, a guy
who is not involved with this library a lot. But when I am facing a
problem with the library and try to get an overview it will take me more
time than needed to get around everything because the documentation is
lacking. So please tell me what I am missing. ;-)

(The commit summary could also be improved to =C2=BBapply fpscr patches=C2=
=AB or
something similar.)


Thanks,

Paul


[1] http://sourceware.org/ml/libc-alpha/2009-12/msg00009.html
[2] http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D565369

--=-KmLwDzn6oIgIyCNCQDRL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkySQgIACgkQPX1aK2wOHVh2/wCdG4inIacW/AQP6yFjjKE/nE1i
ZVYAoIBl+solPYyKkYXGLyxTvDew78A2
=V1JA
-----END PGP SIGNATURE-----

--=-KmLwDzn6oIgIyCNCQDRL--
