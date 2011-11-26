Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RUQuR-0005tB-Sv
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 23:39:48 +0100
Received: by qadc10 with SMTP id c10so3416781qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 14:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ncD7SIWLUgQKLe5GAmM1hfiLwk5/iBxBytaRKoFTs5Y=;
	b=l+ahlIUE+olFpNfxfDiPnBreBpTOsvKlyYs90YSqViL0OlJm/u1hPbQgc1WXCtTMyD
	FVFIyAdBRXUKlAWgGc2E9K3nkcccioEujYGiJIhaG0GSSQENGq2s43h3+i6j1yWuNwlS
	d9HAz4+x/r19XFMaSodnE0ocWLIo2JUMGdZUc=
MIME-Version: 1.0
Received: by 10.224.198.10 with SMTP id em10mr17146162qab.44.1322346791048;
	Sat, 26 Nov 2011 14:33:11 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sat, 26 Nov 2011 14:33:10 -0800 (PST)
In-Reply-To: <1322344896.16303.49.camel@mattotaupa>
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
Date: Sat, 26 Nov 2011 15:33:10 -0700
Message-ID: <CA+M6bXkfDtMOE6RUDbGCc59CFaGijCcc=Abj7sqh2veEVYvM-A@mail.gmail.com>
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
X-List-Received-Date: Sat, 26 Nov 2011 22:39:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 26, 2011 at 3:01 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Samstag, den 26.11.2011, 14:36 -0700 schrieb Tom Rini:
>> On Sat, Nov 26, 2011 at 8:49 AM, Frans Meulenbroeks wrote:
>> > 2011/11/26 Tom Rini
>> >
>> >> On Sat, Nov 26, 2011 at 3:57 AM, Ulf Samuelsson wrote:
>> >> > On 2011-11-25 23:04, Tom Rini wrote:
>> >> >>
>> >> >> On Fri, Nov 25, 2011 at 12:31 AM, Frans Meulenbroeks wrote:
>> >> >>
>> >> >>> After all, isn't one of the purposes of OE to promote information
>> >> >>> sharing,
>> >> >>> cooperation and the use of openembedded technology (and not make =
things
>> >> >>> harder).
>> >> >>
>> >> >> One of the points of making master read-only would be to ensure th=
at
>> >> >> changes aren't lost.
>> >> >>
>> >> >> Perhaps the transition needs to be:
>> >> >> - master is as it is today
>> >> >> - master becomes oe-core backport || master-only bugfixes only
>> >> >> - master becomes read only.
>> >> >>
>> >> >> And we go from the first step to the second step sometime sooner
>> >> >> rather than later. =A0The top of my head date would be before the
>> >> >> paid-developers go on end of year breaks to try and make sure all =
the
>> >> >> hobbyist folks start their hacking with oe-core+etc rather than ma=
ster
>> >> >> and risk getting caught later. =A0I'm open to arguments on why tha=
t's
>> >> >> exactly backwards...
>> >> >>
>> >> >
>> >> > Won't it be a problem for existing projects, if you cannot add fixe=
s to
>> >> cope
>> >> > with new host OS versions.
>> >> >
>> >> > At the moment, openembedded-classic does not build properly with Ub=
untu
>> >> > 11.10 .
>> >>
>> >> Won't what be a problem? =A0Either oe-core+meta-oe+etc fails on 11.10
>> >> (so, fix it there first then backport changes) or it's fine and you
>> >> can either find the relevant changes there and move them or it's a
>> >> oe.dev-only bug and just needs to be fixed, under my proposal (until
>> >> we reach the point where everyone is OK calling it r/o).
>> >>
>> >> And part of this is to say that yes, existing projects external to
>> >> oe.dev need to move to oe-core(+meta-oe+whatever else) (where layers
>> >> should be making their life easier or again, there's problems we're
>> >> unaware of and need to be made aware of) or explain why they can't
>> >> ever move (and are forking the project?).
>> >
>> > See the message on NIOS that I just posted.
>>
>> Addressed there :)
>>
>> > Also I am not opposed to making oe classic master the place where patc=
hes
>> > may land before they end up in the maintenance thread, but I am strong=
ly
>> > opposed to making OE classic read only on short notice (which as sugge=
sted
>> > by Koen earlier).
>>
>> I believe master needs to go read-only, or at least
>> backport||master-only-problems bugfix only, sooner rather than later.
>>
>> The arguments seem to be:
>> - Some people or projects use master and can't move
>> * So don't move, but do expect to need to either migrate to
>> 2011.03-maintenance or carry more fixes locally.
>
> This is still not understandable. I understand that you want developers
> to move to OE-core and meta-oe. But trying to force people by making
> master read-only is the wrong way. It just arbitrarily puts a burden on
> current users. You can advertise prominently that OE-core and meta-oe
> should be used. Over the time people will move and a lot of people have
> expressed their willingness to move in the future.

Well, on this side of the fence I think we're unclear what more needs
to be said.  In my mind, we couldn't do a technical branching of the
repository, we made a new one.  But people are still working off of a
branch made against an 8 month old snapshot.  We really want to
encourage this to stop.  If we were all in one repository still, it
woud be people saying "don't make legacy/main read-only!  I still want
to add things to it!".

>> With my
>> 2011.03-maintenance hat on, if someone says for my project to move I
>> need N patches moved from master to maintenance, I'm fine reviewing
>> that pull request.
>
> I thought that was always possible in the past.

It always has been, but since there's been confusion apparently about
what can and cannot happen with the branch today, I want to spell it
out.  I would be very happy to review whatever changes need to come in
from master that would make $project be able to say "OK, I can use the
maintenance branch until we have the time to move to oe-core/etc".

>> - There's concern that $something won't be able to work with oe-core+met=
a-oe+etc
>> * These are problems that either need to be fixed or assumptions that
>> aren't correct.
>>
>> - Lack of recipes in meta-oe
>> * The recipes people need have been moved, stuff that isn't can be
>> when someone needs it. =A0id3lib was mentioned as an example of why
>> there might be problems getting things moved to meta-oe. =A0I can't help
>> but notice it's also been moved into meta-oe.
>
> As Bernhard noted in this reply. OE-Core and meta-oe seriously lack
> documentation. And if it is just that our Wiki currently is still based
> on OE-classic. And in my experience not a lot of people put effort
> behind it and just neglect it.
>
> (New users will search for tutorials and help on the WWW and there
> currently a lot is dealing with OE-classic.)

Yes, and this is why I can understand wikihate.  So, consider this a
beg for help, from anyone that likes wiki editing.  There's content to
be updated, people that will answer questions when it's not clear, but
just can't get into the groove on editing the wiki.

--=20
Tom


