Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtGdu-0002jV-OT
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 12:50:17 +0100
Received: by mail-pb0-f42.google.com with SMTP id rp2so248182pbb.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 03:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uNQ8dEEjSWbeSjAxh8D79sUnZuikdkgqEEU6KBwBSeo=;
	b=M9iVx57M3hkxOoUFewp95wOZ2iAAQT9h38riJoaWD8tdyyQGJrrtQuazuaOkGMoELC
	odiOzDT9cFSd+RgkOPmGykJlVkIGYoiUqkIjRqkaznrdDT+ARvchxcKv8XGull5o2FeC
	9C3Gr5Vzlr/8sBr8VDgX04PbS5c6yoUeicmcDsAD+p/JHiIRWl2RbMKSTmqJC1/0jg4+
	zubreiEXFxdisEXGChyLyObkw0zoJSli0+shx3RHegeQlclDG8KhjuBoSAxyf/MGsAGo
	XFc5C/uTfMFiFxGerTNuGZnr4ef1o+3KCDKL3aHyXSSnH/oiCvnXwQtPAL+V4yjz1sdw
	VeFw==
X-Received: by 10.68.130.135 with SMTP id oe7mr49962811pbb.38.1357817680740;
	Thu, 10 Jan 2013 03:34:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bc1sm908136pab.3.2013.01.10.03.34.38
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 03:34:39 -0800 (PST)
Date: Thu, 10 Jan 2013 12:34:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130110113445.GC3722@jama.palm1.palmone.com>
References: <1357774995-1104-1-git-send-email-schnitzeltony@googlemail.com>
	<20130110112231.GZ3722@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20130110112231.GZ3722@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia/meta-oe/meta-systemd 0/3] new recipes/appends
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
X-List-Received-Date: Thu, 10 Jan 2013 11:50:19 -0000
X-Groupsio-MsgNum: 42629
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XA3zunQti4u0IH5i"
Content-Disposition: inline

--XA3zunQti4u0IH5i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 12:22:31PM +0100, Martin Jansa wrote:
> On Thu, Jan 10, 2013 at 12:43:12AM +0100, Andreas M=FCller wrote:
> > 1+2 resend (Patchwork was down)
> > 3. I have this in and working for long time
> >=20
> > The following changes since commit 89d5899c38ec94b0560a3496b020e45b40d8=
251c:
> >=20
> >   python-distutils-extra: initial add 2.36 (2013-01-09 16:20:22 +0100)
>=20
> This commit is not in master.
>=20
> First 2 patches applied from previous patches on ML, thanks!

Grr, SOB lines are missing in repo and I've just refreshed them from
repo just before pushing them and checked only with git diff that they=20
are still the same :/.

Cheers,

>=20
> >=20
> > are available in the git repository at:
> >   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patch=
es
> >=20
> > Andreas M=FCller (3):
> >       openal-soft: initial add 1.15.1
> >       physfs: initial add 2.0.3
> >       bluez4: add systemd support
> >=20
> >  .../openal/openal-soft_1.15.1.bb                   |   20 ++++++++++++=
++++++++
> >  meta-oe/recipes-support/physfs/physfs_2.0.3.bb     |   11 +++++++++++
> >  .../bluez/bluez4_4.101.bbappend                    |    8 ++++++++
> >  3 files changed, 39 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-multimedia/recipes-multimedia/openal/openal-so=
ft_1.15.1.bb
> >  create mode 100644 meta-oe/recipes-support/physfs/physfs_2.0.3.bb
> >  create mode 100644 meta-systemd/oe-core/recipes-connectivity/bluez/blu=
ez4_4.101.bbappend
> >=20
> > --=20
> > 1.7.4.4
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XA3zunQti4u0IH5i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDup1UACgkQN1Ujt2V2gBwZLQCfY3DpuupWg2P+yz52Tw6XjmdX
9pQAn1bVeaMWWrWVvr2VZVAKCqMY2LSN
=JREv
-----END PGP SIGNATURE-----

--XA3zunQti4u0IH5i--
