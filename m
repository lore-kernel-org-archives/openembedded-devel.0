Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RUbop-00037S-Vc
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 11:18:44 +0100
Received: by vbbfc21 with SMTP id fc21so2591093vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2011 02:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=G9DWZBwltIIJ1c4VlKatYtlJI2eO9SboGkQMPP6kQrk=;
	b=YFpmnuOsD1JIxc8Gbd5pi8eI2rm8rnPdkonupgxeeItBQvz2o8mIkfz9C4rz7QC2NO
	L+t824XHdBQ6HvuaL8Umf2ppphPhKveBH7yQRUL+9ta5fl79+dnfIkOmFa8+M53GsK1O
	7hb5WTkd2GrBQSj4f2KcVRLGT/Y3Tbvf0ew3g=
MIME-Version: 1.0
Received: by 10.52.33.140 with SMTP id r12mr39750076vdi.36.1322388726787; Sun,
	27 Nov 2011 02:12:06 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Sun, 27 Nov 2011 02:12:06 -0800 (PST)
In-Reply-To: <CA+M6bX=FNKdJ-BrctoqhnzRzV=Hg41BXSx5pCODx3xrMyVnwfg@mail.gmail.com>
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
Date: Sun, 27 Nov 2011 11:12:06 +0100
Message-ID: <CACW_hTbyuhWH8_B_=r0UM-MEq_N_=SwwZ7WP7Wi5RPO6mtxudA@mail.gmail.com>
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
X-List-Received-Date: Sun, 27 Nov 2011 10:18:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/11/27 Tom Rini <tom.rini@gmail.com>

>
>
> So the question is, what is the long term plan for classic OE based
> stuff?  The TSC has been saying, perhaps not with enough voice or
> emphasis:
> - 2011.03 is the last "release" of oe.dev (unless someone(s) step up
> and wish to do another!)
> - 2011.03-maintenance will be maintained as long as people are saying
> they have a need for it.
> - The master branch needs to go away somehow as the last step of
> migration.  This is what I was trying to say below...
>
> >> In my mind, we couldn't do a technical branching of the repository, we
> >> made a new one. But people are still working off of a branch made
> >> against an 8 month old snapshot.  We really want to encourage this to
> >> stop.  If we were all in one repository still, it would be people
> >> saying "don't make legacy/main read-only!  I still want to add things
> >> to it!".
> >
> > I did not understand that paragraph. Sorry.
>
> The analogy I'm trying to make between classic OE master branch and
> behavior is that it wasn't "lets start from scratch with this new
> repository and hope someday most people stop using the old tree" it
> was "if we could cleanly do a 'git branch -m master legacy' and start
> master as the new meta-oe repository, we would".
>
> Now I'm going to make a Linux Kernel analogy.  The 2.4 series didn't
> (nearly) go away for a long while after 2.6 came out, but after a
> while the rules for what could go in got rather restrictive.
>
> The direction the TSC has recommended for how to deal with classic OE
> is to have the folks that can't yet move off of it be using the
> maintenance branch.  It's not going to be pulled out from under
> anyone.  It's just got rules about what kind of changes are allowed
> in.  Today that's "must exist in relevant oe-core based layer or be
> N/A in that world".  I can't imagine that changing until the user base
> is small enough and themselves in a maintenance mode to be happy with
> that too.
>
> If anything it seems like there's an objection to switching classic OE
> from "free for all" to the pull request (or patches posted) model
> oe-core/meta-oe/etc are using.
>
> Personally I think we are not yet at at point where we should move OE
classic to a pull/patches model. Give it some time.

I understand the concerns with people using master for new projects, but I
also understand the concerns of people that for one reason or another are
still bound to oe-classic.

I feel that it also would be helpful to have some sort of staging area
where people can update things before they are pulled. Doing that
distributed not really creates visibility to those changes, so I'd say it
is better to keep that centralized. Might even be more convenient too.

That still leaves the issue of new projects.
What if we decide to rename master to e.g. maintenance-staging, or legacy,
or classic or whatever you want to; keeping it as it is now (so not R/O),
and have a new master that is R/O and only contains a document with some
explanation and referring to oe-core for new projects. This doc could
mention the legacy branch together with a statement that it is not desired
for new projects, but mainly there for maintenance/testing purposes.

Frans.

