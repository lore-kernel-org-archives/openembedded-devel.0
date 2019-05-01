Return-Path: <trini@konsulko.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id DDF517DAFD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 16:29:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e9so621261wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 09:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LyDv+fRbFR9+A04E4OufDbWB0fnNpNJNeADhtUJ2nQU=;
	b=I9e/3T4nwscXpyObQNWZCez3brE+/9VFdWx4aYcq++NBGKPBoswgmmmCtSaQ8gg5ot
	vdXOw+1F+cuVWIlRM/bGdiY4wBSbaVTDsYJ4+ncv4JdlAvaqVqlTbjJLg3A4opoG9at7
	Q0nYhVwyN4RWompsnWrZUOU8r5cVl183Jo8xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LyDv+fRbFR9+A04E4OufDbWB0fnNpNJNeADhtUJ2nQU=;
	b=SL/jEQtCnI2CsqhoKb4A7ILcYPvDtQK0TtTGPZUHyhQSklnJBw+u1azas8ODjFtZOR
	6D6kEROg9WEwYrlh9rgjVAga5mxM6y/1v583/FLHzmDb8OtG284EpxNc0mMM6jY6QNNZ
	aAXM2dOyj0RmI9E/U+enA+AHyMCS6D1+6Ue47AcmIzVB/36xGI9oru9WqtDf64Yz5dnL
	W6AUCiLal/v9jyLEN90gKbgYZG/uxHLbuxUhgNW0N6nqcqBAw14jKsKyaIT6u0a3gmCE
	OrKrzOIyzumeLJhCnwyPHzTeiAE/F21rXXe8igQWe86hT0v5OloihoANQc3VsUizKCrH
	3TOQ==
X-Gm-Message-State: APjAAAUvuLucr5V7VidLmH7+W8G3CgmnUVbsPCNi6JZfciSfmDJXtG2l
	kXOfAp/CT55dYZC/HcOQ8BEtrw==
X-Google-Smtp-Source: APXvYqy3zAPx9YWAr+MscyKleFGxbqz+blwvgLf3HMH7u3voh7puXjUHiYXW/VwllKIJVzCEcq1cpQ==
X-Received: by 2002:a05:6000:9:: with SMTP id
	h9mr31202410wrx.194.1556728197603; 
	Wed, 01 May 2019 09:29:57 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	a184sm7722411wmh.36.2019.05.01.09.29.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 09:29:56 -0700 (PDT)
Date: Wed, 1 May 2019 12:29:53 -0400
From: Tom Rini <trini@konsulko.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190501162953.GC31207@bill-the-cat>
References: <1556725263-19751-1-git-send-email-akuster808@gmail.com>
	<20190501160044.GA31207@bill-the-cat>
	<de5ac985-9b63-c19a-5c73-71ae0d684c04@gmail.com>
MIME-Version: 1.0
In-Reply-To: <de5ac985-9b63-c19a-5c73-71ae0d684c04@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][v2][PATCH] README: updated Maintainers list for Warrior
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2019 16:29:57 -0000
X-Groupsio-MsgNum: 77377
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I765j4SbssVa6PLi"
Content-Disposition: inline

--I765j4SbssVa6PLi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2019 at 09:24:31AM -0700, akuster808 wrote:
>=20
>=20
> On 5/1/19 9:00 AM, Tom Rini wrote:
> > On Wed, May 01, 2019 at 08:41:03AM -0700, Armin Kuster wrote:
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >>
> >> [v2]
> >> bump bitbake to warrior version
> >> ---
> >>  README                      |  2 +-
> >>  meta-filesystems/README     | 12 ++++++------
> >>  meta-gnome/README           | 10 +++++-----
> >>  meta-initramfs/README       |  8 ++++----
> >>  meta-multimedia/README      | 10 +++++-----
> >>  meta-networking/MAINTAINERS | 32 +++-----------------------------
> >>  meta-networking/README      |  6 +++---
> >>  meta-oe/README              |  8 ++++----
> >>  meta-perl/README            | 10 ++++------
> >>  meta-python/README          | 12 +++++-------
> >>  meta-webserver/README       |  8 ++++----
> >>  meta-xfce/README            | 10 +++++-----
> >>  12 files changed, 49 insertions(+), 79 deletions(-)
> >>
> >> diff --git a/README b/README
> >> index 7318f09..881115e 100644
> >> --- a/README
> >> +++ b/README
> >> @@ -1,6 +1,6 @@
> >>  Collection of layers for the OE-core universe
> >> =20
> >> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> >> +Warrior maintainer: Armin Kuster  <akuster808@gmail.com>
> >> =20
> >>  This repository is a collection of layers to suppliment OE-Core
> >>  with additional packages, Each layer have designated maintainer
> >> diff --git a/meta-filesystems/README b/meta-filesystems/README
> >> index 87cb685..842da13 100644
> >> --- a/meta-filesystems/README
> >> +++ b/meta-filesystems/README
> >> @@ -10,30 +10,30 @@ Dependencies
> >>  This layer depends on:
> >> =20
> >>    URI: git://git.openembedded.org/bitbake
> >> -  branch: master
> >> +  branch: 1.42
> > To be clear, where is 1.42 coming from?
> > $ git checkout warrior
> > Switched to branch 'warrior'
> > Your branch is up-to-date with 'origin/warrior'.
> > $ git grep BB_MIN_VER
> > meta/classes/sanity.bbclass:    minversion =3D d.getVar('BB_MIN_VERSION=
')
> > meta/conf/sanity.conf:BB_MIN_VERSION =3D "1.39.1"
> How is this a problem of meta-openembedded?
> its a core=A0 and bitbake issue.
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=3Dwarrior&id=3D0=
c3423aae935c36e59d15d8bb60d7826cebc4e03
> https://git.openembedded.org/bitbake/log/?h=3D1.42

Yes, correct.  Sorry for hijacking the thread, I just saw this patch
which reminded me to follow up about that core issue.

> > To be clear, I'm _not_ a fan of saying we need to go that old
> > (especially since there's no CI done with that version) but I am saying
> > we should be consistent with the code.
>=20
> You are helping make a case for removing the reference to what bitbake
> version meta-filesystems want as its the only layer that identified it
> needed bitbake.
>=20
> The other layers in meta-openembedded don't list it.
>=20
> I will send v3 to remove any reference to bitbake.

That makes the most sense, agreed.  No layer should be saying what
bitbake version is requires, that should be handled by the core layer.

--=20
Tom

--I765j4SbssVa6PLi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcycmAAAoJEIf59jXTHXZSM/kP/i/sOqpqKpRjDrrWX0+YvD6i
L+HwPAbErK9X1SErZtfLtgjCOV+mHYY8xJVPZYlzr3mRtFx4mQGLCFLmuQQ44B1c
XWrhzDU8LdsmXu4GnG+4mNt+W/fN8jqi6qmLX/tQje6XSOJQEeQVWkAKpS7spYcV
Sg5oNw5e2l4wXKTK5x1MJ7vADMm1B6iBAQXy+9d3HIW6oH0FiwjhTMGWOIJAyytg
/rv9r67yOlR7EuR0Ur+T7ZNeHjIuzITXGED0QRaUkwiyds464FIYEEcUccaW1mxZ
DJx/bW6MH7funr12rM1PCFxtF1yhLP6/JWhhkAGR7N22wAA/GGj0Ocm/wvQaaxYb
2jtpI8FkJKRfhjSOkXNjfVSrNJbpeyh6KqCuoT70yAuK7XWcpuY3eqvH7oqj1DJN
7Qk2fusjBIcKCjC5AUvBd2WWGDkgAHIzfS1QgEritxUytaHfPzmcWteKTW+k0IEb
v7LMahLDGTY+ExbdyBy6KgdI7mqWLrzC5cnIBLhbg6wtfVcvSExE+QxAL3gkiZED
rmR2p7R6Log1ws30eDPfc/Ph3qnL2KGKk4tOo64nL6a2d7ve40r9CmBfPFdGLmsQ
0505gndm17lIMLfcfnIzQ9xiAUmrssfXWZmanZC4IOyWhTeC8+Hv+xW3Mb1Ql6eI
Fz5OBNo+A7/SuNHPh746
=X9ms
-----END PGP SIGNATURE-----

--I765j4SbssVa6PLi--
