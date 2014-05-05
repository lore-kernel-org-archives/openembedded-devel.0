Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id A3C3E65F0F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 May 2014 17:05:42 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id 10so336090lbg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 10:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:date:from:to
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=ybJjugChyIN7CSa8C7s82vhZEz4Gdh0YeqsYgqi/S38=;
	b=T2DcLQPxT3E3nUdYnG46CbmTZ0SZe8TzugaNXx5VaRrqjpA1ec3wYmQVsRG+9c1kCY
	GWldZewCW/TB9WzkONxUbyFUqCoUkU2IC1r6LipVazREpnQSvN4kIMWM4epat/3P/VGG
	0eRIiD/mzDOTGxCqspmG3lVxmzf5DOxFGn7SfEs+YtJ39RNR04gaMNtLo7Po0uCgMjLo
	T+rDMZpXDyYFTDEuywwW3eJiVjRb4jOxD8ikoDd13xmEQaaYc2VQV78ahN1p76ztmQ0o
	RWZectXw43DNY7tXyEQJGVlsr3lonDGASsmb6sqHDqFy1pAsVQpDux/704uJEHcBRfi/
	UPBw==
X-Received: by 10.113.5.40 with SMTP id cj8mr1849350lbd.69.1399309542949;
	Mon, 05 May 2014 10:05:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cr6sm10178440lbb.19.2014.05.05.10.05.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 10:05:42 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Mon, 5 May 2014 19:06:02 +0200
Resent-Message-ID: <20140505170602.GN2486@jama>
Resent-To: openembedded-devel@lists.openembedded.org
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fa8sm10125223lbc.18.2014.05.05.09.44.53 for <adam.yh.lee@gmail.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 09:44:53 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 May 2014 18:45:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Message-ID: <20140505164514.GM2486@jama>
References: <20140430143741.GL2486@jama>
	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: JgRDzcDmqVVI
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Mon, 05 May 2014 17:05:44 -0000
X-Groupsio-MsgNum: 49698
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFTwHA6VxmyNZAdd"
Content-Disposition: inline

--nFTwHA6VxmyNZAdd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 05, 2014 at 09:32:04AM -0700, Adam Lee wrote:
> Hi JaMa, what does it take to be a maintainer?
>=20
> Do I need to build check all the packages everyday?

Definitely no everyday, there are more patches coming in just after the
release, but later it's something like 1-5 patches in month.

So it doesn't need much time, but it's always good when it's done by
someone else then master maintainer (to setup separate builds etc).

Possibly more time is spent on watching the ML, because many people
don't read README file and instead of following the proper procedure for
backports to relase branches they just say somewhere in ML "BTW: also
merge this to dora".

You can also have some co-maintainer if you find way to split the work
without duplicating it.

I'm fine with scheme where maintainer sends me consolidated pull-request
and I'll merge it for him to actual branch (so that he doesn't even need
R/W to main repo).

BTW: If you don't mind, then I'll forward this to oe-devel as well for
other possible volunteers.

Cheers,

> Please let me know!
>=20
> Adam
>=20
> On Wed, Apr 30, 2014 at 7:37 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Hi,
> >
> > few people asked me when there will be daisy branch in meta-openembedded
> > repository.
> >
> > My current plan is at the end of next week.
> >
> > There are some pending fixes I need to finish testing (please review,
> > test and reply on them).
> >
> > I was hoping for few more fixes for
> > http://lists.openembedded.org/pipermail/openembedded-devel/2014-March/0=
94893.html
> >
> > and especially for incorrect dependencies:
> > http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/0=
95268.html
> > http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/0=
95464.html
> >
> > There is only one change on ML which really cannot go to daisy branch
> > (http://patchwork.openembedded.org/patch/71107/), the B!=3DS fixes are =
on
> > edge, but they shouldn't harm to be in daisy.
> >
> > I hope to get few more fixes from OEDAM and then I'll run final build
> > test on jenkins (3days, possibly needed twice).
> >
> > If you want to maintain daisy release in meta-oe, reply in this thread
> > and send patch to update README files.
> >
> > Regards,
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nFTwHA6VxmyNZAdd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNnwBoACgkQN1Ujt2V2gBzE1ACgrgeVz2dswMvNGP4/Pn2Bsbce
5ZMAn2Rn65Q3QeGGtWdSBRSVgQ2r+bJZ
=ziZQ
-----END PGP SIGNATURE-----

--nFTwHA6VxmyNZAdd--
