Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0BDE0701F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 20:31:33 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so1386141wes.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 13:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xouxQ9QlzilC/0okHeaNVUhYcz0nsT3gIVHTlMM0F+0=;
	b=Dy6hv1dIMDgmH4nPOzb9ria4Z3Sq4iP9VmlIS4EPbpEdp6asnYoq/WJKIrYNe6949o
	vOMPogg6KDhtgBnbjyd1qANsDRUXs3o3gzQAHrrm/1z0YMA9rJmCTOAhp+70K+Jx+xDX
	i4RR6S+KCBirK1SCGM2CRYfavv8Kz1XdVhs+XMGT74OArJUl3k9++l7QgyuOKW2UBw3Z
	huL6AJI5SNJvwdNyO/WhbaWKV6uHVbb/ZbgdowGhCifhd0yhjC/PkujGrhKj9tv3eAFA
	tJ0exVtaVukc2NWuYyGGm27zOkPLdNtItQ+NbVfhXuOy6GjKn8wesGdfQ+XZVAZsr++p
	CjGQ==
X-Received: by 10.194.200.3 with SMTP id jo3mr23615732wjc.110.1405542692024;
	Wed, 16 Jul 2014 13:31:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lk7sm820955wjb.24.2014.07.16.13.31.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 13:31:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 22:31:40 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716203140.GI2433@jama>
References: <CAP9ODKow7gr1J8_peZJNT4+soQ_vDQP_hi4DYnjx7E0uTCUoBg@mail.gmail.com>
	<53C6B577.2050909@gmail.com>
	<CAOd_LFw=J=cihJBH47N+7NYcLo4bs4BY7d93PY+Xy=_vv5DkJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOd_LFw=J=cihJBH47N+7NYcLo4bs4BY7d93PY+Xy=_vv5DkJQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [for-daisy][meta-oe] Patches to cherry-pick from master
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
X-List-Received-Date: Wed, 16 Jul 2014 20:31:41 -0000
X-Groupsio-MsgNum: 51017
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/SgVJVxFudH2R+XP"
Content-Disposition: inline

--/SgVJVxFudH2R+XP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 03:35:20PM -0400, Cliff Brake wrote:
> On Wed, Jul 16, 2014 at 1:25 PM, akuster808 <akuster808@gmail.com> wrote:
> >
> > On 07/16/2014 08:21 AM, Otavio Salvador wrote:
> >>
> >> Hello,
> >>
> >> Please cherry-pick following patches into daisy branch:
> >
> >
> > who does this?
>=20
> I created a pull request and sent to maillist with these two patches,
> plus a zeroc-ice patch.  Not sure if this makes it easier for Martin
> or not ...

yes, thank you for doing that

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/SgVJVxFudH2R+XP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPG4SwACgkQN1Ujt2V2gBzEcQCdFqdX0QaMfCc/UETiwdn3M7hR
dA4AnR/BWuQF5pRKm931/gTlF1zoW7zQ
=2MO/
-----END PGP SIGNATURE-----

--/SgVJVxFudH2R+XP--
