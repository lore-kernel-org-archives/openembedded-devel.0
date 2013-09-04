Return-Path: <joe@deserted.net>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id D7F676BABB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 21:04:44 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id w8so2290570qac.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 14:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=osNjYF7ezbgZ6tPzS65Wo9HuHWtwquEe/+INU9+0gpo=;
	b=XVI5jGU9N/8iexyav8kaW8pvRlmylXLtYTddd3NblYWjMDknSDnu02OH2AXe/sr3fP
	/xaYgVRnAwODX1vUBPhCLzsrig6QCngor9fnuaWJ9uhig3OZyrLCQo3FubuuYiVuc6Rp
	zD7PJWTxF498oZvPv5LkMBvE48iDtiYK2aIeRoaomEUbHxSx5UN//t08wIkd9lE8rgmJ
	TlD98rOQTXaGllx3J8TA+sDRu4lKZbWM5D+qbl1szTBoE/YLUTz6UnwA+ZpVijHiO9Pu
	3J5HrJuOSF7kK/sAyq4cDtWysvn6LRznKY1DrY/nnkzoDfI3Eqy4VBI6IcMRa0tC4ITb
	53bg==
X-Gm-Message-State: ALoCoQnXNAx1Q7kaYIfKpffTzHuo7IsGh3r/d+07aEuLZF/9xSAIOFJGrVjIGqg4wZ1Wwp1Pt4O2
X-Received: by 10.224.97.3 with SMTP id j3mr4681520qan.87.1378328686332;
	Wed, 04 Sep 2013 14:04:46 -0700 (PDT)
Received: from deserted.net (198-84-238-35.cpe.teksavvy.com. [198.84.238.35])
	by mx.google.com with ESMTPSA id
	p6sm36204085qai.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 14:04:45 -0700 (PDT)
Date: Wed, 4 Sep 2013 17:04:30 -0400
From: Joe MacDonald <joe@deserted.net>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20130904210427.GQ3761@deserted.net>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
	<CAOMwXhNV70uRZiL1T+gbguZnBrwUwdUzfGA30d6N-OvhSK__xA@mail.gmail.com>
	<CADkTA4P-tyfnX5Dywf8Z+tSEVxjbrykio5tFg_UmhkrTvORdyw@mail.gmail.com>
	<CAOMwXhNp0w=1=QW=e+82Q135wECMROUdcJ3aEaLUFKOu_68DEQ@mail.gmail.com>
	<CADkTA4PUf5ce5B206zP+7i4hZ0LWN_YD1VuooSZLkC4j-nmuJw@mail.gmail.com>
	<20130903210803.GD20985@deserted.net>
	<CADkTA4M=4Jrr6-4JP4bWM0Bwm7XxMvgyTi49XkcLGtLSpSMBvg@mail.gmail.com>
	<CANBf+V2Mp7Q+E0uW6YtoctCUcQa3sCma31Ygmm9f7nejYbUZJg@mail.gmail.com>
	<CADkTA4NOCjzDz=SXqAx+AxDTDztSas5EG+i74LUmpaF0OkZ5SQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NOCjzDz=SXqAx+AxDTDztSas5EG+i74LUmpaF0OkZ5SQ@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 04 Sep 2013 21:04:46 -0000
X-Groupsio-MsgNum: 46069
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FoibaoN3dya3u5fy"
Content-Disposition: inline

--FoibaoN3dya3u5fy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.09.=
04 (Wed 08:22) Bruce Ashfield wrote:

> On Tue, Sep 3, 2013 at 11:27 PM, Joe MacDonald <joe@deserted.net> wrote:
> > On Tue, Sep 3, 2013 at 6:39 PM, Bruce Ashfield <bruce.ashfield@gmail.co=
m> wrote:
> >>
=2E..
> >>  - We run some tests against meta-virt and give you the thumbs up when=
 it
> >>    is safe to merge, and the meta-virt copy can be deleted. I definite=
ly don't
> >>    want two of these running around.
> >
> > I don't mind delaying a merge a bit while waiting for more feedback on
> > testing, provided we're talking about a reasonable timeframe.
> > Otherwise, if the submitted OpenFlow is working well enough in
> > meta-net, I'm inclined to merge it and take patches from you guys if
> > you find issues down the road.  That'll be how it will work anyway in
> > three month's time, for example, when meta-virt has dropped their
> > copy.
> >
> > How long do you think you'll need on this?
>=20
> I can test the new SRCREV and recipe by the end of the day, assuming
> that you have the slightly edited version by the time I'm done, there
> shouldn't be any incurred delay.

Great, thanks.  Let me know how it goes.

--=20
-Joe MacDonald.
:wq

--FoibaoN3dya3u5fy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlInoFoACgkQwFvcllog0XzSTgCfR1uwXuhQwkzGsKa5YLv1TLqj
iOkAniLZEsZVxoKTTiNOMgPQu9eE7aka
=pkwA
-----END PGP SIGNATURE-----

--FoibaoN3dya3u5fy--
