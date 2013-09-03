Return-Path: <joe@deserted.net>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 44F7A6BE08
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 00:03:22 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id m16so9286648ieq.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 17:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=afmCRq5JFqFOkMBc/gTrJa1wBoV72HJ0VAuaan53sh4=;
	b=UBVlRisX6MxcbZgTTH7SRS4ck13PmO7rIoVAReld4/sTJkqDbtKxXOEUs4LtSXhQZ1
	VBVwJbtVGOwf8/T8tTw+9BTGsZvP5UITzta11Um5vNK5vWBmC3lflmLCZDFGsJUGwWk0
	MnN4L/F85phVT2XQPW+8KHL1sQXvgQFGbQyF6Vbr42TPoIqE8djYj+boMyh1yZ6uWIub
	t+Hoia52l/nqTR3cK27GkSW2791//6IWI9XE/rNNaGygtuwnezCoS63XITm1RGvGIM+4
	Hsfn9g+wwZV2J0G4pjg4vUiSGx8lI1YuZ/noGewc7p935DjKLc/oz+ccBXA7UPaI+f2h
	RF6w==
X-Gm-Message-State: ALoCoQlkMB4IKOvr7EWbxzuIADHePZRKm1hiTx3o2pCg4I5VWsV721dkhRFgTnnuMXbVP4lSnryU
X-Received: by 10.50.87.4 with SMTP id t4mr17697845igz.18.1378242488315;
	Tue, 03 Sep 2013 14:08:08 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id lp9sm6520355igb.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 14:08:07 -0700 (PDT)
Date: Tue, 3 Sep 2013 17:08:05 -0400
From: Joe MacDonald <joe@deserted.net>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20130903210803.GD20985@deserted.net>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
	<CAOMwXhNV70uRZiL1T+gbguZnBrwUwdUzfGA30d6N-OvhSK__xA@mail.gmail.com>
	<CADkTA4P-tyfnX5Dywf8Z+tSEVxjbrykio5tFg_UmhkrTvORdyw@mail.gmail.com>
	<CAOMwXhNp0w=1=QW=e+82Q135wECMROUdcJ3aEaLUFKOu_68DEQ@mail.gmail.com>
	<CADkTA4PUf5ce5B206zP+7i4hZ0LWN_YD1VuooSZLkC4j-nmuJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4PUf5ce5B206zP+7i4hZ0LWN_YD1VuooSZLkC4j-nmuJw@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 Sep 2013 00:03:23 -0000
X-Groupsio-MsgNum: 46054
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline

--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Little late coming to this party, I guess.  Sorry all.  In my defense
I'll just say that I was less connected than I expected to be over my
vacation and there's been considerable catching up to do.

[Re: [oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.09.=
03 (Tue 09:38) Bruce Ashfield wrote:

> On Tue, Sep 3, 2013 at 9:13 AM, Laszlo Papp <lpapp@kde.org> wrote:
> > IMO, most of this email is red herring, and the main topic is a network=
ing
> > specification should be in meta-networking. Why would I (or anyone for =
that
> > matter) need *any* virtualization layer when I am working on a network
> > device?
>=20
> Ah, so I see we won't address the fact that the mailing list should have
> been consulted and that the goals of the oe-layers should be to reduce
> duplication and get everyone working together. I promise, I won't mention
> this again, but it is a key point I want to make.
>=20
> I understand where this is going, and I'll try to engage at a technical
> level, it's all that I can do.
>=20
> >
> > I am sorry for your historical misplacement, but it is not an excuse for
> > future mistakes IMHO. If your virtualization depends on network stuff, =
you
> > should *not* force others for virtualization whatever that is. If you n=
eed
> > that, build on top of networking or use own recipes maintained by you.
>=20
> I don't agree with that characterization, since it is very black and whit=
e.
>=20
> Having a binding to the larger meta-oe universe (at least for some recipe=
s),
> isn't always a good thing, and having self contained layers is also somet=
hing
> that is a goal at times. I'm not saying this is the case here, just that =
what
> you describe above about networking devices not wanting virtualization,
> is at times flipped around from other layers when looking at meta-oe.

The archives contain my response to this and I did say I won't be going
back to this particular topic again, so I'll just say that if you really
feel that a dis-incentive to contributing something to meta-networking
(or to using meta-networking in your project) is an implicit dependency
on the larger meta-oe world, we should talk about that sometime.

> meta-virt and meta-networking are very similar in age and the group of
> recipes to start meta-virt were a merging of two existing layers (a good
> collaboration) and a lot contributed by ENEA, it was a good effort and I
> don't think it's right to drop all traces of that effort or describe it a=
s a
> mistake.
>=20
> Again, opinions vary, that's part of the fun.
>=20
> >
> > I fail to see how it is a problem. Even more, the recipe was completely
> > broken like virtual/libc, *ancient* version, wrong rm'f stuff, bad
> > description IMHO, etc for meta-networking.
>=20
> Patches would have been accepted :)
>=20
> >
> > I do not personally mind if you keep your clone because it is your
> > business, but surely, networking devices should use a network layer, and
> > that is exactly the point of meta-networking.
>=20
> I'll agree to disagree, I've tried to say that we should look at what the=
 two
> layers need, come up with a plan, keep the credit to the original authors
> and then decide how to move forward. i.e. if there are multiple users of =
the
> recipe, maybe see about getting it into oe-core, etc. But I see that isn'=
t on
> the menu today.
>=20
> I'll ping Joe and we'll see what we can figure out as timing for a path f=
orward.

At this point I'm inclined to agree that OpenFlow is a reasonable fit
for meta-networking, it's something I think I may have even referenced
in my original proposal for creating meta-networking.  But if Laszlo is
going to propose a new recipe for inclusion, I'll wait to see it before
trying out any of the existing stuff in my tree.  I certainly don't want
to invalidate or break any of the work in meta-virtualization and I
appreciate hearing that this is a concern, but hopefully you understand
that if that did happen, it'd be by accident as I'm not on the
meta-virtualization list and I don't know what you guys are doing over
there.

That is to say feel free to pipe up on any stuff like this in the
future and if you have any specific requests on how this merge happens,
please let me know.

-J.

>=20
> Cheers,
>=20
> Bruce
>=20
> >
> >
> > On Tue, Sep 3, 2013 at 2:04 PM, Bruce Ashfield <bruce.ashfield@gmail.co=
m>wrote:
> >
> >> On Mon, Sep 2, 2013 at 11:55 PM, Laszlo Papp <lpapp@kde.org> wrote:
> >> > On Tue, Sep 3, 2013 at 2:56 AM, Bruce Ashfield <bruce.ashfield@gmail=
=2Ecom
> >> >wrote:
> >> >
> >> >> On Mon, Sep 2, 2013 at 4:20 AM, Laszlo Papp <lpapp@kde.org> wrote:
> >> >> > 1) The version in meta-virtualization is quite old. It is basical=
ly
> >> from
> >> >> 2009,
> >> >> > and a lot of things has changed since then.
> >> >>
> >> >> And that was on purpose, there are some tight bindings to SDN and h=
ence
> >> why
> >> >> it is in meta-virtualization, and not a valid reason to not contact=
 the
> >> >> layer
> >> >> maintainers directly, have a discussion and not set the update to t=
he
> >> >> current
> >> >> layer.
> >> >>
> >> >
> >> > I do not understand why I would need to contact a foo layer maintain=
er
> >> when
> >> > I think a recipe has not much to do with foo.
> >>
> >> really ? I honestly don't know what to say about that logic.
> >>
> >> There's a recipe in another public layer, that is being updated, and w=
as
> >> put there for a reason. You grab a copy, send it to another layer and
> >> don't even bother to cc' the originating layer's mailing list ?
> >>
> >> You don't think the right thing to do would be to ask a few questions,
> >> and agree to the path forward ?
> >>
> >> >
> >> >
> >> >> If you would have asked, you would have been told that updates are
> >> pending
> >> >> with bindings that need to stay in lock step with other parts of
> >> meta-virt.
> >> >>
> >> >
> >> > Sorry, but how is this relevant? It is an extremely old recipe, and
> >> should
> >> > not be used. Moreover, this should not block the non-ancient users at
> >> all,
> >> > which is probably the majority.
> >>
> >> The only difference between your recipe is a new SRCREV, of which there
> >> was one already pending. And perhaps, if you asked, you would have fou=
nd
> >> out that there were dependent other layers and recipes on some particu=
lar
> >> SRCREV.
> >>
> >> In such a situation, we could have updated the recipe to create a new =
one
> >> and kept the old revision around.
> >>
> >> Instead, you copied it, updated the SRCREV with no reference to the
> >> original
> >> layer, the authors and their contributions. So we have two copies in t=
he
> >> ecosystem.
> >>
> >> >
> >> >
> >> >> > 2) More importantly, this software is more like for networking ra=
ther
> >> >> than
> >> >> > virtualization, so I think it was misplaced.
> >> >>
> >> >> I disagree, so for now meta-virt is going to keep it's variants of =
the
> >> >> recipes and
> >> >> we need to have an actual discussion to figure out the best way for=
ward.
> >> >>
> >> >
> >> > ,,, and I disagree with you. Read the specification for openflow,
> >> please. I
> >>
> >> I've read the specification, but I don't understand why I'm being talk=
ed
> >> down
> >> to here.
> >>
> >> See above, there's enough reason to have a discussion or at least
> >> follow some etiquette.
> >>
> >> > fail to understand how it has anything to do with virtualization.
> >> > Seriously, this is a software for networking devices. That is, exact=
ly
> >> the
> >> > main purpose what meta-networking is trying to achieve: aiding the
> >> > development for networking devices. As for me, it is totally
> >> > non-comprehensive why a networking specification and the relevant
> >> > implementation would be in meta-virtualization rather than
> >> meta-networking.
> >>
> >> There are different opinions on many things, that's the way things wor=
k.
> >> I don't think branding those alternate opinions as invalid and "non
> >> comprehensive"
> >> is productive .. do you ?
> >>
> >> openflow has control channels to openvswitch, openvswitch is tightly
> >> coupled
> >> to the cloud and infrastructure work that happens in meta-virt.
> >> OpenDayLight
> >> also has bindings to openvswitch, virtualization and more SDN componen=
ts.
> >> Having them all move in lockstep and not introduce incompatible SRCREVs
> >> as they all update has proven tricky in the past, and will do so. Spre=
ading
> >> out across multiple layers will only make it more difficult.
> >>
> >> I'm not arguing that openflow isn't networking, that wouldn't be logic=
al.
> >> I'm
> >> saying that it is where it is for a reason, there are multiple uses an=
d we
> >> can't
> >> simply wave a wand and invalidate those other uses because we don't ag=
ree
> >> with them.
> >>
> >> >
> >> > Not to mention, I do not understand why you are trying to set a stra=
w man
> >> > in here. The discussion you are "requesting" is exactly what this th=
read
> >> is
> >> > meant to be. So, I think you are simply incorrect IMHO. :-)
> >>
> >> You didn't cc' the meta-vitualization mailing list. I happen to be on
> >> both, and
> >> by chance this is happening, and shouldn't replace a more reasonable
> >> workflow.
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >> >
> >> > Cheers,
> >> > Laszlo
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end"
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
--=20
-Joe MacDonald.
:wq

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlImT6EACgkQwFvcllog0XyA/gCdH38szaxtdJfX2KEl15S4UN/5
D1UAn3WYNg3byNJhsHq5B4VTVIvEHWrN
=shp2
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
