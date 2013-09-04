Return-Path: <joe@deserted.net>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id D95B86BABB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 21:02:36 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id a11so496239qcx.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 14:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=IcITnAl8Xrg6Wiq9Dc++OOrhmWFl7qAz+9IruNAgpgA=;
	b=XTT6SQNONov4m0DgY513By0MXm+if01dJaeb5BKj1bC9b5YzI9IBTlP/Hek07Pbgk9
	Uuo58SSVmJywDcxIQRABlmrzVcePXVI/FVZixT0MgmPxzEXoDKHQHV0sazzbmq9sc+2w
	zuVlgIhNm20EsRNkxbOX39e88w2EfvxZMvhWPOZopwoJ9HJjbnQdEhzz7OCUNMey0u7d
	Ly5KoyJM37nCmqeLZJSoKnnoeOE22x6v4psyqUxyh/n4hj2ex8WO2kjR5EnVL1z5CCHr
	Xf4+rSc24Cr5Hc0UbK0cfoYIv2wgsvE/4hanmti67hIFzAz/aF4+Mx6NxwqZxiAZ0t0A
	0trA==
X-Gm-Message-State: ALoCoQm7xzUHmfwdW4WMYvQpQOC05ZJwNWOhThsO8W2mqx0C3hSmov13LYXy1HhQC/c7Cl7VgLNx
X-Received: by 10.49.62.3 with SMTP id u3mr5810463qer.6.1378328558071;
	Wed, 04 Sep 2013 14:02:38 -0700 (PDT)
Received: from deserted.net (198-84-238-35.cpe.teksavvy.com. [198.84.238.35])
	by mx.google.com with ESMTPSA id
	fy7sm39960051qeb.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 14:02:36 -0700 (PDT)
Date: Wed, 4 Sep 2013 17:02:24 -0400
From: Joe MacDonald <joe@deserted.net>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20130904210220.GP3761@deserted.net>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
	<CAOMwXhNV70uRZiL1T+gbguZnBrwUwdUzfGA30d6N-OvhSK__xA@mail.gmail.com>
	<CADkTA4P-tyfnX5Dywf8Z+tSEVxjbrykio5tFg_UmhkrTvORdyw@mail.gmail.com>
	<CAOMwXhNp0w=1=QW=e+82Q135wECMROUdcJ3aEaLUFKOu_68DEQ@mail.gmail.com>
	<CADkTA4PUf5ce5B206zP+7i4hZ0LWN_YD1VuooSZLkC4j-nmuJw@mail.gmail.com>
	<CAOMwXhNvcxZXE-uh-APJ-BFZrZcQrujOXchBJjyELnrXnJ1c6g@mail.gmail.com>
	<20130903211805.GE20985@deserted.net>
MIME-Version: 1.0
In-Reply-To: <20130903211805.GE20985@deserted.net>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 04 Sep 2013 21:02:37 -0000
X-Groupsio-MsgNum: 46068
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VZEZlOQeSr/zV9d3"
Content-Disposition: inline

--VZEZlOQeSr/zV9d3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.09.=
03 (Tue 17:18) Joe MacDonald wrote:

> [Re: [oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.0=
9.03 (Tue 14:47) Laszlo Papp wrote:
>=20
> > On Tue, Sep 3, 2013 at 2:38 PM, Bruce Ashfield <bruce.ashfield@gmail.co=
m>
> > wrote:
> >=20
> >     On Tue, Sep 3, 2013 at 9:13 AM, Laszlo Papp <lpapp@kde.org> wrote:
> >     > IMO, most of this email is red herring, and the main topic is a
> >     networking
> >     > specification should be in meta-networking. Why would I (or anyon=
e for
> >     that
> >     > matter) need *any* virtualization layer when I am working on a ne=
twork
> >     > device?
> >=20
> >     Ah, so I see we won't address the fact that the mailing list should=
 have
> >     been consulted and that the goals of the oe-layers should be to red=
uce
> >     duplication and get everyone working together. I promise, I won't m=
ention
> >     this again, but it is a key point I want to make.
> >=20
> >=20
> > Frankly, you have mentioned the credit so strongly in this thread for a=
 few
> > lines which is not even copyright'd, I will rewrite this stuff from scr=
atch
> > today.
>=20
> It may be that that's an appropriate approach at this juncture, I don't
> know.  I'd like to see us not lose any work that's already been done and
> would be disappointed if something turns out to be a regression in the
> meta-networking version of openflow from the meta-virtualization version
> purely due to a communications breakdown.  I'll trust you guys to sort
> that out.
>=20
> My only comment on what I've seen so far is maybe in the commit log
> remove the 2) comment as it borders on editorializing and update the log
> to match more of the style of recipes ported from "the world" (mostly OE
> Classic, so far, for meta-networking).  See 2cde4a, 8fec90, or 413a9 for
> something I think is a good way to reference history.

Hey Laszlo,

Just to close on this, if Bruce (or someone working with
meta-virtualization) is nearing completion of testing with the recipe
you've already submitted, is that the one you want me to consider for
merging, or are you going to have a v2 coming out soon?

FYI:  I expect to be done merging your other patch (the stunnel one)
later on today.  It didn't get lost, I just didn't get to merge it
yesterday.

-J.

>=20
> Thanks,
> -J.
>=20
> > I am sad to see this discussion is going into "credit debate" rather
> > than technical stuff.
> >=20
> > Actually, I even had a recipe before looking into virtualization, but t=
hat
> > probably does not matter for you...
> >=20
> >=20
> >     > I am sorry for your historical misplacement, but it is not an exc=
use for
> >     > future mistakes IMHO. If your virtualization depends on network s=
tuff,
> >     you
> >     > should *not* force others for virtualization whatever that is. If=
 you
> >     need
> >     > that, build on top of networking or use own recipes maintained by=
 you.
> >=20
> >     I don't agree with that characterization, since it is very black an=
d white.
> >=20
> >     Having a binding to the larger meta-oe universe (at least for some
> >     recipes),
> >     isn't always a good thing, and having self contained layers is also
> >     something
> >     that is a goal at times. I'm not saying this is the case here, just=
 that
> >     what
> >     you describe above about networking devices not wanting virtualizat=
ion,
> >     is at times flipped around from other layers when looking at meta-o=
e.
> >=20
> >     meta-virt and meta-networking are very similar in age and the group=
 of
> >     recipes to start meta-virt were a merging of two existing layers (a=
 good
> >     collaboration) and a lot contributed by ENEA, it was a good effort =
and I
> >     don't think it's right to drop all traces of that effort or describ=
e it as
> >     a
> >     mistake.
> >=20
> >     Again, opinions vary, that's part of the fun.
> >=20
> >=20
> > The problem is not that opinions matter, but *your* opinion about black=
 being
> > white IMHO. Did you even bother to read what the openflow standard is f=
or? It
> > is for networking devices, come on, and you still think it is not a
> > meta-networking material?
> >=20
> > Please come up with a *rebruttal* and bother substantiating it.
> > =A0
> >=20
> >     > I fail to see how it is a problem. Even more, the recipe was comp=
letely
> >     > broken like virtual/libc, *ancient* version, wrong rm'f stuff, bad
> >     > description IMHO, etc for meta-networking.
> >=20
> >     Patches would have been accepted :)
> >=20
> >=20
> > Here is the patch, so what is your argument again? That it should remai=
n in
> > your beloved meta-virtualization while disregarding the fact it is a ne=
tworking
> > standard?
> >=20
> > I do not seem to have pushed the latest version of the change though.=A0
> >=20
> >=20
> >     > I do not personally mind if you keep your clone because it is your
> >     > business, but surely, networking devices should use a network lay=
er, and
> >     > that is exactly the point of meta-networking.
> >=20
> >     I'll agree to disagree, I've tried to say that we should look at wh=
at the
> >     two
> >     layers need, come up with a plan, keep the credit to the original a=
uthors
> >     and then decide how to move forward. i.e. if there are multiple use=
rs of
> >     the
> >     recipe, maybe see about getting it into oe-core, etc. But I see tha=
t isn't
> >     on
> >     the menu today.
> >=20
> >=20
> > oe-core would not make sense for this. It is *far* from being that core
> > component. It is actually a very domain specific networking =A0componen=
t.
> > =A0
> >=20
> >     I'll ping Joe and we'll see what we can figure out as timing for a =
path
> >     forward.
> >=20
> >=20
> > There is no *any* need to ping him. This change was sent to the mailing=
 list as
> > instructed by the meta-networking layer manual, hence he will see it. P=
lease
> > keep this "ping" in public, and do not hide this behind the scenes in p=
rivate.
> > The more eyes, the better.
>=20
--=20
-Joe MacDonald.
:wq

--VZEZlOQeSr/zV9d3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlInn9MACgkQwFvcllog0Xx1vACffWwhwe2+Xnz4/xt07HNzGBm1
4EEAoKYhyd4yL2VExd9vddIzSTDX3EGW
=1Ilo
-----END PGP SIGNATURE-----

--VZEZlOQeSr/zV9d3--
