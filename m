Return-Path: <joe@deserted.net>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 448E4615BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:04:20 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so880007eaj.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=XcISzK4abrsMPdr12MAtEsWaGyfb5B+TOEonu/Ohq4Q=;
	b=aaTBn5o4lSV5wMB8DjaYvCNYY7Q9AKq2hZJAAdBdx4TKBe2aA49v/ZB9tp9i1nsx0W
	DFi+MjA2pi0gguE8llJIyVNk9XkfNhmHuxfY9KwgGPbBoErnTziBzJ+ImFWQGxNvbnDB
	hOiKIJWT0EH8N1NlXBGNI+X0/PVZrSNJ1KcUiKhuMA9RN19y70tcX+YKdcOIch/8lcHS
	HT1Kx2P6b5yrOuTuwAcdcLBI5M/jzCbRXnhZFPISTCvbv6HCqnis5dz7mOZNu4IvtoKm
	qR3FG5zdxHKYnIJ/U/3WDJ9Ybph18n3XTW1JhzHXUENVJBIjX5eDdIqgHA8fP+70+Pia
	pZkQ==
X-Gm-Message-State: ALoCoQm6j22d5z3v1n8UQC3y9QdO78TaQDjb5N2FEjHRlfWIk9mFrIvnb1fJqYVao6m2ZrLGTVxl
X-Received: by 10.15.41.205 with SMTP id s53mr3096800eev.63.1378386261370;
	Thu, 05 Sep 2013 06:04:21 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id z12sm48531875eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 06:04:20 -0700 (PDT)
Date: Thu, 5 Sep 2013 09:04:16 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130905130413.GF5086@deserted.net>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<20130904211411.GR3761@deserted.net>
	<CADkTA4PbVB2X9abGFMKsAt6NRaZxnZa1GK86e3L+=CGzNfswdA@mail.gmail.com>
	<CAJTo0LYA4pa_xSQe=PL9eYXfEr3rULSd7nJGSNLnoJKYEX_uMw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYA4pa_xSQe=PL9eYXfEr3rULSd7nJGSNLnoJKYEX_uMw@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] openflow: Add latest from git
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
X-List-Received-Date: Thu, 05 Sep 2013 13:04:21 -0000
X-Groupsio-MsgNum: 46095
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Content-Disposition: inline

--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.09.=
05 (Thu 10:01) Burton, Ross wrote:

> On 5 September 2013 05:39, Bruce Ashfield <bruce.ashfield@gmail.com> wrot=
e:
> > The meta-virt recipe had the same _1.0.bb extension, and it's SRCREV li=
nes up
> > with the openflow-1.0.0 tag in the repository:
> >
> > --------
> >
> > commit 5ccca75a69f99791659bcfbcf35353ab1921320a
> > Author: Glen Gibb <grg@stanford.edu>
> > Date:   Thu Dec 31 16:00:53 2009 -0800
> >
> >     docs: Update ChangeLog to include 1.0.0 information
> >
> > :100644 100644 2f13dd7... aa0e92e... M  ChangeLog
> >
> > -------
> >
> > So it's definitely an option to keep that recipe around as the tagged 1=
=2E0, and
> > create a _git that tracks newer changes (where "newer" is relative, 201=
1 is
> > the latest commit in that repo).
>=20
> FWIW, I massively prefer "releases that are taken from git" like this
> (where its a git fetch on a hash that is the tag of the releases) to
> be versioned correctly like _1.0.bb instead of _git.bb for clarity and
> future alternatives such as true git snapshot or multiple versions.

Yeah, since the SRCREV in the _1.0.bb recipe actually corresponds to the
1.0 release tag, I'm in agreement.  The proposed update from Laszlo also
now seems to justify having a _git.bb version, since it's pointing at a
(relatively) newer version of the recipe.

--=20
-Joe MacDonald.
:wq

--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIogU0ACgkQwFvcllog0Xz+QwCaA3ZpEuijuEnwxUWnAxbvrUZg
cacAmgMU1n0wdM0Yo+vR+6cuQX6l+EkX
=B/F7
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--
