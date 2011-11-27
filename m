Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RUUiw-00031L-Hp
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 03:44:10 +0100
Received: by qadc10 with SMTP id c10so3449664qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 18:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Gh5No7NMSXXT8mNjJOK+tsuhFanmojWtnwgtcY/A4ic=;
	b=xtTL1AfPQu5UYW5KRnlvImQw/RyBhOPse9Wm9Kd3XEeY4dMJgIEBAN83wmPuYNO8NJ
	pGp5COIl+fLv4WMaXYvfFSbwNk5aRWTGlrbbBz8ivlHMP8f+Wv3HLgm6esQhBU3s+8gc
	73UjGGV1lIX9m08GFks1XrwRfr1bozK7tG8Gc=
MIME-Version: 1.0
Received: by 10.224.180.131 with SMTP id bu3mr12053956qab.5.1322361453785;
	Sat, 26 Nov 2011 18:37:33 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sat, 26 Nov 2011 18:37:33 -0800 (PST)
In-Reply-To: <1322347742.16303.66.camel@mattotaupa>
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
Date: Sat, 26 Nov 2011 19:37:33 -0700
Message-ID: <CA+M6bX=FNKdJ-BrctoqhnzRzV=Hg41BXSx5pCODx3xrMyVnwfg@mail.gmail.com>
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
X-List-Received-Date: Sun, 27 Nov 2011 02:44:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 26, 2011 at 3:49 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Samstag, den 26.11.2011, 15:33 -0700 schrieb Tom Rini:
>> On Sat, Nov 26, 2011 at 3:01 PM, Paul Menzel wrote:
>> > Am Samstag, den 26.11.2011, 14:36 -0700 schrieb Tom Rini:
>> >> On Sat, Nov 26, 2011 at 8:49 AM, Frans Meulenbroeks wrote:
>> >> > 2011/11/26 Tom Rini
>> >> >
>> >> >> On Sat, Nov 26, 2011 at 3:57 AM, Ulf Samuelsson wrote:
>> >> >> > On 2011-11-25 23:04, Tom Rini wrote:
>> >> >> >>
>> >> >> >> On Fri, Nov 25, 2011 at 12:31 AM, Frans Meulenbroeks wrote:
>> >> >> >>
>> >> >> >>> After all, isn't one of the purposes of OE to promote informat=
ion
>> >> >> >>> sharing,
>> >> >> >>> cooperation and the use of openembedded technology (and not ma=
ke things
>> >> >> >>> harder).
>> >> >> >>
>> >> >> >> One of the points of making master read-only would be to ensure=
 that
>> >> >> >> changes aren't lost.
>> >> >> >>
>> >> >> >> Perhaps the transition needs to be:
>> >> >> >> - master is as it is today
>> >> >> >> - master becomes oe-core backport || master-only bugfixes only
>> >> >> >> - master becomes read only.
>> >> >> >>
>> >> >> >> And we go from the first step to the second step sometime soone=
r
>> >> >> >> rather than later. =A0The top of my head date would be before t=
he
>> >> >> >> paid-developers go on end of year breaks to try and make sure a=
ll the
>> >> >> >> hobbyist folks start their hacking with oe-core+etc rather than=
 master
>> >> >> >> and risk getting caught later. =A0I'm open to arguments on why =
that's
>> >> >> >> exactly backwards...
>> >> >> >>
>> >> >> >
>> >> >> > Won't it be a problem for existing projects, if you cannot add f=
ixes to
>> >> >> cope
>> >> >> > with new host OS versions.
>> >> >> >
>> >> >> > At the moment, openembedded-classic does not build properly with=
 Ubuntu
>> >> >> > 11.10 .
>> >> >>
>> >> >> Won't what be a problem? =A0Either oe-core+meta-oe+etc fails on 11=
.10
>> >> >> (so, fix it there first then backport changes) or it's fine and yo=
u
>> >> >> can either find the relevant changes there and move them or it's a
>> >> >> oe.dev-only bug and just needs to be fixed, under my proposal (unt=
il
>> >> >> we reach the point where everyone is OK calling it r/o).
>> >> >>
>> >> >> And part of this is to say that yes, existing projects external to
>> >> >> oe.dev need to move to oe-core(+meta-oe+whatever else) (where laye=
rs
>> >> >> should be making their life easier or again, there's problems we'r=
e
>> >> >> unaware of and need to be made aware of) or explain why they can't
>> >> >> ever move (and are forking the project?).
>> >> >
>> >> > See the message on NIOS that I just posted.
>> >>
>> >> Addressed there :)
>> >>
>> >> > Also I am not opposed to making oe classic master the place where p=
atches
>> >> > may land before they end up in the maintenance thread, but I am str=
ongly
>> >> > opposed to making OE classic read only on short notice (which as su=
ggested
>> >> > by Koen earlier).
>> >>
>> >> I believe master needs to go read-only, or at least
>> >> backport||master-only-problems bugfix only, sooner rather than later.
>> >>
>> >> The arguments seem to be:
>> >> - Some people or projects use master and can't move
>> >> * So don't move, but do expect to need to either migrate to
>> >> 2011.03-maintenance or carry more fixes locally.
>> >
>> > This is still not understandable. I understand that you want developer=
s
>> > to move to OE-core and meta-oe. But trying to force people by making
>> > master read-only is the wrong way. It just arbitrarily puts a burden o=
n
>> > current users. You can advertise prominently that OE-core and meta-oe
>> > should be used. Over the time people will move and a lot of people hav=
e
>> > expressed their willingness to move in the future.
>>
>> Well, on this side of the fence I think we're unclear what more needs
>> to be said.
>
> Like Frans and Bernhard wrote, for new users a README on OE-classic
> would be nice and the Wiki needs to be updated. Maybe also a deprecation
> notice when pulling from the master branch.

All sounds fine to me.

> For old users as also written no further comments are needed. They are
> experienced enough and have heard your arguments. Now you should let
> them make their own decisions even if you do not like it.

So the question is, what is the long term plan for classic OE based
stuff?  The TSC has been saying, perhaps not with enough voice or
emphasis:
- 2011.03 is the last "release" of oe.dev (unless someone(s) step up
and wish to do another!)
- 2011.03-maintenance will be maintained as long as people are saying
they have a need for it.
- The master branch needs to go away somehow as the last step of
migration.  This is what I was trying to say below...

>> In my mind, we couldn't do a technical branching of the repository, we
>> made a new one. But people are still working off of a branch made
>> against an 8 month old snapshot. =A0We really want to encourage this to
>> stop. =A0If we were all in one repository still, it would be people
>> saying "don't make legacy/main read-only! =A0I still want to add things
>> to it!".
>
> I did not understand that paragraph. Sorry.

The analogy I'm trying to make between classic OE master branch and
behavior is that it wasn't "lets start from scratch with this new
repository and hope someday most people stop using the old tree" it
was "if we could cleanly do a 'git branch -m master legacy' and start
master as the new meta-oe repository, we would".

Now I'm going to make a Linux Kernel analogy.  The 2.4 series didn't
(nearly) go away for a long while after 2.6 came out, but after a
while the rules for what could go in got rather restrictive.

The direction the TSC has recommended for how to deal with classic OE
is to have the folks that can't yet move off of it be using the
maintenance branch.  It's not going to be pulled out from under
anyone.  It's just got rules about what kind of changes are allowed
in.  Today that's "must exist in relevant oe-core based layer or be
N/A in that world".  I can't imagine that changing until the user base
is small enough and themselves in a maintenance mode to be happy with
that too.

If anything it seems like there's an objection to switching classic OE
from "free for all" to the pull request (or patches posted) model
oe-core/meta-oe/etc are using.

[snip]
>> > As Bernhard noted in this reply. OE-Core and meta-oe seriously lack
>> > documentation. And if it is just that our Wiki currently is still base=
d
>> > on OE-classic. And in my experience not a lot of people put effort
>> > behind it and just neglect it.
>> >
>> > (New users will search for tutorials and help on the WWW and there
>> > currently a lot is dealing with OE-classic.)
>>
>> Yes, and this is why I can understand wikihate. =A0So, consider this a
>> beg for help, from anyone that likes wiki editing. =A0There's content to
>> be updated, people that will answer questions when it's not clear, but
>> just can't get into the groove on editing the wiki.
>
> A lot of developers do not like to document things or to use a Web-Wiki.
> I can understand the Wiki part because in my opinion a Web editor is
> just unusable.
>
> In my opinion the the community should seriously think about if a
> MediaWiki setup has proven successful and if they think not first think
> about if a Wiki is needed at all, secondly what should be documented and
> lastly what tools developers might use.
>
> There are a lot of Wiki setups maintained in a repository like ikiwiki
> [1]. Adding a requirement to the guidelines that documentation also has
> be updated would be a feasible solution in my opinion developers could
> also live with since it is all managed in one repository.
>
> There has been a thread about this in the past I think. So please open a
> new thread if you put that up on the agenda.

I think this needs to happen, yes.  Thanks.

--=20
Tom


