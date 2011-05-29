Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQmQ4-0001pt-3E
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 22:17:04 +0200
Received: by fxm19 with SMTP id 19so2525804fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 13:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=iahz8y6QcX9ayzw+sufrQY+czt+f2y7t1e8xyTGhgJ8=;
	b=oqTYWFUfsA1qc793oZXsB35CBkwkkwgz8g/zjCf7aupKYJwRh8dIxRAIctf/+dXEpA
	EUb8KmrshGIT9rfPyHP7Pbgartz15gN4E45TsI66xeWV1egTuSMnl0Tjb+yh+uR6VOQC
	IA5ZA1R+LQSdBhhStqGYUfrGiwVJBkgJGIkWs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=GzkinwQikOU++CDLpxNA/LpM7nSPkgohEJxZcJFMqTbBoScdeKgDcArGFgfPq9RHcA
	Jhlg70Ywv7hplIe7vPqWvLmKSulaWO2WX3pDl9V+DnwdiWlsN12jLVTZpICK6TNB43QA
	rv7CyS1hC1yaeNGl6N4/0D/rSFPzyMoM26M18=
Received: by 10.223.6.9 with SMTP id 9mr4757994fax.68.1306700036853;
	Sun, 29 May 2011 13:13:56 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id h1sm509650fag.11.2011.05.29.13.13.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 13:13:55 -0700 (PDT)
Date: Sun, 29 May 2011 22:13:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110529201349.GC18119@jama.jama.net>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
	<7b45d7328db0411ae61bd6db0fd2fabfc5dd2247.1306696348.git.Martin.Jansa@gmail.com>
	<1306699432.28663.0.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1306699432.28663.0.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 05/16] evtest: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 20:17:04 -0000
X-Groupsio-MsgNum: 32348
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Content-Disposition: inline

--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 29, 2011 at 09:03:52PM +0100, Phil Blundell wrote:
> On Sun, 2011-05-29 at 21:17 +0200, Martin Jansa wrote:
> > +SRC_URI =3D "http://cgit.freedesktop.org/~whot/evtest/snapshot/evtest-=
${PV}.tar.bz2;name=3Darchive"
>=20
> Is "cgit." really the right vhost name to be using there?  Judging from
> the rest of the URL I would guess it ought to be "people.".

Homepage for evtest is on people
http://people.freedesktop.org/~whot/evtest/
but snapshots and whole cgit interface is only available on cgit. afaik

>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3iqP0ACgkQN1Ujt2V2gBybiwCfdjpp1NF6bhat/jbSKuU6XoqF
V7cAoKbSC8lF8+UT44WN99u/Nb70WpTV
=g/7N
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
