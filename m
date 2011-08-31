Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Qyk3l-000094-Bx
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 14:38:25 +0200
Received: by vwe42 with SMTP id 42so512230vwe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=oSvQZxebwhq0R84IjbMYbAt6iK960c5vGndkWZVqCsg=;
	b=MmDlDwXzfLyBbuHEHZK3x+sn9VBDnIEewRF89gSFmTwjXv/k+rlIEOFAAeh3tK1mkV
	REFnfDBC9sp3FIrkY3ChejqHvdAVQ72p54P2jBwgQziKbRCKO1SyPaYoKCin8oG9VaNd
	31YNei/zH6oyaw+vLTemwC90UKHYlsDHC3Hik=
MIME-Version: 1.0
Received: by 10.220.172.7 with SMTP id j7mr78587vcz.246.1314794010476; Wed, 31
	Aug 2011 05:33:30 -0700 (PDT)
Received: by 10.220.188.65 with HTTP; Wed, 31 Aug 2011 05:33:30 -0700 (PDT)
In-Reply-To: <201108311327.01907.paul.eggleton@linux.intel.com>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
	<201108311327.01907.paul.eggleton@linux.intel.com>
Date: Wed, 31 Aug 2011 14:33:30 +0200
Message-ID: <CACW_hTZ2KnH_zYD0bqELyFQm70GxguJ2cByOBJF5AC78cyfYtg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 12:38:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/8/31 Paul Eggleton <paul.eggleton@linux.intel.com>

> On Wednesday 31 August 2011 13:16:50 Koen Kooi wrote:
> > Op 31-08-11 13:55, Anders Darander schreef:
> > > To sad. It's a lot easier to remember to bump the PR, when PR actually
> is
> > > in the recipe. Thus, including PR=0 will often remove one issue with
> > > patches.
> >
> > That's what review is for, no?
>
> Surely you'd rather people have a better chance of getting it right the
> first
> time rather than you having to remind them for every patch? The almost
> insignificant burden of a PR = "r0" in each recipe seems worthwhile to me
> if it
> even helps a single person remember.
>

Nah, no good, as it reduces the opportunities for Koen to send nasty
remarks.

Frans.

