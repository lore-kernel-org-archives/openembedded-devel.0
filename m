Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OrDSS-0001u2-PM
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 19:20:29 +0200
Received: by eyb7 with SMTP id 7so457682eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 10:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=AwhZxRY5OUg+Zn28PYBFNVqfZm067Y4rM8M71DV8Phg=;
	b=EY3vVw9fb9vXe2yzsTFA0EHETwYVMLL/D1d6Ay/t5oblohjk8uDP96jKUrKwIKNFsu
	TVc+V1HVMrnrlTJNFtmjkbvYW2xPMXqhiPshKH5qQWz5eE8kb1Tlb7U62rvOvUXEQ0PF
	/4s0IHKs1GSZZthbn2gS+skEBUi0qaxhDqyB0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qAqEOztzpPmBTGOWJx9zQDN2gyWPIxVvuojDFpcg/IasaLaLQbe7L+boACeniA6LHE
	niiMGZyQk0f53IrlngU3Rj4QJvPwOuIdWPgse0pp3lwwv6kFqCZZAGfREkAGMe2DZJ1H
	0dnLb+H5LnUYuNIcuotQogNQaZFz6Dn+LzbtI=
MIME-Version: 1.0
Received: by 10.216.87.209 with SMTP id y59mr9592820wee.91.1283447978267; Thu,
	02 Sep 2010 10:19:38 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Thu, 2 Sep 2010 10:19:38 -0700 (PDT)
In-Reply-To: <AANLkTimsOCL0xo1Y+KL6FdmXWRcXpNf=DN2PR14tmDz0@mail.gmail.com>
References: <AANLkTimsOCL0xo1Y+KL6FdmXWRcXpNf=DN2PR14tmDz0@mail.gmail.com>
Date: Thu, 2 Sep 2010 10:19:38 -0700
Message-ID: <AANLkTikBBUuSKeXh=k+G1ejHNSdMdab_ngijDiQu7POJ@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Does the OS make a difference?
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
X-List-Received-Date: Thu, 02 Sep 2010 17:20:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

I would be interested to know as well I am building on 9.10 and seem
to get more errors than those building on 10.04 or 10.10 with 64 bit



On Thu, Sep 2, 2010 at 8:46 AM, AJ ONeal <coolaj86@gmail.com> wrote:
> The way that I understand it, OE natively compiles everything it needs for
> cross-compiling everything the target needs - perl, python, etc.
>
> However, I hear people using Ubuntu 10.04 say that they don't have problems
> building the same thing that I'm building.
>
> Is that just random happenstance or is there something about the OS that
> would make successful builds more likely?
>
> It would be worth it to upgrade from Ubuntu 8.10 to 10.04 if it really makes
> a difference... but it would take time and disrupt workflow and otherwise
> provide little advantage.
>
> AJ ONeal
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


