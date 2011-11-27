Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RUmq2-0005xh-Pz
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 23:04:43 +0100
Received: by vbbfc21 with SMTP id fc21so2792862vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2011 13:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pZ4+P7PiqjXdoFmFkLxY56iNYPg7Fsf8b8cd48jyV6Q=;
	b=KSVzEcWkB25YfwMNkjbaPUFcDZCKBJR86FX5M2/tR/8E6deAjTUpPudskkC1CXhxXS
	4ZxW7Zb+984z1NdUf6OenI/15QJ7M9SEu8JZvCmPvuxbM9eB6MEgb/4W//CcC1SwkiC5
	A6hSi/tsBaGOboqr0gK+lgikPf5BBgmq1/wXY=
MIME-Version: 1.0
Received: by 10.52.33.140 with SMTP id r12mr41384219vdi.36.1322431083684; Sun,
	27 Nov 2011 13:58:03 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Sun, 27 Nov 2011 13:58:03 -0800 (PST)
In-Reply-To: <CA+M6bXmKsZmFTjrhMuouj3cYKHJX9e7t3gSUTTyf4nBzXr5g-A@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
	<0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>
	<CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
	<1322134409.3391.21.camel@mattotaupa>
	<CAP9ODKrKN3m_V09j6+C1dL9P8yHtuck4P5jcdKv4Ua=mrP1E=Q@mail.gmail.com>
	<jalvr1$3bl$1@dough.gmane.org>
	<CAFU7RzM5-VAbs2-5qR-D6eo5+LsVQc+e3rGK6zZ5NvviSvUWig@mail.gmail.com>
	<CACW_hTY9ybnax9xHb1KV4Y25J3nNRkQqCs=TqUivcBcYOT7BkA@mail.gmail.com>
	<CA+M6bXkjViAHc6ADH+vyvikeOaLa1+V1uCX6S=d75Z18Z2oj8w@mail.gmail.com>
	<4ED0C603.9020900@telia.com>
	<CA+M6bXmsbDoFS_8etRA+RYqkP7b0x8t998Tcmn9KyKhAbEP2ew@mail.gmail.com>
	<CACW_hTZ6tkRGj938SAg4xmENwe-qRZMGpE=8-KvexQydgD-m_w@mail.gmail.com>
	<CA+M6bXnGhgrzZSuOe99ViWU=eZ5+Q+exWqWkstFJM-MCYzc6zQ@mail.gmail.com>
	<1322344896.16303.49.camel@mattotaupa>
	<CA+M6bXkfDtMOE6RUDbGCc59CFaGijCcc=Abj7sqh2veEVYvM-A@mail.gmail.com>
	<1322347742.16303.66.camel@mattotaupa>
	<CA+M6bX=FNKdJ-BrctoqhnzRzV=Hg41BXSx5pCODx3xrMyVnwfg@mail.gmail.com>
	<CACW_hTbyuhWH8_B_=r0UM-MEq_N_=SwwZ7WP7Wi5RPO6mtxudA@mail.gmail.com>
	<CA+M6bXkMqS6frOYwvGmLQwvSYWerYzC5fX4sXXu0hO1ogPwXhA@mail.gmail.com>
	<CACW_hTayj6TLHk_u6+JpTUGQ_w=Vh4n-Fm42sFsFfO4PougsLw@mail.gmail.com>
	<CA+M6bXmKsZmFTjrhMuouj3cYKHJX9e7t3gSUTTyf4nBzXr5g-A@mail.gmail.com>
Date: Sun, 27 Nov 2011 22:58:03 +0100
Message-ID: <CACW_hTagWTn_UvuTRRnJ6EyX9ifkuZV6Bt343GQB4Fso5PEEQw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Plans for OE classic future
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Nov 2011 22:04:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/11/27 Tom Rini <tom.rini@gmail.com>

> On Sun, Nov 27, 2011 at 10:25 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > 2011/11/27 Tom Rini <tom.rini@gmail.com>
> >
> >> On Sun, Nov 27, 2011 at 3:12 AM, Frans Meulenbroeks
> >> <fransmeulenbroeks@gmail.com> wrote:
> >> > Personally I think we are not yet at at point where we should move OE
> >> > classic to a pull/patches model. Give it some time.
> >>
> >> So, why are we not at that point yet for OE classic?  I'd like to
> >> think I've been timely in my pulls.
> >
> > I'm not saying you are not timely. Au contraire, you are.
>
> OK.  So provided we have an easy way to make pull requests of trees
> hosted on oe.org (like oe-core/meta-oe today), are there any other
> objections to moving towards pull request model for classic OE?
>

My whole point is that things should be easy for those who want to
contribute.
And it should be clear what goes in and how it should be done (and not like
in some other place where it seems to be left to the discretion of the pull
god, note that I am quite happy with the way you do your job).

>
> >> > I understand the concerns with people using master for new projects,
> but
> >> I
> >> > also understand the concerns of people that for one reason or another
> are
> >> > still bound to oe-classic.
> >> >
> >> > I feel that it also would be helpful to have some sort of staging area
> >> > where people can update things before they are pulled. Doing that
> >> > distributed not really creates visibility to those changes, so I'd
> say it
> >> > is better to keep that centralized. Might even be more convenient too.
> >>
> >> We already have this for oe-core/meta-oe so it shouldn't be hard to
> >> make up a contrib repo for classic OE, for folks that don't want to
> >> just fork the mirror on github.
> >>
> >
> > Whether it is a branch or a separate repo does not make too much of a
> > difference (at least not to me).
> > It was my impression that a branch would work a little bit simpler, but I
> > may well be mistaken here.
>
> My understanding of the git server side of things is a contrib repo is
> easier to setup and manage permission-wise.
>
I can't comment on that as I have no knowledge on the server side. I'm
looking at it from a user/contributor perspective.

>
> >> > That still leaves the issue of new projects.
> >> > What if we decide to rename master to e.g. maintenance-staging, or
> >> legacy,
> >> > or classic or whatever you want to; keeping it as it is now (so not
> R/O),
> >> > and have a new master that is R/O and only contains a document with
> some
> >> > explanation and referring to oe-core for new projects. This doc could
> >> > mention the legacy branch together with a statement that it is not
> >> desired
> >> > for new projects, but mainly there for maintenance/testing purposes.
> >>
> >> The only part here I object to is saying we need an anyone-can-write
> >> branch.
> >>
> >
> > If it is a contrib repo or overlay fine with me.
> > I do think it is probably convenient that it should be an
> > anyone-who-is-authorized-can-write repo/overlay/branch/whatever, in order
> > not to unneededly raise the barrier to submit patches.
>
> So, like we do today for openembedded-core-contrib /
> meta-openembedded-contrib?
>
> Sorry but since all my projects are still based upon oe-classic, I never
bothered to peek at those.

Anyway these are my opinions. There were some others that had concerns. Not
sure how they feel about it.
And it is good that we come to a plan and define a workflow and a migration
path.

The original statement by someone saying "OE classic will be R/O soon", was
a little bit too quick and too incomplete for the community I think. At
least it was for me.

Frans

