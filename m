Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RTKJ1-0001ij-9l
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 22:24:36 +0100
Received: by vbbfc21 with SMTP id fc21so596901vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 13:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Vnbi4IFwNGDXEPSvzFkBojdcCqFZPIg4GQXx4H37SeY=;
	b=R6E1UXOEEvFU62SMws1VV179PN0UVKBtyB3cSt6hzaOuvb/skv19pRGc+o/ea5W7x7
	2fbSJZzl8sLBRBG2tj/y+2ttYjqgQfyBJMiFjaJZCuISbOIAYDbStQLmiTSnND/fqd24
	fcZU/ncisKiL6/6sh3VissKFa+ZBJfM+CIw1g=
MIME-Version: 1.0
Received: by 10.52.97.35 with SMTP id dx3mr27350630vdb.2.1322083081807; Wed,
	23 Nov 2011 13:18:01 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Wed, 23 Nov 2011 13:18:01 -0800 (PST)
In-Reply-To: <CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
Date: Wed, 23 Nov 2011 22:18:01 +0100
Message-ID: <CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 Nov 2011 21:24:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/11/23 Khem Raj <raj.khem@gmail.com>

> On Thu, Oct 27, 2011 at 3:53 AM, Mats K=E4rrman <Mats.Karrman@tritech.se>
> wrote:
> > Hi,
> >
> > Are there any plans for new releases and/or maintenance branches of OE
> classic?
> >
>
> 2011.03-maintenance is the last release of OE classic. As long as the
> branch is maintained
>
> _
>
> Related: I noticed TSC plans to discuss on whether or not to make oe
classic read only.

I'd like to suggest leaving it open for those of us that are still using
it.
For instance I have still products that are based on OE classic. If there
is a problem that is of a generic nature, I'm more than happy to submit
patches so others in the same situation can benefit from it.
(actually I have one pending with a new version of netsnmp; the current
recipe does not build with uclibc, whereas the latest version of netsnmp
does; found/fixed this today, but haven't had time to make a commit)

And if there is no interest any more it'll eventually die. But as of now I
do see people working on/with it (see the commit log).

Frans.

