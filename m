Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id ECFA26CA5B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 14:18:50 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so2505601eak.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jcAu/pjXaZgdJhkOyNkggV/AShFrbzVy+S0WmBIwX/I=;
	b=VV3qcQBEcHn9PPqGydJOz3xQ4AAMKaN+iV8nBXDUYwjVKgTskLufuaSkyjySjo4P2a
	wk90d+ZO1/HRqp8cStMGmplaUMbBP0Ih5UwDN+lWDIrw7tlRQ3W8+Sk0IYbTlFSPsyhP
	LZ1IPwPkDBgrsYJ2c38GUlyRmB4wQgSY4Y2X1RhuQVgvt9b0m0Mc58eL1mR+vOzstHBb
	bZlchXNurSYQTNGYkQ8IcQkv0T55UdUSoNKocUClLfobUojJKjj+lv/q0pID7FvP6OdT
	uhN7+Yv7IEeWwRo/L72WHWPBiwrxx+gxFIAD1ZQr551jEDYOZYdwOinmvV/5BCQahnO1
	dCag==
X-Received: by 10.14.10.72 with SMTP id 48mr2320745eeu.82.1380032332407;
	Tue, 24 Sep 2013 07:18:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm53775749eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Sep 2013 07:18:51 -0700 (PDT)
Date: Tue, 24 Sep 2013 16:18:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130924141853.GD3631@jama>
References: <1378999913-22567-1-git-send-email-ross.burton@intel.com>
	<20130919121131.GE18414@jama>
	<CAJTo0LbtppQegr=Z6M1Ewmd2b7rC5-LSdc6UDFf5Cdxz86=0DA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbtppQegr=Z6M1Ewmd2b7rC5-LSdc6UDFf5Cdxz86=0DA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia][PATCH] dleyna: switch to git clones instead of generated tarballs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2013 14:18:52 -0000
X-Groupsio-MsgNum: 46336
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Content-Disposition: inline

--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2013 at 02:51:39PM +0100, Burton, Ross wrote:
> On 19 September 2013 13:11, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Thu, Sep 12, 2013 at 04:31:53PM +0100, Ross Burton wrote:
> >> The tarballs used were the dynamically-generated tarballs from github,=
 which
> >> recently have changed checksum.  Avoid this problem entirely by fetchi=
ng from
> >> git, locked to the relevant tag.
> >
> > Merged, thanks!
>=20
> Did you actually push that merge?  I don't see it merged here.

Yes=20
http://git.openembedded.org/meta-openembedded/commit/?id=3Def3f283609c5b165=
f5dfa9d6458f3c9ffb53f209

>=20
> Ross
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJBn00ACgkQN1Ujt2V2gBztMwCfR5ukpcD6XWMEHmmssMkMmij7
1QgAnA9LtM7gFkhcBndQUqtm8daKDfZZ
=mX7H
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--
