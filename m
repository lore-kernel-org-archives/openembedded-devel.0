Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PfU9h-0005OT-Qr
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 10:16:41 +0100
Received: by iwn8 with SMTP id 8so617771iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 01:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=8blvOjDeCo7TBxV9ur0ekTpoSepSlNrPq6O+XZ9iuD4=;
	b=O/ls6VhGLfxz46GoPd+NElDFYfUNf57ICvcbazJaN6+NJpzU9h8zRca2DCukLRjkVe
	xBmpU2M6sgIlMDgZQGoQPe8oQ6sVB+9Pn1nTm+uXWIkfihDsJZZaJGOyI3VFD606RAGI
	XFw7vllm6nTysPPNsATwJTjEZvvH2KJe3WCbE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=npVyu2EOgA5AhtZA1g4IExE5I915Aem8ma52Yd3XFRuFVYx81VC4vo3P5jG04TMHqN
	aIDkA5Gusi8/6lxYfpJ3PErSr9PaUoRahmn1n+JqhSVnuGCFOkGVyiMzUNeMeta/5VVn
	/eR70kElKNYb+RH5zTHn8r8uB0PphwAX2PZF0=
MIME-Version: 1.0
Received: by 10.231.200.138 with SMTP id ew10mr478079ibb.59.1295428563621;
	Wed, 19 Jan 2011 01:16:03 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Wed, 19 Jan 2011 01:16:03 -0800 (PST)
In-Reply-To: <4D36A7C6.1050308@xora.org.uk>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com> <ih52qr$l1v$1@dough.gmane.org>
	<AANLkTi=A2kgqgkhfw4p_Og8k9y1MBMrZLDvgwuq5Mxfj@mail.gmail.com>
	<4D36A7C6.1050308@xora.org.uk>
Date: Wed, 19 Jan 2011 10:16:03 +0100
Message-ID: <AANLkTimvMhOA2H1tL+N+0O0Tn+0duNBN9ShO27TVgXk-@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 09:16:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/19 Graeme Gregory <dp@xora.org.uk>:
> On 19/01/2011 08:45, Frans Meulenbroeks wrote:
>>
>>> * The maintainer can have as many versions as he wants to.
>> my preference: not in the main layer.
>>
>
> I suspect all that is going to happen with this attitude is the recipes
> in the main layer will end up not maintained as the recipe maintainer
> will just maintain them in his own layer. Leading to fracturing of OE
> which is what we are trying to prevent. Sometimes you are just going to
> have to accept that the recipe maintainer knows best and knows what he
> is doing.

Agree.
Unfortunately some of the root causes of the problems we are having in
the current tree are that for lots of recipes the maintainer is not
known or gone or does not do a very good job.
In case of a good recipe maintainer (like e.g. khem with gcc) this is
not a problem. Unfortunately not all our recipes are as
well-maintained as gcc.

Frans


