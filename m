Return-Path: <joe@deserted.net>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 92F106BD57
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 03:27:27 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id s9so11976112iec.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 20:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=0yvTM/39C223kzXEHPJTHfCqgWXNZqYOQKe1U8QzGKc=;
	b=GoVuQbhQ2hX/USOrIVeEg9oZfFf3ikuQwpA5Gdq0MB9D9GQsJCwkTRfTpfsSYxTGoh
	8uHlQbFm3Yvnzts+fnHO4aT7zPDSFt68UW/RGzgh0woBEGiPyDvNdE6xDFxr/GM1ScYS
	hnaNz2hQEAbUrmPtXN0afLEeAFNKBGYeTFu9leoH6HDRoRPIzh5PKV/eznSGJ61ciKly
	zF1B3dYQRfTyvYpm8zgmwTUWtBhA2grDdTEnUGBdvplPyDb9S59Zkf8M4vPdbWuyBtQ1
	Ky0WC3oOiaQUFmPCx3sdcjwEMcqExfmaYSIAQOgfdQj1vnMEQ3GpSqeByQiw3JY0Yjd1
	A8Aw==
X-Gm-Message-State: ALoCoQlVFF625jvDZ5DVgEWlb/nTRvhKa89Wg5OLPtl6RW5o2rfjbFxlm73C3HEqO3wla3h5Gc5t
MIME-Version: 1.0
X-Received: by 10.50.9.72 with SMTP id x8mr278848iga.19.1378265249213; Tue, 03
	Sep 2013 20:27:29 -0700 (PDT)
Received: by 10.42.152.71 with HTTP; Tue, 3 Sep 2013 20:27:29 -0700 (PDT)
In-Reply-To: <CADkTA4M=4Jrr6-4JP4bWM0Bwm7XxMvgyTi49XkcLGtLSpSMBvg@mail.gmail.com>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
	<CAOMwXhNV70uRZiL1T+gbguZnBrwUwdUzfGA30d6N-OvhSK__xA@mail.gmail.com>
	<CADkTA4P-tyfnX5Dywf8Z+tSEVxjbrykio5tFg_UmhkrTvORdyw@mail.gmail.com>
	<CAOMwXhNp0w=1=QW=e+82Q135wECMROUdcJ3aEaLUFKOu_68DEQ@mail.gmail.com>
	<CADkTA4PUf5ce5B206zP+7i4hZ0LWN_YD1VuooSZLkC4j-nmuJw@mail.gmail.com>
	<20130903210803.GD20985@deserted.net>
	<CADkTA4M=4Jrr6-4JP4bWM0Bwm7XxMvgyTi49XkcLGtLSpSMBvg@mail.gmail.com>
Date: Tue, 3 Sep 2013 23:27:29 -0400
Message-ID: <CANBf+V2Mp7Q+E0uW6YtoctCUcQa3sCma31Ygmm9f7nejYbUZJg@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Wed, 04 Sep 2013 03:27:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 3, 2013 at 6:39 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Tue, Sep 3, 2013 at 5:08 PM, Joe MacDonald <joe@deserted.net> wrote:
> > Little late coming to this party, I guess.  Sorry all.  In my defense
> > I'll just say that I was less connected than I expected to be over my
> > vacation and there's been considerable catching up to do.
> >
> > [Re: [oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.09.03 (Tue 09:38) Bruce Ashfield wrote:
> >
> >> On Tue, Sep 3, 2013 at 9:13 AM, Laszlo Papp <lpapp@kde.org> wrote:
> >> > IMO, most of this email is red herring, and the main topic is a networking
> >> > specification should be in meta-networking. Why would I (or anyone for that
> >> > matter) need *any* virtualization layer when I am working on a network
> >> > device?
> >>
> >> Ah, so I see we won't address the fact that the mailing list should have
> >> been consulted and that the goals of the oe-layers should be to reduce
> >> duplication and get everyone working together. I promise, I won't mention
> >> this again, but it is a key point I want to make.
> >>
> >> I understand where this is going, and I'll try to engage at a technical
> >> level, it's all that I can do.
> >>
> >> >
> >> > I am sorry for your historical misplacement, but it is not an excuse for
> >> > future mistakes IMHO. If your virtualization depends on network stuff, you
> >> > should *not* force others for virtualization whatever that is. If you need
> >> > that, build on top of networking or use own recipes maintained by you.
> >>
> >> I don't agree with that characterization, since it is very black and white.
> >>
> >> Having a binding to the larger meta-oe universe (at least for some recipes),
> >> isn't always a good thing, and having self contained layers is also something
> >> that is a goal at times. I'm not saying this is the case here, just that what
> >> you describe above about networking devices not wanting virtualization,
> >> is at times flipped around from other layers when looking at meta-oe.
> >
> > The archives contain my response to this and I did say I won't be going
> > back to this particular topic again, so I'll just say that if you really
> > feel that a dis-incentive to contributing something to meta-networking
> > (or to using meta-networking in your project) is an implicit dependency
> > on the larger meta-oe world, we should talk about that sometime.
>
> Ha. My bad on this front, I honestly didn't check the archives for what you
> had said before, I was just responding to the appearance of the recipe.
>
> As for the larger meta-oe being required to get at meta-networking, I'm not
> sure that you and I can solve that. The concern about being able to get an
> updated package from meta-networking, and not other packages from the
> other layers, i.e. the granularity of the one big chunk is hard to deal with
> if you only want to get a specific layer updated.

That is exactly the topic I was suggesting we can talk about if that's
an issue you're trying to work around in meta-virtualization.  This
isn't really the place for it, though, and I don't want to confuse
anyone or subvert the thread.  Let me say that I'll leave it with you.
 I'd be happy to try to understand what the concerns are you have with
depending on meta-networking and whether they're inherent in meta-net
or if they're due to meta-net being part of the larger meta-oe.

The same applies to anyone else working on a layer with clearly
networking components that may be reluctant to incorporate it into
meta-net.  I'm welcoming submissions of useful components and I'd be
really disappointed if we ended up having the same (or similar)
recipes in multiple public layers purely due to reticence and
(perceived?) extra dependencies.  I'll be other meta-oe maintainers
feel the same, too.  Balkanisation benefits no one.

Back on topic, then.

>
> Does anyone else have a good suggestion on how to deal with that ?
>
> >
> >> meta-virt and meta-networking are very similar in age and the group of
> >> recipes to start meta-virt were a merging of two existing layers (a good
> >> collaboration) and a lot contributed by ENEA, it was a good effort and I
> >> don't think it's right to drop all traces of that effort or describe it as a
> >> mistake.
> >>
> >> Again, opinions vary, that's part of the fun.
> >>
> >> >
> >> > I fail to see how it is a problem. Even more, the recipe was completely
> >> > broken like virtual/libc, *ancient* version, wrong rm'f stuff, bad
> >> > description IMHO, etc for meta-networking.
> >>
> >> Patches would have been accepted :)
> >>
> >> >
> >> > I do not personally mind if you keep your clone because it is your
> >> > business, but surely, networking devices should use a network layer, and
> >> > that is exactly the point of meta-networking.
> >>
> >> I'll agree to disagree, I've tried to say that we should look at what the two
> >> layers need, come up with a plan, keep the credit to the original authors
> >> and then decide how to move forward. i.e. if there are multiple users of the
> >> recipe, maybe see about getting it into oe-core, etc. But I see that isn't on
> >> the menu today.
> >>
> >> I'll ping Joe and we'll see what we can figure out as timing for a path forward.
> >
> > At this point I'm inclined to agree that OpenFlow is a reasonable fit
> > for meta-networking, it's something I think I may have even referenced
>
> FWIW, I agree as well.
>
> > in my original proposal for creating meta-networking.  But if Laszlo is
> > going to propose a new recipe for inclusion, I'll wait to see it before
> > trying out any of the existing stuff in my tree.  I certainly don't want
> > to invalidate or break any of the work in meta-virtualization and I
> > appreciate hearing that this is a concern, but hopefully you understand
> > that if that did happen, it'd be by accident as I'm not on the
> > meta-virtualization list and I don't know what you guys are doing over
> > there.
>
> What about the following:
>
>   - We at least give reference to the other recipe, either in the git commit
>     message or the recipe itself ? Regardless if this was a clean room
>     implementation or not .. they are nearly identical (of course that means
>     there is one right way to do this), and at least maintaining the paper trail
>     if the recipe migrates is valuable.

That was one of my few comments to Laszlo in this thread.  I'd like to see that.

>  - We run some tests against meta-virt and give you the thumbs up when it
>    is safe to merge, and the meta-virt copy can be deleted. I definitely don't
>    want two of these running around.

I don't mind delaying a merge a bit while waiting for more feedback on
testing, provided we're talking about a reasonable timeframe.
Otherwise, if the submitted OpenFlow is working well enough in
meta-net, I'm inclined to merge it and take patches from you guys if
you find issues down the road.  That'll be how it will work anyway in
three month's time, for example, when meta-virt has dropped their
copy.

How long do you think you'll need on this?

>  - Now that everyone is aware of the specific use case, we can watch and
>    coordinate updates in the future ?

Sure, again, provided we're talking a reasonable timeframe.  One of
the things on my exceedingly long todo list (and that others have been
immensely helpful with) has been to bring forward OE Classic recipes
that make sense for meta-net.   Wherever possible I prefer to try to
coordinate with the OE Classic recipe maintainers / contributors, but
that's not always possible.  I think the same thing would apply here,
we'll do our best to coordinate and know that occasionally there may
be hiccups like this one.

-J.

>
> Would that be acceptable ?
>
> Cheers,
>
> Bruce
>
> >
> > That is to say feel free to pipe up on any stuff like this in the
> > future and if you have any specific requests on how this merge happens,
> > please let me know.
> >
> > -J.
> >
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >> >
> >> >
> >> > On Tue, Sep 3, 2013 at 2:04 PM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:
> >> >
> >> >> On Mon, Sep 2, 2013 at 11:55 PM, Laszlo Papp <lpapp@kde.org> wrote:
> >> >> > On Tue, Sep 3, 2013 at 2:56 AM, Bruce Ashfield <bruce.ashfield@gmail.com
> >> >> >wrote:
> >> >> >
> >> >> >> On Mon, Sep 2, 2013 at 4:20 AM, Laszlo Papp <lpapp@kde.org> wrote:
> >> >> >> > 1) The version in meta-virtualization is quite old. It is basically
> >> >> from
> >> >> >> 2009,
> >> >> >> > and a lot of things has changed since then.
> >> >> >>
> >> >> >> And that was on purpose, there are some tight bindings to SDN and hence
> >> >> why
> >> >> >> it is in meta-virtualization, and not a valid reason to not contact the
> >> >> >> layer
> >> >> >> maintainers directly, have a discussion and not set the update to the
> >> >> >> current
> >> >> >> layer.
> >> >> >>
> >> >> >
> >> >> > I do not understand why I would need to contact a foo layer maintainer
> >> >> when
> >> >> > I think a recipe has not much to do with foo.
> >> >>
> >> >> really ? I honestly don't know what to say about that logic.
> >> >>
> >> >> There's a recipe in another public layer, that is being updated, and was
> >> >> put there for a reason. You grab a copy, send it to another layer and
> >> >> don't even bother to cc' the originating layer's mailing list ?
> >> >>
> >> >> You don't think the right thing to do would be to ask a few questions,
> >> >> and agree to the path forward ?
> >> >>
> >> >> >
> >> >> >
> >> >> >> If you would have asked, you would have been told that updates are
> >> >> pending
> >> >> >> with bindings that need to stay in lock step with other parts of
> >> >> meta-virt.
> >> >> >>
> >> >> >
> >> >> > Sorry, but how is this relevant? It is an extremely old recipe, and
> >> >> should
> >> >> > not be used. Moreover, this should not block the non-ancient users at
> >> >> all,
> >> >> > which is probably the majority.
> >> >>
> >> >> The only difference between your recipe is a new SRCREV, of which there
> >> >> was one already pending. And perhaps, if you asked, you would have found
> >> >> out that there were dependent other layers and recipes on some particular
> >> >> SRCREV.
> >> >>
> >> >> In such a situation, we could have updated the recipe to create a new one
> >> >> and kept the old revision around.
> >> >>
> >> >> Instead, you copied it, updated the SRCREV with no reference to the
> >> >> original
> >> >> layer, the authors and their contributions. So we have two copies in the
> >> >> ecosystem.
> >> >>
> >> >> >
> >> >> >
> >> >> >> > 2) More importantly, this software is more like for networking rather
> >> >> >> than
> >> >> >> > virtualization, so I think it was misplaced.
> >> >> >>
> >> >> >> I disagree, so for now meta-virt is going to keep it's variants of the
> >> >> >> recipes and
> >> >> >> we need to have an actual discussion to figure out the best way forward.
> >> >> >>
> >> >> >
> >> >> > ,,, and I disagree with you. Read the specification for openflow,
> >> >> please. I
> >> >>
> >> >> I've read the specification, but I don't understand why I'm being talked
> >> >> down
> >> >> to here.
> >> >>
> >> >> See above, there's enough reason to have a discussion or at least
> >> >> follow some etiquette.
> >> >>
> >> >> > fail to understand how it has anything to do with virtualization.
> >> >> > Seriously, this is a software for networking devices. That is, exactly
> >> >> the
> >> >> > main purpose what meta-networking is trying to achieve: aiding the
> >> >> > development for networking devices. As for me, it is totally
> >> >> > non-comprehensive why a networking specification and the relevant
> >> >> > implementation would be in meta-virtualization rather than
> >> >> meta-networking.
> >> >>
> >> >> There are different opinions on many things, that's the way things work.
> >> >> I don't think branding those alternate opinions as invalid and "non
> >> >> comprehensive"
> >> >> is productive .. do you ?
> >> >>
> >> >> openflow has control channels to openvswitch, openvswitch is tightly
> >> >> coupled
> >> >> to the cloud and infrastructure work that happens in meta-virt.
> >> >> OpenDayLight
> >> >> also has bindings to openvswitch, virtualization and more SDN components.
> >> >> Having them all move in lockstep and not introduce incompatible SRCREVs
> >> >> as they all update has proven tricky in the past, and will do so. Spreading
> >> >> out across multiple layers will only make it more difficult.
> >> >>
> >> >> I'm not arguing that openflow isn't networking, that wouldn't be logical.
> >> >> I'm
> >> >> saying that it is where it is for a reason, there are multiple uses and we
> >> >> can't
> >> >> simply wave a wand and invalidate those other uses because we don't agree
> >> >> with them.
> >> >>
> >> >> >
> >> >> > Not to mention, I do not understand why you are trying to set a straw man
> >> >> > in here. The discussion you are "requesting" is exactly what this thread
> >> >> is
> >> >> > meant to be. So, I think you are simply incorrect IMHO. :-)
> >> >>
> >> >> You didn't cc' the meta-vitualization mailing list. I happen to be on
> >> >> both, and
> >> >> by chance this is happening, and shouldn't replace a more reasonable
> >> >> workflow.
> >> >>
> >> >> Cheers,
> >> >>
> >> >> Bruce
> >> >>
> >> >> >
> >> >> > Cheers,
> >> >> > Laszlo
> >> >> > _______________________________________________
> >> >> > Openembedded-devel mailing list
> >> >> > Openembedded-devel@lists.openembedded.org
> >> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> >>
> >> >>
> >> >>
> >> >> --
> >> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> >> thee at its end"
> >> >> _______________________________________________
> >> >> Openembedded-devel mailing list
> >> >> Openembedded-devel@lists.openembedded.org
> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> >>
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> >>
> > --
> > -Joe MacDonald.
> > :wq
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"




-- 
Joe MacDonald
:wq

