Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>)
	id 1Q08qz-0001ll-KD; Thu, 17 Mar 2011 09:46:45 +0100
Received: by iyb26 with SMTP id 26so2635598iyb.6
	for <multiple recipients>; Thu, 17 Mar 2011 01:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=WNkkyMeIbtOxYqU7cbF5Vm5fCA+DbYTwzB60EdvR0Yk=;
	b=F+A/BxBoorG/qauf37ysGL38XNN82YjtDydKxHrl2SsIUVAvwC6hkgrT/pFTlvyCvU
	I6T5n5AipG7qlXH3sZLj+VH4gDviKYlVsl/obAI4IQ1B2xKRKVwaMevsjQLCtq6RF58H
	BL8z5UOUjaOMEOWBYZJV/VTUA7V2ANjpfs2Fo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=vUQ+6OWnYf0qP8n++QIaqDSIFOG6nsVBuAi5yM8e4puGFq+i3UFOvTflhS7Q5ex3ap
	H2x6d8gQHOKrGgnZy8ihZzTIaDxHKvnOGcfrIddULJb5ukcxyw4NW0Bh8pOBEz9Z182f
	ZTnUIj8TUh2Mulm2/hHBQmysWiwbLyGo/uDaw=
MIME-Version: 1.0
Received: by 10.42.153.3 with SMTP id k3mr1465943icw.457.1300351127580; Thu,
	17 Mar 2011 01:38:47 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Thu, 17 Mar 2011 01:38:47 -0700 (PDT)
In-Reply-To: <4D817FB9.5050404@windriver.com>
References: <4D817FB9.5050404@windriver.com>
Date: Thu, 17 Mar 2011 09:38:47 +0100
Message-ID: <AANLkTim51F7=Jt5COph35-KpHEX0oBJwhBUh4KLhgT_W@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: tsc@lists.openembedded.org
Subject: Re: Minutes, OE TSC meeting, March 10 2011
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
X-List-Received-Date: Thu, 17 Mar 2011 08:46:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Mark, thanks for the minutes.

There is one remark I'd like to make and one agenda item i'd like to
coin for the TSC (I'll do that here since I haven't seen an agenda and
call for topics for the next TSC meeting)

2011/3/17 Mark Hatle <mark.hatle@windriver.com>:

>
> Further discussion of deprecation of OE bugzilla. =A0Yocto intends to kee=
p a bug
> tracking system for itself. =A0This might also be the place where OE-Core=
 bugs can
> be tracked.
>

What about the remaining parts of OE?
Do we also stop to use bugzilla for those?
Or will that also be done in the yocto bug tracking system?

I would like to suggest that the TSC starts to discuss how to deal
with the non-oe-core recipes that we have.
We have meta-oe of course. It might be useful to discuss and decide on:
- do we want to use meta-oe (and if so, how should it be
sub-structured, e.g. similar to oe-core meta* dirs)
- assuming it'll be meta-oe, how will we deal with it in terms of
adding recipes, dealing with patches, retention policy, ownership etc
etc
- how/where to store deprecated oe-core recipes that are still
useful/needed (and how to retire them if they are not needed any
more).
...

Or in a more general sense:
How are we going to deal with the parts of OE that are not part of OE-core.

Best regards, Frans.


