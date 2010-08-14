Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkM2L-0007hA-Ik
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 21:04:59 +0200
Received: by gwb15 with SMTP id 15so1533514gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 12:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=HXFY8KiotnvA4QjR1aVWWl3OMwkkNR0wi4/WFiTLrck=;
	b=OfEppNRt1rOrl4TVey/HQ1k7MxmxAAaZGpQ4gxG8CQvndfINkxnf4X6SB9OPkcM6MI
	5hnbJ3Z8tKwB3m1knEPsVa/Ou7RWL7xV5TCGAePi58Ms7YMxkzb8Wttq5W74A0E48bIv
	RqK2Wlw8tvMqfF1ij4UwYl35jRWh6xGLt0mIU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=PqgzQJ9nonT7izFdpDkqxit1BMh+zme2hH0XTJF48IyqqcEJYqOva8oT9ECsFZuMz3
	NsIz2fRs4DSLDeFTP/ktCBNALp/2Yfz87nIao6F/cZylAOTIhuWAUnDg1K+YLLEhfTom
	FTRELGab+YVgbZAXiyGGQqeh1VRel/qRMZ7lg=
MIME-Version: 1.0
Received: by 10.231.39.201 with SMTP id h9mr3154079ibe.118.1281812652039; Sat,
	14 Aug 2010 12:04:12 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Sat, 14 Aug 2010 12:04:11 -0700 (PDT)
In-Reply-To: <AANLkTim_u5O3bLgdLiwE4fPCnbjRoUY1+Pad9iB8qXPW@mail.gmail.com>
References: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
	<AANLkTim_u5O3bLgdLiwE4fPCnbjRoUY1+Pad9iB8qXPW@mail.gmail.com>
Date: Sat, 14 Aug 2010 21:04:11 +0200
Message-ID: <AANLkTime6OXahfsppUL5gVvbSVmovWcYSv2OSTceYSBq@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
Subject: Re: What to do about the poor bitbake Quality Control?
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
X-List-Received-Date: Sat, 14 Aug 2010 19:04:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/14 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:

>
> If you are using dev head, you're living on the edge. If you can't
> stand that better use the stable branch.
>
> As far as there are issues:
> Either report them, or better fix them.
> (or as a workaround you could find the commit wthat broke it and
> report that and perhaps temporariy locally revert that commit if you
> cannot fix it).
>
> Having said that:
> I don't really see many issues. Maybe I'm building a different set of
> packages or for a different set of hw or for a different distro.
>
> Frans
>
Addition: I noticed when pressing send that you also mailed to
gumstix-users, so apparently you do have a gumstix.
I haven't so I have never build for it and cannot really help you with
it as I am not planning on buying one (so even though I could build I
cannot test).

What you also can do is enable logging to tinderbox then at least the
info of the faulty builds becomes available for others.

Frans


