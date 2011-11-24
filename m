Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RTXoW-0007TL-Ci
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 12:50:00 +0100
Received: by faat2 with SMTP id t2so2833580faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 03:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=PEBP6y3/PzTvXjLQJpNMneX4hQG8dXFAQ2JM5v5nM+U=;
	b=BnB4Q+lcuOtEWetyZ+EMUhwPOLCeDp5usHNJINivN6T6LUB1+bqShyglfFJ78dmuox
	bFremD0S9MUYfAt6C7bwam6merqeodI0vbop5K5PxvDKBk7fbCibJ6PsSnAMfGu7adN2
	uzZm6H3yv504QycrPUdOH5ULGy1Z4aoKibeJA=
MIME-Version: 1.0
Received: by 10.204.15.200 with SMTP id l8mr13688937bka.132.1322135007443;
	Thu, 24 Nov 2011 03:43:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Thu, 24 Nov 2011 03:43:27 -0800 (PST)
In-Reply-To: <1322134409.3391.21.camel@mattotaupa>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
	<0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>
	<CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
	<1322134409.3391.21.camel@mattotaupa>
Date: Thu, 24 Nov 2011 09:43:27 -0200
X-Google-Sender-Auth: pMh90rvrcFABOePgZKhxGsTMALg
Message-ID: <CAP9ODKrKN3m_V09j6+C1dL9P8yHtuck4P5jcdKv4Ua=mrP1E=Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Thu, 24 Nov 2011 11:50:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 24, 2011 at 09:33, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> Am Donnerstag, den 24.11.2011, 09:12 -0200 schrieb Otavio Salvador:
> > On Thu, Nov 24, 2011 at 08:23, Hauser, Wolfgang (external) wrote:
> >
> > > I would vote for an open classic master for bugfixing too, our project
> > > based on 2011.03-maintenance goes into the final phase and to switch to
> > > oe-core, the budged is not available jet.
> >
> > I also believe oe-classic master ought to be read-only as soon as
> possible;
> > I understand that people are using it but the soonner we make it
> read-only,
> > sooner people will move to oe-core otherwise people will keep starting
> new
> > project on it and it will never die.
>
> You seem to use OE-core and meta-oe already so I understand your point
> of view. Martin, Koen, Andreas and you are doing the major work for
> meta-oe and not a lot of other people contribute.
>
> In my opinion it is a bad sign to force people to switch. OE-core and
> meta-oe should be so appealing that they switch by themselves. My
> impression from reading the list and from IRC is that a lot of people
> still have objections and are not totally comfortable. Good community
> management would be to listen to these people then try to find solutions
> and implement them. People then should come by themselves.
>

In fact I use both. The projects running at oe-classic are working well and
will be kept running that way but all new ones are based on oe-core +
meta-oe.

I am not against oe-classic maintainence branch and people contributting
new fixes but I am against the work on new features and recipes being put
on master branch.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

