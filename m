Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RTXWn-0006f6-Um
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 12:31:42 +0100
Received: by vcbfo11 with SMTP id fo11so2332234vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 03:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=q9U1vKPd0l6pFKEXN6FlQ+eD5+Y+DPLcWTKBhkm2pc8=;
	b=PFcGIK7PAsWfsQUYgZ33Xc8o4B7Eh2rGUeCXyv1WSsqnYtXJjoPlMMUt/vLfzs9cBw
	D2uJPAO8fEBMe+azawixFBhAqWIri8w3GewQm4BiQGCAXYusKsrxwKzLVqo/UY8kxOls
	Tij9ChzP0s+QxuxPUwoEYrQy9sdM7WUsUqOY4=
MIME-Version: 1.0
Received: by 10.220.107.143 with SMTP id b15mr2250003vcp.18.1322133899152;
	Thu, 24 Nov 2011 03:24:59 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Thu, 24 Nov 2011 03:24:59 -0800 (PST)
In-Reply-To: <CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
	<0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>
	<CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
Date: Thu, 24 Nov 2011 12:24:59 +0100
Message-ID: <CACW_hTbB1zVU7T_-7+YOZc=xDgVUL38C5qMf-K0BJc9cSaH4ig@mail.gmail.com>
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
X-List-Received-Date: Thu, 24 Nov 2011 11:31:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/11/24 Otavio Salvador <otavio@ossystems.com.br>

> On Thu, Nov 24, 2011 at 08:23, Hauser, Wolfgang (external) <
> Wolfgang.Hauser.external@cassidian.com> wrote:
>
> > I would vote for an open classic master for bugfixing too, our project
> > based on 2011.03-maintenance goes into the final phase and to switch to
> > oe-core, the budged is not available jet.
> >
>
> I also believe oe-classic master ought to be read-only as soon as possible;
> I understand that people are using it but the soonner we make it read-only,
> sooner people will move to oe-core otherwise people will keep starting new
> project on it and it will never die.
>
> People like Wolfgang, Mats and me are working on products that are at the
moment not in a position to move to oe-core.
Why would you want to deprive people in that situation from having a spot
(under the openembedded umbrella) under which they can share things.
Isn't sharing and cooperating what openembedded is all about ???

I understand you want people to move to oe-core, but really this should be
at the discretion of the users, and we should not give those who can not do
so right now a hard time.

Over time people will move to oe-core, as it will definitely be better
supported, have newer recipes etc. Actually for my next product I will
probably move over, but for now, with a release being imminent, moving is
not an option for me, and I consider having a place to share and exchange
bug fixes as useful.

My two cents.
Frans.

