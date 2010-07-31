Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OfA4j-0007nR-PA
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 13:17:59 +0200
Received: by bwz10 with SMTP id 10so1215067bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Jul 2010 04:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=uzxl389d/ZeGVWtPLpe+a9qfbqC1uNYoroPEPWe53wg=;
	b=C/ETExFZdZcfXbk9w9uHaEZumWgXNe/ZBWTsMXgr+OMmVHuNRqcIg1EchhNhTb/R7v
	z8XgU2ImtF461JSVT84wWPnxFfMYz+A3E2oG4qnl43xKymYn09qY7u0Tl8zcSXmoS38F
	DqpU72WPlW5ueD2qU8mJclnYErDYa81b0KylM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=InJUvUhK3Ga1f0TjOlPKJdzohVOXiP0qbiGEUP+vaCqHU590ouyKYj0oCKKjM+7KHC
	PhYpb3w+PiIyvWzqpl3x4PuZFvUh3kJwP4GOtjQpicvXBx/HEveJAnrMEYgfBWYbSiAv
	umKW3PBWbUaDf47met9OQNAP1wWvG+sTwAu8M=
MIME-Version: 1.0
Received: by 10.204.163.74 with SMTP id z10mr2153813bkx.34.1280575058499; Sat, 
	31 Jul 2010 04:17:38 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Sat, 31 Jul 2010 04:17:38 -0700 (PDT)
In-Reply-To: <A806EA3C-FD29-40A7-82E7-9391241EF930@mac.com>
References: <A806EA3C-FD29-40A7-82E7-9391241EF930@mac.com>
Date: Sat, 31 Jul 2010 13:17:38 +0200
Message-ID: <AANLkTim_ffCU8p0VGgcZmuiN1q8cj6f3NS7=m2Bb8vSL@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Is bitbake 1.10 the latest stable version?
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
X-List-Received-Date: Sat, 31 Jul 2010 11:17:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/31 Elvis Dowson <elvis.dowson@mac.com>

> Hi,
>       I was wondering if bitbake-1.10 is the latest stable version?
>
> best regards,
>
>
> I'd say this the bitbake 1.10 head is the most recent version. It is the
recommended version if you want to build oe unstable head.
I would not call it the "latest stable version" though. Stable for me means
(among others) it is version tagged in git, which has not happened yet.
So y

Frans

