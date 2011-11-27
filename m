Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RUiGq-0005Kr-R8
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 18:12:05 +0100
Received: by qyk30 with SMTP id 30so1089480qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2011 09:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lYCFrEg0mzw3wDc93QBYBNBKKFpR+3rANVlpmSZpz6I=;
	b=pPbZGuONeUm2q0qwi6zUeoZOTaZOS+PMVhsJme16oBhPWSS0ADSgSXbPnPlrTLMOq8
	57LxSHWUYgQGxewXQuMIuvErSYMSFaGvaVNLd352uvLjSAf2021yAaOHYqqC46YjzBoI
	Hxq0IBNOh31h7x6tWLvKttMBnr5EBGMR8V5ZE=
MIME-Version: 1.0
Received: by 10.229.61.167 with SMTP id t39mr4553112qch.226.1322413527233;
	Sun, 27 Nov 2011 09:05:27 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sun, 27 Nov 2011 09:05:27 -0800 (PST)
In-Reply-To: <CACW_hTbyuhWH8_B_=r0UM-MEq_N_=SwwZ7WP7Wi5RPO6mtxudA@mail.gmail.com>
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
Date: Sun, 27 Nov 2011 10:05:27 -0700
Message-ID: <CA+M6bXkMqS6frOYwvGmLQwvSYWerYzC5fX4sXXu0hO1ogPwXhA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sun, 27 Nov 2011 17:12:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 27, 2011 at 3:12 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/11/27 Tom Rini <tom.rini@gmail.com>
>
>>
>>
>> So the question is, what is the long term plan for classic OE based
>> stuff? =A0The TSC has been saying, perhaps not with enough voice or
>> emphasis:
>> - 2011.03 is the last "release" of oe.dev (unless someone(s) step up
>> and wish to do another!)
>> - 2011.03-maintenance will be maintained as long as people are saying
>> they have a need for it.
>> - The master branch needs to go away somehow as the last step of
>> migration. =A0This is what I was trying to say below...
>>
>> >> In my mind, we couldn't do a technical branching of the repository, w=
e
>> >> made a new one. But people are still working off of a branch made
>> >> against an 8 month old snapshot. =A0We really want to encourage this =
to
>> >> stop. =A0If we were all in one repository still, it would be people
>> >> saying "don't make legacy/main read-only! =A0I still want to add thin=
gs
>> >> to it!".
>> >
>> > I did not understand that paragraph. Sorry.
>>
>> The analogy I'm trying to make between classic OE master branch and
>> behavior is that it wasn't "lets start from scratch with this new
>> repository and hope someday most people stop using the old tree" it
>> was "if we could cleanly do a 'git branch -m master legacy' and start
>> master as the new meta-oe repository, we would".
>>
>> Now I'm going to make a Linux Kernel analogy. =A0The 2.4 series didn't
>> (nearly) go away for a long while after 2.6 came out, but after a
>> while the rules for what could go in got rather restrictive.
>>
>> The direction the TSC has recommended for how to deal with classic OE
>> is to have the folks that can't yet move off of it be using the
>> maintenance branch. =A0It's not going to be pulled out from under
>> anyone. =A0It's just got rules about what kind of changes are allowed
>> in. =A0Today that's "must exist in relevant oe-core based layer or be
>> N/A in that world". =A0I can't imagine that changing until the user base
>> is small enough and themselves in a maintenance mode to be happy with
>> that too.
>>
>> If anything it seems like there's an objection to switching classic OE
>> from "free for all" to the pull request (or patches posted) model
>> oe-core/meta-oe/etc are using.
>>
> Personally I think we are not yet at at point where we should move OE
> classic to a pull/patches model. Give it some time.

So, why are we not at that point yet for OE classic?  I'd like to
think I've been timely in my pulls.

> I understand the concerns with people using master for new projects, but =
I
> also understand the concerns of people that for one reason or another are
> still bound to oe-classic.
>
> I feel that it also would be helpful to have some sort of staging area
> where people can update things before they are pulled. Doing that
> distributed not really creates visibility to those changes, so I'd say it
> is better to keep that centralized. Might even be more convenient too.

We already have this for oe-core/meta-oe so it shouldn't be hard to
make up a contrib repo for classic OE, for folks that don't want to
just fork the mirror on github.

> That still leaves the issue of new projects.
> What if we decide to rename master to e.g. maintenance-staging, or legacy=
,
> or classic or whatever you want to; keeping it as it is now (so not R/O),
> and have a new master that is R/O and only contains a document with some
> explanation and referring to oe-core for new projects. This doc could
> mention the legacy branch together with a statement that it is not desire=
d
> for new projects, but mainly there for maintenance/testing purposes.

The only part here I object to is saying we need an anyone-can-write branch=
.

--=20
Tom


