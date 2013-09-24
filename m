Return-Path: <joe@deserted.net>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 429AC60EDA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 18:10:27 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id m15so5086371wgh.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 11:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=FNdHa4dsPTD6rcxgA5+FshfO24t6rhBeugUetkjlKw4=;
	b=hStabMUvLhioeblE17TU2F57EY+I8PzVN1msLXzbuBIX1snPtvyUPwspaAsnyemEkY
	Lsq0oq4CvNqc1pQKpSWPg4o+5FKZRGBF45Eyb+AqnBicJUXYzHSjIGluJPZgmHNl/64Y
	3XdGK5JQDGY8w1cnRvVAEAt5AQMw8nDuYFT6jmdH5sjCprc0rlyS/V4IUFuS+TuZhJ7d
	guHw/N2GxsMNOJpFingudUc9/6Dqf3w+Fn9t3MSpyZOADhhQl5upHhiEeYVEmbG/UGnr
	SIT0sf0rb6eSqY9RaYHa+WXbMLz1n/GIo4YgSi5WD86ss4dHdJl1KoLl3K7odzwsqj3R
	J7aQ==
X-Gm-Message-State: ALoCoQmnw2MWL08AA/lVmWhDqhVVqz6+EVLjZzUPpfG5vkXTOOPMwn6PF0PZRJ1d5Rc4be91+ZF9
X-Received: by 10.194.109.68 with SMTP id hq4mr23478914wjb.12.1380046228471;
	Tue, 24 Sep 2013 11:10:28 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id i8sm9921054wiy.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 24 Sep 2013 11:10:27 -0700 (PDT)
Date: Tue, 24 Sep 2013 14:10:22 -0400
From: Joe MacDonald <joe@deserted.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130924181019.GA23080@deserted.net>
References: <1379927191-21769-1-git-send-email-b40290@freescale.com>
	<10075581.zIxvIPmXvh@helios> <20130923182159.GA30829@deserted.net>
	<62747590.0CPS7u3973@helios>
MIME-Version: 1.0
In-Reply-To: <62747590.0CPS7u3973@helios>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/3] snort: add recipe
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
X-List-Received-Date: Tue, 24 Sep 2013 18:10:29 -0000
X-Groupsio-MsgNum: 46343
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 1/3] snort: add recipe] On 13.09.24 (Tue =
18:16) Paul Eggleton wrote:

> Hi Joe,
>=20
> On Monday 23 September 2013 14:22:02 Joe MacDonald wrote:
> > [Re: [oe] [meta-networking][PATCH 1/3] snort: add recipe] On 13.09.23 (=
Mon
> > 18:56) Paul Eggleton wrote:
> > >=20
> > > I'm a bit confused; is this recipe supposed to be going into
> > > meta-networking or meta-security? Because patches have been sent
> > > recently to add it to both.
> >=20
> > I had mentioned that I would accept snort into meta-networking if it
> > wasn't a good fit for meta-security since it was something I'd started
> > working on integrating anyway a while back.  I assumed that was the case
> > since it was sent to the list for meta-networking today.
> >=20
> > I don't think we need copies in both places, though, and since it was
> > first aimed at meta-security, if it gets merged there, I won't merge it
> > here.
> >=20
> > Hopefully nothing I've said here contradicts what the meta-security
> > maintainers would want to see.
>=20
> I would have thought it would go into meta-security myself; but ultimatel=
y=20
> it's up to you and Saul really. I just wanted to make sure we didn't some=
how=20
> end up with it in both layers since we have patches for adding it to both.

Yeah, I completely agree.  Since I'm using meta-security a bit now and
sending a few patches back, I'll keep an eye out and if the snort stuff
lands in there, I would not consider merging it with meta-networking.

Snort has always been in the same category for me as tcpdump, nmap and
etherape/wireshark.  A hugely useful network diagnostics tool.  But as
and IDS / IPS it makes sense for meta-security as well.

Either works for me.

--=20
-Joe MacDonald.
:wq

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJB1XkACgkQwFvcllog0XweZQCdFnZjF8ePzVTCvvwHU58pllkh
gM4AnjQbQkzDHIsK+lbkuokD0ceRv5fw
=zgkt
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
