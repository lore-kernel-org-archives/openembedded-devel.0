Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RUKc8-00012s-7Q
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 16:56:28 +0100
Received: by vbbfc21 with SMTP id fc21so2335065vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 07:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=5g/Vd4PUkaMgdjvFMWnekbJj9Nj1W17kS5JyWeBoWuI=;
	b=oNv1NA/07hkLrNxqznncZGwKYlSGftG/JY+/9aDagmfn8O9H1fcd2ERznR4M1huGz9
	76gL2XxAI7jM38W9PrM2ukQ2H7lTr8c2Ft5tHi0ipCqwLeOGs+9MlOZmncdo0P7M/Qin
	6vIcrdjrj/vuFr5ZBLkhoSBTrawg9d+jpDJ94=
MIME-Version: 1.0
Received: by 10.52.65.176 with SMTP id y16mr37981178vds.53.1322322592402; Sat,
	26 Nov 2011 07:49:52 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Sat, 26 Nov 2011 07:49:52 -0800 (PST)
In-Reply-To: <CA+M6bXmsbDoFS_8etRA+RYqkP7b0x8t998Tcmn9KyKhAbEP2ew@mail.gmail.com>
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
Date: Sat, 26 Nov 2011 16:49:52 +0100
Message-ID: <CACW_hTZ6tkRGj938SAg4xmENwe-qRZMGpE=8-KvexQydgD-m_w@mail.gmail.com>
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
X-List-Received-Date: Sat, 26 Nov 2011 15:56:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/11/26 Tom Rini <tom.rini@gmail.com>

> On Sat, Nov 26, 2011 at 3:57 AM, Ulf Samuelsson
> <ulf_samuelsson@telia.com> wrote:
> > On 2011-11-25 23:04, Tom Rini wrote:
> >>
> >> On Fri, Nov 25, 2011 at 12:31 AM, Frans Meulenbroeks
> >> <fransmeulenbroeks@gmail.com>  wrote:
> >>
> >>> After all, isn't one of the purposes of OE to promote information
> >>> sharing,
> >>> cooperation and the use of openembedded technology (and not make things
> >>> harder).
> >>
> >> One of the points of making master read-only would be to ensure that
> >> changes aren't lost.
> >>
> >> Perhaps the transition needs to be:
> >> - master is as it is today
> >> - master becomes oe-core backport || master-only bugfixes only
> >> - master becomes read only.
> >>
> >> And we go from the first step to the second step sometime sooner
> >> rather than later.  The top of my head date would be before the
> >> paid-developers go on end of year breaks to try and make sure all the
> >> hobbyist folks start their hacking with oe-core+etc rather than master
> >> and risk getting caught later.  I'm open to arguments on why that's
> >> exactly backwards...
> >>
> >
> > Won't it be a problem for existing projects, if you cannot add fixes to
> cope
> > with new host OS versions.
> >
> > At the moment, openembedded-classic does not build properly with Ubuntu
> > 11.10 .
>
> Won't what be a problem?  Either oe-core+meta-oe+etc fails on 11.10
> (so, fix it there first then backport changes) or it's fine and you
> can either find the relevant changes there and move them or it's a
> oe.dev-only bug and just needs to be fixed, under my proposal (until
> we reach the point where everyone is OK calling it r/o).
>
> And part of this is to say that yes, existing projects external to
> oe.dev need to move to oe-core(+meta-oe+whatever else) (where layers
> should be making their life easier or again, there's problems we're
> unaware of and need to be made aware of) or explain why they can't
> ever move (and are forking the project?).
>

See the message on NIOS that I just posted.
Also I am not opposed to making oe classic master the place where patches
may land before they end up in the maintenance thread, but I am strongly
opposed to making OE classic read only on short notice (which as suggested
by Koen earlier).

Frans

