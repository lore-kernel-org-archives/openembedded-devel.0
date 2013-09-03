Return-Path: <joe@deserted.net>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1A4036BD75
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 23:52:37 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id qa5so9906528ieb.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 16:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=938H8JdhxK6HfjxGtVkbv1uP9m5T8KaGCBmXCRcyHLY=;
	b=QeuHV+Gksem8gvR6pU2HQwFaaUz4BF+CsI4I8VaaX4Ggg0bW7xHEt2FRG+YyozRxPR
	mVkOjTX3bOT3+MmzAtRcFG7bRJ8S8R+OAbRVaVHcsjTfeKK1WjzySvxP4ostHoagT6vE
	WEsN1vpkTl38BAW03fNmCGMBE3vXLmQ5c8siNoP0tFrEv6IUAuBEjQgtyXVEnGeLUvgF
	CHKFz9UA7n6pziTwQgK9JgbEvFBBsgh6ptfQ4uC0G9SmVNT4CVwRW+lMinUlRXWCjAY0
	o04rAP+LVJ4Wnbbm+P1S9VXyezaJrWH8QB69Rbeg9ePEeEJAXU9hfHVjoFUe6qRVs/iO
	lKAw==
X-Gm-Message-State: ALoCoQmzcsdJkH3E53bfgDwMW0EH+CofQwZ7yc8C/LNX9LcYHT2yYNW0eTVyId1wAWRkawNhOKRL
X-Received: by 10.50.119.42 with SMTP id kr10mr17864349igb.20.1378243089160;
	Tue, 03 Sep 2013 14:18:09 -0700 (PDT)
Received: from deserted.net ([128.224.252.2]) by mx.google.com with ESMTPSA id
	yt10sm33212278igb.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 14:18:08 -0700 (PDT)
Date: Tue, 3 Sep 2013 17:18:06 -0400
From: Joe MacDonald <joe@deserted.net>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20130903211805.GE20985@deserted.net>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
	<CAOMwXhNV70uRZiL1T+gbguZnBrwUwdUzfGA30d6N-OvhSK__xA@mail.gmail.com>
	<CADkTA4P-tyfnX5Dywf8Z+tSEVxjbrykio5tFg_UmhkrTvORdyw@mail.gmail.com>
	<CAOMwXhNp0w=1=QW=e+82Q135wECMROUdcJ3aEaLUFKOu_68DEQ@mail.gmail.com>
	<CADkTA4PUf5ce5B206zP+7i4hZ0LWN_YD1VuooSZLkC4j-nmuJw@mail.gmail.com>
	<CAOMwXhNvcxZXE-uh-APJ-BFZrZcQrujOXchBJjyELnrXnJ1c6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhNvcxZXE-uh-APJ-BFZrZcQrujOXchBJjyELnrXnJ1c6g@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
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
X-List-Received-Date: Tue, 03 Sep 2013 23:52:38 -0000
X-Groupsio-MsgNum: 46053
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline

--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.09.=
03 (Tue 14:47) Laszlo Papp wrote:

> On Tue, Sep 3, 2013 at 2:38 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>=20
>     On Tue, Sep 3, 2013 at 9:13 AM, Laszlo Papp <lpapp@kde.org> wrote:
>     > IMO, most of this email is red herring, and the main topic is a
>     networking
>     > specification should be in meta-networking. Why would I (or anyone =
for
>     that
>     > matter) need *any* virtualization layer when I am working on a netw=
ork
>     > device?
>=20
>     Ah, so I see we won't address the fact that the mailing list should h=
ave
>     been consulted and that the goals of the oe-layers should be to reduce
>     duplication and get everyone working together. I promise, I won't men=
tion
>     this again, but it is a key point I want to make.
>=20
>=20
> Frankly, you have mentioned the credit so strongly in this thread for a f=
ew
> lines which is not even copyright'd, I will rewrite this stuff from scrat=
ch
> today.

It may be that that's an appropriate approach at this juncture, I don't
know.  I'd like to see us not lose any work that's already been done and
would be disappointed if something turns out to be a regression in the
meta-networking version of openflow from the meta-virtualization version
purely due to a communications breakdown.  I'll trust you guys to sort
that out.

My only comment on what I've seen so far is maybe in the commit log
remove the 2) comment as it borders on editorializing and update the log
to match more of the style of recipes ported from "the world" (mostly OE
Classic, so far, for meta-networking).  See 2cde4a, 8fec90, or 413a9 for
something I think is a good way to reference history.

Thanks,
-J.

> I am sad to see this discussion is going into "credit debate" rather
> than technical stuff.
>=20
> Actually, I even had a recipe before looking into virtualization, but that
> probably does not matter for you...
>=20
>=20
>     > I am sorry for your historical misplacement, but it is not an excus=
e for
>     > future mistakes IMHO. If your virtualization depends on network stu=
ff,
>     you
>     > should *not* force others for virtualization whatever that is. If y=
ou
>     need
>     > that, build on top of networking or use own recipes maintained by y=
ou.
>=20
>     I don't agree with that characterization, since it is very black and =
white.
>=20
>     Having a binding to the larger meta-oe universe (at least for some
>     recipes),
>     isn't always a good thing, and having self contained layers is also
>     something
>     that is a goal at times. I'm not saying this is the case here, just t=
hat
>     what
>     you describe above about networking devices not wanting virtualizatio=
n,
>     is at times flipped around from other layers when looking at meta-oe.
>=20
>     meta-virt and meta-networking are very similar in age and the group of
>     recipes to start meta-virt were a merging of two existing layers (a g=
ood
>     collaboration) and a lot contributed by ENEA, it was a good effort an=
d I
>     don't think it's right to drop all traces of that effort or describe =
it as
>     a
>     mistake.
>=20
>     Again, opinions vary, that's part of the fun.
>=20
>=20
> The problem is not that opinions matter, but *your* opinion about black b=
eing
> white IMHO. Did you even bother to read what the openflow standard is for=
? It
> is for networking devices, come on, and you still think it is not a
> meta-networking material?
>=20
> Please come up with a *rebruttal* and bother substantiating it.
> =A0
>=20
>     > I fail to see how it is a problem. Even more, the recipe was comple=
tely
>     > broken like virtual/libc, *ancient* version, wrong rm'f stuff, bad
>     > description IMHO, etc for meta-networking.
>=20
>     Patches would have been accepted :)
>=20
>=20
> Here is the patch, so what is your argument again? That it should remain =
in
> your beloved meta-virtualization while disregarding the fact it is a netw=
orking
> standard?
>=20
> I do not seem to have pushed the latest version of the change though.=A0
>=20
>=20
>     > I do not personally mind if you keep your clone because it is your
>     > business, but surely, networking devices should use a network layer=
, and
>     > that is exactly the point of meta-networking.
>=20
>     I'll agree to disagree, I've tried to say that we should look at what=
 the
>     two
>     layers need, come up with a plan, keep the credit to the original aut=
hors
>     and then decide how to move forward. i.e. if there are multiple users=
 of
>     the
>     recipe, maybe see about getting it into oe-core, etc. But I see that =
isn't
>     on
>     the menu today.
>=20
>=20
> oe-core would not make sense for this. It is *far* from being that core
> component. It is actually a very domain specific networking =A0component.
> =A0
>=20
>     I'll ping Joe and we'll see what we can figure out as timing for a pa=
th
>     forward.
>=20
>=20
> There is no *any* need to ping him. This change was sent to the mailing l=
ist as
> instructed by the meta-networking layer manual, hence he will see it. Ple=
ase
> keep this "ping" in public, and do not hide this behind the scenes in pri=
vate.
> The more eyes, the better.

--=20
-Joe MacDonald.
:wq

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlImUg0ACgkQwFvcllog0Xwx+QCfds8Pffe7/EIA2+cFvp7Rwc4F
q+YAn1IsiO7HNVJJiw/0bT9TWruOvP7o
=ZECY
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--
