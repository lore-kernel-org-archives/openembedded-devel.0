Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8154B6BAAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 20:26:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r84KQ5cs023456
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Sep 2013 13:26:06 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 4 Sep 2013 13:26:05 -0700
Received: from yow-jmacdona-l1 (unknown [172.25.44.3])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id DC9297FE3;
	Wed,  4 Sep 2013 16:25:05 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 500CF40499; Wed,
	4 Sep 2013 16:26:03 -0400 (EDT)
Date: Wed, 4 Sep 2013 16:26:03 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Philip Balister <philip@balister.org>
Message-ID: <20130904202601.GO3761@windriver.com>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
	<CAOMwXhNV70uRZiL1T+gbguZnBrwUwdUzfGA30d6N-OvhSK__xA@mail.gmail.com>
	<CADkTA4P-tyfnX5Dywf8Z+tSEVxjbrykio5tFg_UmhkrTvORdyw@mail.gmail.com>
	<CAOMwXhNp0w=1=QW=e+82Q135wECMROUdcJ3aEaLUFKOu_68DEQ@mail.gmail.com>
	<CADkTA4PUf5ce5B206zP+7i4hZ0LWN_YD1VuooSZLkC4j-nmuJw@mail.gmail.com>
	<20130903210803.GD20985@deserted.net>
	<CADkTA4M=4Jrr6-4JP4bWM0Bwm7XxMvgyTi49XkcLGtLSpSMBvg@mail.gmail.com>
	<CANBf+V2Mp7Q+E0uW6YtoctCUcQa3sCma31Ygmm9f7nejYbUZJg@mail.gmail.com>
	<52273204.503@balister.org>
MIME-Version: 1.0
In-Reply-To: <52273204.503@balister.org>
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
X-List-Received-Date: Wed, 04 Sep 2013 20:26:19 -0000
X-Groupsio-MsgNum: 46067
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="daC8KDjlMyCcZyAo"
Content-Disposition: inline

--daC8KDjlMyCcZyAo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.09.=
04 (Wed 09:13) Philip Balister wrote:

> On 09/03/2013 11:27 PM, Joe MacDonald wrote:
> > On Tue, Sep 3, 2013 at 6:39 PM, Bruce Ashfield <bruce.ashfield@gmail.co=
m> wrote:
> >>
> >> On Tue, Sep 3, 2013 at 5:08 PM, Joe MacDonald <joe@deserted.net> wrote:
> >>> Little late coming to this party, I guess.  Sorry all.  In my defense
> >>> I'll just say that I was less connected than I expected to be over my
> >>> vacation and there's been considerable catching up to do.
> >>>
> >>> [Re: [oe] [meta-networking][PATCH] openflow: Add latest from git] On =
13.09.03 (Tue 09:38) Bruce Ashfield wrote:
> >>>
> >>>> On Tue, Sep 3, 2013 at 9:13 AM, Laszlo Papp <lpapp@kde.org> wrote:
> >>>>> IMO, most of this email is red herring, and the main topic is a net=
working
> >>>>> specification should be in meta-networking. Why would I (or anyone =
for that
> >>>>> matter) need *any* virtualization layer when I am working on a netw=
ork
> >>>>> device?
> >>>>
> >>>> Ah, so I see we won't address the fact that the mailing list should =
have
> >>>> been consulted and that the goals of the oe-layers should be to redu=
ce
> >>>> duplication and get everyone working together. I promise, I won't me=
ntion
> >>>> this again, but it is a key point I want to make.
> >>>>
> >>>> I understand where this is going, and I'll try to engage at a techni=
cal
> >>>> level, it's all that I can do.
> >>>>
> >>>>>
> >>>>> I am sorry for your historical misplacement, but it is not an excus=
e for
> >>>>> future mistakes IMHO. If your virtualization depends on network stu=
ff, you
> >>>>> should *not* force others for virtualization whatever that is. If y=
ou need
> >>>>> that, build on top of networking or use own recipes maintained by y=
ou.
> >>>>
> >>>> I don't agree with that characterization, since it is very black and=
 white.
> >>>>
> >>>> Having a binding to the larger meta-oe universe (at least for some r=
ecipes),
> >>>> isn't always a good thing, and having self contained layers is also =
something
> >>>> that is a goal at times. I'm not saying this is the case here, just =
that what
> >>>> you describe above about networking devices not wanting virtualizati=
on,
> >>>> is at times flipped around from other layers when looking at meta-oe.
> >>>
> >>> The archives contain my response to this and I did say I won't be goi=
ng
> >>> back to this particular topic again, so I'll just say that if you rea=
lly
> >>> feel that a dis-incentive to contributing something to meta-networking
> >>> (or to using meta-networking in your project) is an implicit dependen=
cy
> >>> on the larger meta-oe world, we should talk about that sometime.
> >>
> >> Ha. My bad on this front, I honestly didn't check the archives for wha=
t you
> >> had said before, I was just responding to the appearance of the recipe.
> >>
> >> As for the larger meta-oe being required to get at meta-networking, I'=
m not
> >> sure that you and I can solve that. The concern about being able to ge=
t an
> >> updated package from meta-networking, and not other packages from the
> >> other layers, i.e. the granularity of the one big chunk is hard to dea=
l with
> >> if you only want to get a specific layer updated.
> >=20
> > That is exactly the topic I was suggesting we can talk about if that's
> > an issue you're trying to work around in meta-virtualization.  This
> > isn't really the place for it, though, and I don't want to confuse
> > anyone or subvert the thread.  Let me say that I'll leave it with you.
> >  I'd be happy to try to understand what the concerns are you have with
> > depending on meta-networking and whether they're inherent in meta-net
> > or if they're due to meta-net being part of the larger meta-oe.
> >=20
> > The same applies to anyone else working on a layer with clearly
> > networking components that may be reluctant to incorporate it into
> > meta-net.  I'm welcoming submissions of useful components and I'd be
> > really disappointed if we ended up having the same (or similar)
> > recipes in multiple public layers purely due to reticence and
> > (perceived?) extra dependencies.  I'll be other meta-oe maintainers
> > feel the same, too.  Balkanisation benefits no one.
> >=20
> > Back on topic, then.
>=20
> I am really late to the game ...
>=20
> If you are having trouble figuring out what layer a recipe belongs in
> due to it being needed for several layers, maybe the package in question
> belongs in oe-core.

Yeah, that's definitely a good indicator, there's a number of packages
I'd started to look at for meta-net only to discover them already in
oe-core and that's definitely the right place for them.  We've talked
about suggesting others in meta-net to oe-core, but that's where the
other guiding principle of oe-core comes in, that it should be tight.  I
think in this specific example, openflow is way beyond the scope of what
oe-core would want.

You're right, though, any time a discussion around a recipe becomes
contentious in the sense of it is needed in several different layers,
it's reasonable to ask the question "is the best home for this
oe-core?".

-J.

>=20
> Philip
>=20
> >=20
> >>
> >> Does anyone else have a good suggestion on how to deal with that ?
> >>
> >>>
> >>>> meta-virt and meta-networking are very similar in age and the group =
of
> >>>> recipes to start meta-virt were a merging of two existing layers (a =
good
> >>>> collaboration) and a lot contributed by ENEA, it was a good effort a=
nd I
> >>>> don't think it's right to drop all traces of that effort or describe=
 it as a
> >>>> mistake.
> >>>>
> >>>> Again, opinions vary, that's part of the fun.
> >>>>
> >>>>>
> >>>>> I fail to see how it is a problem. Even more, the recipe was comple=
tely
> >>>>> broken like virtual/libc, *ancient* version, wrong rm'f stuff, bad
> >>>>> description IMHO, etc for meta-networking.
> >>>>
> >>>> Patches would have been accepted :)
> >>>>
> >>>>>
> >>>>> I do not personally mind if you keep your clone because it is your
> >>>>> business, but surely, networking devices should use a network layer=
, and
> >>>>> that is exactly the point of meta-networking.
> >>>>
> >>>> I'll agree to disagree, I've tried to say that we should look at wha=
t the two
> >>>> layers need, come up with a plan, keep the credit to the original au=
thors
> >>>> and then decide how to move forward. i.e. if there are multiple user=
s of the
> >>>> recipe, maybe see about getting it into oe-core, etc. But I see that=
 isn't on
> >>>> the menu today.
> >>>>
> >>>> I'll ping Joe and we'll see what we can figure out as timing for a p=
ath forward.
> >>>
> >>> At this point I'm inclined to agree that OpenFlow is a reasonable fit
> >>> for meta-networking, it's something I think I may have even referenced
> >>
> >> FWIW, I agree as well.
> >>
> >>> in my original proposal for creating meta-networking.  But if Laszlo =
is
> >>> going to propose a new recipe for inclusion, I'll wait to see it befo=
re
> >>> trying out any of the existing stuff in my tree.  I certainly don't w=
ant
> >>> to invalidate or break any of the work in meta-virtualization and I
> >>> appreciate hearing that this is a concern, but hopefully you understa=
nd
> >>> that if that did happen, it'd be by accident as I'm not on the
> >>> meta-virtualization list and I don't know what you guys are doing over
> >>> there.
> >>
> >> What about the following:
> >>
> >>   - We at least give reference to the other recipe, either in the git =
commit
> >>     message or the recipe itself ? Regardless if this was a clean room
> >>     implementation or not .. they are nearly identical (of course that=
 means
> >>     there is one right way to do this), and at least maintaining the p=
aper trail
> >>     if the recipe migrates is valuable.
> >=20
> > That was one of my few comments to Laszlo in this thread.  I'd like to =
see that.
> >=20
> >>  - We run some tests against meta-virt and give you the thumbs up when=
 it
> >>    is safe to merge, and the meta-virt copy can be deleted. I definite=
ly don't
> >>    want two of these running around.
> >=20
> > I don't mind delaying a merge a bit while waiting for more feedback on
> > testing, provided we're talking about a reasonable timeframe.
> > Otherwise, if the submitted OpenFlow is working well enough in
> > meta-net, I'm inclined to merge it and take patches from you guys if
> > you find issues down the road.  That'll be how it will work anyway in
> > three month's time, for example, when meta-virt has dropped their
> > copy.
> >=20
> > How long do you think you'll need on this?
> >=20
> >>  - Now that everyone is aware of the specific use case, we can watch a=
nd
> >>    coordinate updates in the future ?
> >=20
> > Sure, again, provided we're talking a reasonable timeframe.  One of
> > the things on my exceedingly long todo list (and that others have been
> > immensely helpful with) has been to bring forward OE Classic recipes
> > that make sense for meta-net.   Wherever possible I prefer to try to
> > coordinate with the OE Classic recipe maintainers / contributors, but
> > that's not always possible.  I think the same thing would apply here,
> > we'll do our best to coordinate and know that occasionally there may
> > be hiccups like this one.
> >=20
> > -J.
> >=20
> >>
> >> Would that be acceptable ?
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >>>
> >>> That is to say feel free to pipe up on any stuff like this in the
> >>> future and if you have any specific requests on how this merge happen=
s,
> >>> please let me know.
> >>>
> >>> -J.
> >>>
> >>>>
> >>>> Cheers,
> >>>>
> >>>> Bruce
> >>>>
> >>>>>
> >>>>>
> >>>>> On Tue, Sep 3, 2013 at 2:04 PM, Bruce Ashfield <bruce.ashfield@gmai=
l.com>wrote:
> >>>>>
> >>>>>> On Mon, Sep 2, 2013 at 11:55 PM, Laszlo Papp <lpapp@kde.org> wrote:
> >>>>>>> On Tue, Sep 3, 2013 at 2:56 AM, Bruce Ashfield <bruce.ashfield@gm=
ail.com
> >>>>>>> wrote:
> >>>>>>>
> >>>>>>>> On Mon, Sep 2, 2013 at 4:20 AM, Laszlo Papp <lpapp@kde.org> wrot=
e:
> >>>>>>>>> 1) The version in meta-virtualization is quite old. It is basic=
ally
> >>>>>> from
> >>>>>>>> 2009,
> >>>>>>>>> and a lot of things has changed since then.
> >>>>>>>>
> >>>>>>>> And that was on purpose, there are some tight bindings to SDN an=
d hence
> >>>>>> why
> >>>>>>>> it is in meta-virtualization, and not a valid reason to not cont=
act the
> >>>>>>>> layer
> >>>>>>>> maintainers directly, have a discussion and not set the update t=
o the
> >>>>>>>> current
> >>>>>>>> layer.
> >>>>>>>>
> >>>>>>>
> >>>>>>> I do not understand why I would need to contact a foo layer maint=
ainer
> >>>>>> when
> >>>>>>> I think a recipe has not much to do with foo.
> >>>>>>
> >>>>>> really ? I honestly don't know what to say about that logic.
> >>>>>>
> >>>>>> There's a recipe in another public layer, that is being updated, a=
nd was
> >>>>>> put there for a reason. You grab a copy, send it to another layer =
and
> >>>>>> don't even bother to cc' the originating layer's mailing list ?
> >>>>>>
> >>>>>> You don't think the right thing to do would be to ask a few questi=
ons,
> >>>>>> and agree to the path forward ?
> >>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>>> If you would have asked, you would have been told that updates a=
re
> >>>>>> pending
> >>>>>>>> with bindings that need to stay in lock step with other parts of
> >>>>>> meta-virt.
> >>>>>>>>
> >>>>>>>
> >>>>>>> Sorry, but how is this relevant? It is an extremely old recipe, a=
nd
> >>>>>> should
> >>>>>>> not be used. Moreover, this should not block the non-ancient user=
s at
> >>>>>> all,
> >>>>>>> which is probably the majority.
> >>>>>>
> >>>>>> The only difference between your recipe is a new SRCREV, of which =
there
> >>>>>> was one already pending. And perhaps, if you asked, you would have=
 found
> >>>>>> out that there were dependent other layers and recipes on some par=
ticular
> >>>>>> SRCREV.
> >>>>>>
> >>>>>> In such a situation, we could have updated the recipe to create a =
new one
> >>>>>> and kept the old revision around.
> >>>>>>
> >>>>>> Instead, you copied it, updated the SRCREV with no reference to the
> >>>>>> original
> >>>>>> layer, the authors and their contributions. So we have two copies =
in the
> >>>>>> ecosystem.
> >>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>>>> 2) More importantly, this software is more like for networking =
rather
> >>>>>>>> than
> >>>>>>>>> virtualization, so I think it was misplaced.
> >>>>>>>>
> >>>>>>>> I disagree, so for now meta-virt is going to keep it's variants =
of the
> >>>>>>>> recipes and
> >>>>>>>> we need to have an actual discussion to figure out the best way =
forward.
> >>>>>>>>
> >>>>>>>
> >>>>>>> ,,, and I disagree with you. Read the specification for openflow,
> >>>>>> please. I
> >>>>>>
> >>>>>> I've read the specification, but I don't understand why I'm being =
talked
> >>>>>> down
> >>>>>> to here.
> >>>>>>
> >>>>>> See above, there's enough reason to have a discussion or at least
> >>>>>> follow some etiquette.
> >>>>>>
> >>>>>>> fail to understand how it has anything to do with virtualization.
> >>>>>>> Seriously, this is a software for networking devices. That is, ex=
actly
> >>>>>> the
> >>>>>>> main purpose what meta-networking is trying to achieve: aiding the
> >>>>>>> development for networking devices. As for me, it is totally
> >>>>>>> non-comprehensive why a networking specification and the relevant
> >>>>>>> implementation would be in meta-virtualization rather than
> >>>>>> meta-networking.
> >>>>>>
> >>>>>> There are different opinions on many things, that's the way things=
 work.
> >>>>>> I don't think branding those alternate opinions as invalid and "non
> >>>>>> comprehensive"
> >>>>>> is productive .. do you ?
> >>>>>>
> >>>>>> openflow has control channels to openvswitch, openvswitch is tight=
ly
> >>>>>> coupled
> >>>>>> to the cloud and infrastructure work that happens in meta-virt.
> >>>>>> OpenDayLight
> >>>>>> also has bindings to openvswitch, virtualization and more SDN comp=
onents.
> >>>>>> Having them all move in lockstep and not introduce incompatible SR=
CREVs
> >>>>>> as they all update has proven tricky in the past, and will do so. =
Spreading
> >>>>>> out across multiple layers will only make it more difficult.
> >>>>>>
> >>>>>> I'm not arguing that openflow isn't networking, that wouldn't be l=
ogical.
> >>>>>> I'm
> >>>>>> saying that it is where it is for a reason, there are multiple use=
s and we
> >>>>>> can't
> >>>>>> simply wave a wand and invalidate those other uses because we don'=
t agree
> >>>>>> with them.
> >>>>>>
> >>>>>>>
> >>>>>>> Not to mention, I do not understand why you are trying to set a s=
traw man
> >>>>>>> in here. The discussion you are "requesting" is exactly what this=
 thread
> >>>>>> is
> >>>>>>> meant to be. So, I think you are simply incorrect IMHO. :-)
> >>>>>>
> >>>>>> You didn't cc' the meta-vitualization mailing list. I happen to be=
 on
> >>>>>> both, and
> >>>>>> by chance this is happening, and shouldn't replace a more reasonab=
le
> >>>>>> workflow.
> >>>>>>
> >>>>>> Cheers,
> >>>>>>
> >>>>>> Bruce
> >>>>>>
> >>>>>>>
> >>>>>>> Cheers,
> >>>>>>> Laszlo
> >>>>>>> _______________________________________________
> >>>>>>> Openembedded-devel mailing list
> >>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> "Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> >>>>>> thee at its end"
> >>>>>> _______________________________________________
> >>>>>> Openembedded-devel mailing list
> >>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>>>
> >>>>> _______________________________________________
> >>>>> Openembedded-devel mailing list
> >>>>> Openembedded-devel@lists.openembedded.org
> >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>
> >>>>
> >>>>
> >>> --
> >>> -Joe MacDonald.
> >>> :wq
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end"
> >=20
> >=20
> >=20
> >=20

--=20
-Joe MacDonald.
:wq

--daC8KDjlMyCcZyAo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlInl1kACgkQPN8S4W6ZZncWZACfWB8fDrA+gd+oS25zqSMgz5Zq
utsAn2PUH7m4/+bjAgN9iZyz5BTbjmju
=JTa0
-----END PGP SIGNATURE-----

--daC8KDjlMyCcZyAo--
