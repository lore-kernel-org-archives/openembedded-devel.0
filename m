Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1On659-00018j-Vb
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 10:39:13 +0200
Received: by iwn2 with SMTP id 2so1966005iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 01:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=V8a+FvXoblBvpoHDpqfh3bRvLqImfM6zXa+ZbaNtWNI=;
	b=d88RLejjtmIM/W7/F+SMXgphLg+VZQERELnpUVmuutAzLp5uQgWWcI5L2Kui51/CkS
	AZO7RRPmFYZHCdlPFaiV3GpOmupkUM3k4cvOXGCWlxzV+ptA4uPUDAUCXw7AXmXRoF1J
	lhBaae/K7p7gR9TE1yxeh3pGgDvdicikirnwg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Ho2Wlu2CAYCQ4wEEG60KtqNFVLYY+BwsdfPWDd/0dR9IzO0RRjei7TGfuUZ3akCjFg
	aAlReyOjav0p3dqbQVkg7LG3cHfJ39CymE7mGmPH1PE1nyqm4zsRVlFCyizZi6gPXjDI
	W5sko5NHPooMxbRCxExGCzxPRxhImg63GBO98=
MIME-Version: 1.0
Received: by 10.231.148.20 with SMTP id n20mr4394785ibv.196.1282466328142;
	Sun, 22 Aug 2010 01:38:48 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 22 Aug 2010 01:38:48 -0700 (PDT)
In-Reply-To: <AANLkTinS5vKrq8vunasV2KCgoD9rgDV5hS6vt69Uu26M@mail.gmail.com>
References: <AANLkTinS5vKrq8vunasV2KCgoD9rgDV5hS6vt69Uu26M@mail.gmail.com>
Date: Sun, 22 Aug 2010 10:38:48 +0200
Message-ID: <AANLkTimsCtDRzzCcWsQLikvrKujYo4G9Ls0JX3MS9Lp7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Getting Started with bitbake as a developer?
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
X-List-Received-Date: Sun, 22 Aug 2010 08:39:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/22 AJ ONeal <coolaj86@gmail.com>:
> http://www.google.com/search?q=openembedded+bitbake
> http://www.google.com/search?q=bitbake+getting+started
>
> Notice that the only useful information for a dev on there is the gumstix
> link, which is apparently not up to par with the oe standards.
> http://www.gumstix.net/Setup-and-Programming/view/Build-system-overview/Hello-world-tutorial/111.html
>
> May I suggest that someone put up a doc on the oe wiki for this? or if there
> is one, put keywords on it so it gets a ranking?
>
> I would be happy to write one, but I don't know enough yet.
>
> AJ ONeal

Can we reuse or refer to the gumstix tut?
Or could the gumstix tut be an appendix to the bitbake manual?
http://bitbake.berlios.de/manual/

I feel it is useful to have a getting started doc. The manual on
itself is too overwhelming.

Frans


