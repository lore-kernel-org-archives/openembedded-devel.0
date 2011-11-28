Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RUr0T-0004pf-B7
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 03:31:45 +0100
Received: by qadc10 with SMTP id c10so3705746qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2011 18:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=137HJS7+dm+LcIp1/DS3O7vz1JR9RQzAe5PQ1PLcpaw=;
	b=r6RwHx22oaklwGu81kVBEEKb+T+YyptxneaLSoD4eIshY/D1q3hrZ+aTqjKF4V61yo
	lnr08nrgxbNlTWXLPjl967PV//v/+NobqFjfybRoUh85IJERfmyq/IB5kl07EBD9EvUp
	IvSf8YKikOwwA6aHbcb6nUKhXG4IV1IIqJaas=
MIME-Version: 1.0
Received: by 10.224.180.131 with SMTP id bu3mr13149019qab.5.1322447107569;
	Sun, 27 Nov 2011 18:25:07 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sun, 27 Nov 2011 18:25:07 -0800 (PST)
In-Reply-To: <CACW_hTagWTn_UvuTRRnJ6EyX9ifkuZV6Bt343GQB4Fso5PEEQw@mail.gmail.com>
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
	<CACW_hTagWTn_UvuTRRnJ6EyX9ifkuZV6Bt343GQB4Fso5PEEQw@mail.gmail.com>
Date: Sun, 27 Nov 2011 19:25:07 -0700
Message-ID: <CA+M6bXmFC6hrbToJiVMZzFUPiKp-OB-uvx7aznBisnMrdybxpA@mail.gmail.com>
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
X-List-Received-Date: Mon, 28 Nov 2011 02:31:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 27, 2011 at 2:58 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/11/27 Tom Rini <tom.rini@gmail.com>
>
>> On Sun, Nov 27, 2011 at 10:25 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>> > 2011/11/27 Tom Rini <tom.rini@gmail.com>
>> >
>> >> On Sun, Nov 27, 2011 at 3:12 AM, Frans Meulenbroeks
>> >> <fransmeulenbroeks@gmail.com> wrote:
>> >> > Personally I think we are not yet at at point where we should move =
OE
>> >> > classic to a pull/patches model. Give it some time.
>> >>
>> >> So, why are we not at that point yet for OE classic? =A0I'd like to
>> >> think I've been timely in my pulls.
>> >
>> > I'm not saying you are not timely. Au contraire, you are.
>>
>> OK. =A0So provided we have an easy way to make pull requests of trees
>> hosted on oe.org (like oe-core/meta-oe today), are there any other
>> objections to moving towards pull request model for classic OE?
>>
>
> My whole point is that things should be easy for those who want to
> contribute.

Agreed.  And I think based on the volume going into
oe-core/meta-oe/etc today, folks have found the contrib tree model to
work.  And again, if it's not working, people need to be speaking up
:)

>> >> > I understand the concerns with people using master for new projects=
,
>> but
>> >> I
>> >> > also understand the concerns of people that for one reason or anoth=
er
>> are
>> >> > still bound to oe-classic.
>> >> >
>> >> > I feel that it also would be helpful to have some sort of staging a=
rea
>> >> > where people can update things before they are pulled. Doing that
>> >> > distributed not really creates visibility to those changes, so I'd
>> say it
>> >> > is better to keep that centralized. Might even be more convenient t=
oo.
>> >>
>> >> We already have this for oe-core/meta-oe so it shouldn't be hard to
>> >> make up a contrib repo for classic OE, for folks that don't want to
>> >> just fork the mirror on github.
>> >>
>> >
>> > Whether it is a branch or a separate repo does not make too much of a
>> > difference (at least not to me).
>> > It was my impression that a branch would work a little bit simpler, bu=
t I
>> > may well be mistaken here.
>>
>> My understanding of the git server side of things is a contrib repo is
>> easier to setup and manage permission-wise.
>>
> I can't comment on that as I have no knowledge on the server side. I'm
> looking at it from a user/contributor perspective.

Yes, lets leave this part up to the admins, I'm just inferring from
how it's setup today.

>> >> > That still leaves the issue of new projects.
>> >> > What if we decide to rename master to e.g. maintenance-staging, or
>> >> legacy,
>> >> > or classic or whatever you want to; keeping it as it is now (so not
>> R/O),
>> >> > and have a new master that is R/O and only contains a document with
>> some
>> >> > explanation and referring to oe-core for new projects. This doc cou=
ld
>> >> > mention the legacy branch together with a statement that it is not
>> >> desired
>> >> > for new projects, but mainly there for maintenance/testing purposes=
.
>> >>
>> >> The only part here I object to is saying we need an anyone-can-write
>> >> branch.
>> >>
>> >
>> > If it is a contrib repo or overlay fine with me.
>> > I do think it is probably convenient that it should be an
>> > anyone-who-is-authorized-can-write repo/overlay/branch/whatever, in or=
der
>> > not to unneededly raise the barrier to submit patches.
>>
>> So, like we do today for openembedded-core-contrib /
>> meta-openembedded-contrib?
>>
> Sorry but since all my projects are still based upon oe-classic, I never
> bothered to peek at those.
>
> Anyway these are my opinions. There were some others that had concerns. N=
ot
> sure how they feel about it.
> And it is good that we come to a plan and define a workflow and a migrati=
on
> path.

Yes, lets make sure everyone else has a chance to voice their opinion.
 And while the details are in various emails (and I should summarize
before we say this is it), at the high level:
- Be more like oe-core/meta-oe in that we have contrib repositories
(or self hosted or github or gitorious or ..) and pull requests for
changes going into 2011.03-maintenance (note that pull requests are
the rule today)
- Get everyone else who is doing projects based on OE classic 'master'
to either be fine with no more changes at some point OR migrate to
2011.03-maintenance and as always, I'm happy to review pull requests
of N commits worth of backports of changes from master, or wherever
else, to make that migration work for a given project.
- Get public documentation to reflect the reality of
oe-core+meta-oe+$stuff going forward, 2011.03-maintenance for OE
classic that's receiving some amount of updates and that master and
2011.03-maintenance are strongly cautioned against for new projects.
- Make sure meta-oe policy is documented in cases where it diverges
from oe-core, so everyone is clear.

> The original statement by someone saying "OE classic will be R/O soon", w=
as
> a little bit too quick and too incomplete for the community I think. At
> least it was for me.

Yes, I agree this was a needed conversation.  With my TSC hat on, I
think we were just waiting to see if anyone needed more than notice of
a date in the future.

--=20
Tom


