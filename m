Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lloydchang@gmail.com>) id 1STJYc-0005wG-8Y
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 May 2012 23:08:54 +0200
Received: by wgbdr1 with SMTP id dr1so3195877wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2012 13:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Uk27KrOcwww5iWZsYqVZ6MTJO5qWy9kjYDHdggt6y3s=;
	b=RvxcrRWB6fp9IMTwr/Ptku0xrWcORNN9nLaXtQxt2Pc/B8ze9CDawqOOXDDL66DauR
	ctevL1nMAPK+46AD31X49/SmP1uKKo1xBWYtrn2IvIpYFrVeCERJ5ocAYYwdF9B97qeV
	J4X+YPbgvcbE80t0+5BY4sLxupceL0e7nGVi9TBsAr/It3O0JfdcsEdcZLONvOHHt8Cg
	2L831TT0LQMQIOlJE4V+YwC3pv5M82vPjezDIfEh3fzG2xSUg+Svs8wLQtpGAYIY7usC
	KTlbumpZnSW3V+OSk5WAy6l4kXskNfb0zL9kaUZe4y37gv2LPyKsHbjiQUBetC2/ky3i
	kwKg==
MIME-Version: 1.0
Received: by 10.180.105.194 with SMTP id go2mr6674247wib.22.1336856337329;
	Sat, 12 May 2012 13:58:57 -0700 (PDT)
Received: by 10.180.106.133 with HTTP; Sat, 12 May 2012 13:58:57 -0700 (PDT)
In-Reply-To: <CAMKF1soiguyAXwmYo9LhHPnmQkbW7KTipDTEYXpazOFKn+dYLA@mail.gmail.com>
References: <CAKbR+sx-4vD69rHekVvwbDeVT5=0-Ouk0AmS6G_3JzZg_Hqa-A@mail.gmail.com>
	<CAMKF1soiguyAXwmYo9LhHPnmQkbW7KTipDTEYXpazOFKn+dYLA@mail.gmail.com>
Date: Sat, 12 May 2012 13:58:57 -0700
Message-ID: <CAKbR+sz=HCDU8uPx00rF1G4KXo87CXuk29uVO3rNxR_i5A4qkQ@mail.gmail.com>
From: Lloyd Chang <lloydchang@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: oe-made-easy and Getting Started
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
X-List-Received-Date: Sat, 12 May 2012 21:08:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks! Done adding 'One-liner via oe-made-easy' to our OE wiki.

On Wed, May 9, 2012 at 10:03 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 9, 2012 at 2:02 PM, Lloyd Chang <lloydchang@gmail.com> wrote:
> > Hello fellow openembedded-devel members!
> >
> >
> > I'm sharing because you may find this useful -- especially newcomers
> > to our OE-Core.  In my personal efforts in condensing our Getting
> > Started documentation succinctly, I codified it into one line:
> >
> >
> >    git clone git://github.com/lloydchang/oe-made-easy.git;
> > ./oe-made-easy/core-image-minimal
> >
> >
> > User interface design wise, my intent of this one liner is to allow
> > everyone getting started to easily bootstrap core-image-minimal onto
> > various computers (before diving into details).  If our community
> > consensus finds oe-made-easy useful, please let me know and I'll start
> > updating our openembedded.org wiki pages to reference this one liner
> > or equivalent.
> >
> >
> > And if you personally find oe-made-easy useful, feel free to test it
> > further, fork it and/or send me pull requests via
> > https://github.com/lloydchang/oe-made-easy
> >
> > (for now, oe-made-easy is defaulting to qemux86_64, qemux86 and qemuarm
> targets)
> >
> >
> > Your feedback is greatly appreciated!
>
> you can add this to OE wiki in some form.
>
> >
> >
> > Thanks :-)
> >
> > Lloyd
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

