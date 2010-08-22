Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OnEai-0000cS-I9
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 19:44:21 +0200
Received: by wwe15 with SMTP id 15so3016414wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=P4995UhOHjm7ngeDekzcbCPRIxYl0TgBXj7mFJdDEPQ=;
	b=EU1Ld9hOgLABlsu64nmKRnp4/XkIFD6IZik8zFFyJK9rKAOXu3yiJ5ng3jktWyYIh9
	hveJ9TkmexIpuJmd1pSX9kXpx5uGNn8+SEJUNtWWxX4ZiVqOrxEivKuGimwBIgcGj1gS
	jXHg1QWPDETFp7PVfLXFO8kMO8WEvuc89LNdw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fjpa5ZdxuFE7XW9AY4dwyFbAjSGD5VrePK5PKdF54y8faBHGGN98RI5O8wuHBPu7lX
	c4C213AHhtgmjnMM+MLL1B8vQkAsRXj+ueuBPITuagZAcAfZT9RgWbkjBpvscjkzYNPI
	aRmHoOc5X4SomnOphUmpsVAXkrqZ6pl+lewAs=
MIME-Version: 1.0
Received: by 10.216.236.149 with SMTP id w21mr3538824weq.65.1282499036289;
	Sun, 22 Aug 2010 10:43:56 -0700 (PDT)
Received: by 10.216.135.18 with HTTP; Sun, 22 Aug 2010 10:43:56 -0700 (PDT)
In-Reply-To: <AANLkTimsCtDRzzCcWsQLikvrKujYo4G9Ls0JX3MS9Lp7@mail.gmail.com>
References: <AANLkTinS5vKrq8vunasV2KCgoD9rgDV5hS6vt69Uu26M@mail.gmail.com>
	<AANLkTimsCtDRzzCcWsQLikvrKujYo4G9Ls0JX3MS9Lp7@mail.gmail.com>
Date: Sun, 22 Aug 2010 10:43:56 -0700
Message-ID: <AANLkTikbA5tcuyzJuO2YcFQLcCi_yUB_eRusqOpCSkJa@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Sun, 22 Aug 2010 17:44:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

I think AJ meant there needs to be another more in depth one. I would
agree with that myself. That one barely touches anything about OE to
me its to simple of an example.



On Sun, Aug 22, 2010 at 1:38 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/8/22 AJ ONeal <coolaj86@gmail.com>:
>> http://www.google.com/search?q=openembedded+bitbake
>> http://www.google.com/search?q=bitbake+getting+started
>>
>> Notice that the only useful information for a dev on there is the gumstix
>> link, which is apparently not up to par with the oe standards.
>> http://www.gumstix.net/Setup-and-Programming/view/Build-system-overview/Hello-world-tutorial/111.html
>>
>> May I suggest that someone put up a doc on the oe wiki for this? or if there
>> is one, put keywords on it so it gets a ranking?
>>
>> I would be happy to write one, but I don't know enough yet.
>>
>> AJ ONeal
>
> Can we reuse or refer to the gumstix tut?
> Or could the gumstix tut be an appendix to the bitbake manual?
> http://bitbake.berlios.de/manual/
>
> I feel it is useful to have a getting started doc. The manual on
> itself is too overwhelming.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


