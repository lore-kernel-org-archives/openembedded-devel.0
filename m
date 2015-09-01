Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2B176B7C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Sep 2015 22:07:05 +0000 (UTC)
Received: by wicjd9 with SMTP id jd9so47501441wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2015 15:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2R4wOjNnAXorzrh8Sjs9JFvSL5YpQnWnwxBmPC61tK8=;
	b=RcALT1KHb6pUGnKxmrKSpRje9LSzb9lhDxhRhvY1YljRWtJ6nw8UcdbyCcR7IY5ZvM
	EgYYIOx89WqittQatpDbWK7a6bowKCMRY+I9zjvTBLCq4UMDo4ooVC3vI+fN7PVg9pWl
	Y0NPMZ52DX2CSQDB24fcPcEV21Mr2o1d2elXwTdbR1X8JZwCvXPEnlMi/wnGDmWlfmll
	rfEaq7LNIMXa0hbKnhrHwMgPFsgJ0w7XXiD0jTWFvqv3dVDmNFakys7q328gfYsSy2uN
	WNHW8XLb4K6WrI/DVINHmppaLlHqsCUn97oEXPPrbaCjR7RTQ7Jok7VaHwbwQR4t7d0k
	/CRQ==
X-Received: by 10.180.86.73 with SMTP id n9mr361419wiz.78.1441145224746;
	Tue, 01 Sep 2015 15:07:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id eu2sm392590wic.8.2015.09.01.15.07.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 15:07:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Sep 2015 00:07:20 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150901220720.GG2458@jama>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<20150831175844.GD2465@jama>
	<CAJ86T=VFZXxLnoMQ7_xv3SZiqYrwwmKmTwss+0o+T=wk3ywi_Q@mail.gmail.com>
	<CALbNGRQ_gWV_j01cwQCnCem7MNY_=tD55MJ8hsW_dLwfcFVByA@mail.gmail.com>
	<CAJ86T=Wxf6PN+csum6CeyiC_keZtzG69VSQ8YFsA_x2kQh5zcw@mail.gmail.com>
	<20150901063653.GA29931@ad.chargestorm.se>
	<CAJ86T=XmrpVAhz5nr-+KJbc+Fcn3=sS6Y5xVTAi1Dbd+NTvK4Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XmrpVAhz5nr-+KJbc+Fcn3=sS6Y5xVTAi1Dbd+NTvK4Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Tue, 01 Sep 2015 22:07:09 -0000
X-Groupsio-MsgNum: 57166
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QWpDgw58+k1mSFBj"
Content-Disposition: inline

--QWpDgw58+k1mSFBj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2015 at 02:57:29PM -0700, Andre McCurdy wrote:
> On Mon, Aug 31, 2015 at 11:36 PM, Anders Darander <anders@chargestorm.se>=
 wrote:
> > * Andre McCurdy <armccurdy@gmail.com> [150831 22:03]:
> >
> >> On Mon, Aug 31, 2015 at 12:38 PM, Andreas M=FCller
> >> <schnitzeltony@googlemail.com> wrote:
> >> > On Mon, Aug 31, 2015 at 9:11 PM, Andre McCurdy <armccurdy@gmail.com>=
 wrote:
> >> >> On Mon, Aug 31, 2015 at 10:58 AM, Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >> >>> I cannot take this to meta-oe, because as soon as it's added there=
 it
> >> >>> will be used by all DISTROs even those who don't mind having GPLv3
> >> >>> version.
> >
> >> >>> Everybody would need to define PREFERRED_VERSION, because
> >> >>> DEFAULT_PREFERENCE is useless across different layers :/
> >> >>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2964
> >
> >> >>> So this either has to be introduced in oe-core or in completely se=
parate
> >> >>> layer which would be included only by those who cannot use GPLv3.
> >
> > I think that the correct way to handle those recipes (that isn't core
> > enough to be kept in oe-core) is to create a new layer, maybe meta-gplv2
> > or meta-nongplv3; dependig on how explicit the naming should be. This
> > layer could very well be put in meta-openembedded (the meta layer, not
> > meta-oe).
> >
> >> >> Third option would be to reduce the priority of meta-oe to be lower
> >> >> than oe-core.
> >
> >> >> That seems logical regardless of any GPLv3 discussion - since meta-=
oe
> >> >> "fills in the gaps" in oe-core, if something _is_ present in oe-core
> >> >> then it probably should be the default version.
> >
> >> > This scares me: to get a recipe in with old version not supporting
> >> > modern file systems you want to change meta-oe's layer priority
> >> > risiking unknown issues. I wonder how far the GPLv3 avoidance hype
> >> > takes us...
> >
> >> No, if you read the various threads, my preference is to have the
> >> GPLv2 parted recipe in oe-core. That option has been shot down though
> >> and the general consensus seems to be that the older version of parted
> >> is too buggy to be included anywhere in OE. That topic seems to be
> >> closed.
> >
> >> Trying to understand why meta-oe needs a higher priority than oe-core
> >> is a separate topic. If the priorities were changed it would allow
> >> older (and newer) versions of oe-core recipes to safely live in
> >> meta-oe. That would help non-GPLv3 versions of GPLv3 packages, but it
> >> might be useful in other cases too.
> >
> > Well, changing the priority might have effects on peoples current
> > builds; most likely effects that you don't anticipate during an upgrade.
> >
> > And at least periodically, meta-oe has modified how recipes from oe-core
> > has been built. Thus, the need for a higher priority of meta-oe as
> > compared to oe-core. (I know that I've had to undo such changes in my
> > own layers in older releases).
>=20
> Maybe just a personal preference, but I think completely replacing a
> recipe is a hackish approach best reserved for private layers. Giving
> meta-oe a higher priority wouldn't be needed if the oe-core recipes
> were modified via a .bbappend or by getting the meta-oe tweaks merged
> into oe-core. I don't know the history though. Maybe there are reasons
> why this hasn't been possible.
>=20
> According to bitbake-layers, the current list of oe-core recipes which
> are over-ridden by meta-oe is quite short though:
>=20
> iso-codes:
>   meta-oe              1.4
>   meta                 3.58
> libcap-ng:
>   meta-oe              0.7.7
>   meta                 0.7.7
> nativesdk-swig:
>   meta-oe              3.0.6
>   meta                 3.0.6
> xserver-nodm-init:
>   meta-oe              2.0
>   meta                 1.0
>=20
> The first 3 are transient (the oe-core versions were recently added
> and the meta-oe versions can be removed). Having meta-oe over-ride
> oe-core isn't necessary or helpful for these recipes.

Yes, that's why I'm asking people migrating recipes to oe-core to send
removal patch to meta-oe (while verifying that what they migrated wasn't
modified in meta-oe after they created their copy) - some people do it
some don't.

> I'm not sure what's going on with xserver-nodm-init. Both versions are
> being updated independently but it looks like they could be unified
> with minor changes.

Not minor changes, there is long ticket in bugzilla mostly related to
x11-common xserver-common, which result in this xserver-nodm-init
difference.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QWpDgw58+k1mSFBj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXmIZcACgkQN1Ujt2V2gBwd5QCfZxQz5w1oB8zd7UtSmzQMYmGl
ajIAnA5ptVg6s8yQmhqsB0n64qGzqXS3
=yPIl
-----END PGP SIGNATURE-----

--QWpDgw58+k1mSFBj--
