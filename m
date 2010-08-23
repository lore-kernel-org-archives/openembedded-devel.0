Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OnLb4-0007Up-RW
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 03:13:11 +0200
Received: by fxm6 with SMTP id 6so2807792fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 18:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=gyOo5uOs8ZBwbFs9lfRMb/LbiSjQvW6lgrSc2txdWQQ=;
	b=OHzOpOxtw/3busdmDTevc2DwzR8clNW0fAkm2ei+0n2zX6X47iVD36mvdg3dnsZVzD
	P8Ib49NQLaWBevjVGXTZouQW6VpIYqnkUtnEisEQW9DVGREpDHZlamJ/qv3NZnXLGaV9
	A6DhkjZDm9UktxuNQBvemfpv6vPhtgi5rj648=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=q1LDcDjS7hMhBK667Ko2FGSC1awMWx50WBycaeGdXuLoC/yBM5r3yP0ZUQ+e/bjEyD
	BM4NSBAsFv/BoCllOm5+1V4RWnpRiwYwiLzhvXvU1nI8bLbJ+5Vph8+GQUGl+M6S2QH1
	2Exrx47meaodGAhhmGBMZgVvZcb7FWvfX1kQU=
Received: by 10.223.124.205 with SMTP id v13mr3444945far.94.1282525962117;
	Sun, 22 Aug 2010 18:12:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Sun, 22 Aug 2010 18:12:22 -0700 (PDT)
In-Reply-To: <AANLkTikbA5tcuyzJuO2YcFQLcCi_yUB_eRusqOpCSkJa@mail.gmail.com>
References: <AANLkTinS5vKrq8vunasV2KCgoD9rgDV5hS6vt69Uu26M@mail.gmail.com>
	<AANLkTimsCtDRzzCcWsQLikvrKujYo4G9Ls0JX3MS9Lp7@mail.gmail.com>
	<AANLkTikbA5tcuyzJuO2YcFQLcCi_yUB_eRusqOpCSkJa@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Sun, 22 Aug 2010 19:12:22 -0600
Message-ID: <AANLkTik_HFA8fYdsh__cXvBRy=x6EbYn_doOjmcp1c8p@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Mon, 23 Aug 2010 01:13:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

How about a series of workflow-oriented tutorials.

* Hello Make with bitbake
* Hello Autotools with bitbake
* Hello WAF with bitbake
* Hello scons with bitbake

Something like that where you package a file that includes a shared
executable binary, a static binary, a shared and static library, header
files, and manpage documentation.

Just something that walks through packing a full package.

AJ ONeal

On Sun, Aug 22, 2010 at 11:43 AM, J. L. <vwyodapink@gmail.com> wrote:

> I think AJ meant there needs to be another more in depth one. I would
> agree with that myself. That one barely touches anything about OE to
> me its to simple of an example.
>
>
>
> On Sun, Aug 22, 2010 at 1:38 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > 2010/8/22 AJ ONeal <coolaj86@gmail.com>:
> >> http://www.google.com/search?q=openembedded+bitbake
> >> http://www.google.com/search?q=bitbake+getting+started
> >>
> >> Notice that the only useful information for a dev on there is the
> gumstix
> >> link, which is apparently not up to par with the oe standards.
> >>
> http://www.gumstix.net/Setup-and-Programming/view/Build-system-overview/Hello-world-tutorial/111.html
> >>
> >> May I suggest that someone put up a doc on the oe wiki for this? or if
> there
> >> is one, put keywords on it so it gets a ranking?
> >>
> >> I would be happy to write one, but I don't know enough yet.
> >>
> >> AJ ONeal
> >
> > Can we reuse or refer to the gumstix tut?
> > Or could the gumstix tut be an appendix to the bitbake manual?
> > http://bitbake.berlios.de/manual/
> >
> > I feel it is useful to have a getting started doc. The manual on
> > itself is too overwhelming.
> >
> > Frans
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

