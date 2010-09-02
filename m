Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OrEv2-0003cw-KK
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 20:53:53 +0200
Received: by gwb1 with SMTP id 1so315590gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 11:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=tx4mGoIpP9NidaEXvQ5DwMl6RvGGjZHhOb8wnKA6OhU=;
	b=BiLAuJbjEc1vFIU423qEuUwN6caCVzDNVcn8AsAo+OneMv6adm6sudRkIqMr7SqcJJ
	gF7PAwVkOTnS7LDdCvH7iXBNfFyzLfviTXS5SEF4meWFvjUBAX2Rq4K8SYfJRwaAP9W7
	FKU07f4eqQYY+YeZnKsoph2is4JYSB2EGt0RY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=H2Lru+WsofhG73gZtaPr7qEyBodkgkAVYLi/F7aBVC6vC1emF0fMbWBd9GV7fmEk0u
	0Vwrt1JsrTz0ZOUrpao837P29cyjDBp44zoUf/pZQE95zxwcY9d33MCh7am8OPmjclMT
	ac9Vfo+07zW1GlYks4WbLYJy+DdreIp7DB0fk=
Received: by 10.150.205.3 with SMTP id c3mr554936ybg.317.1283453596275; Thu,
	02 Sep 2010 11:53:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Thu, 2 Sep 2010 11:52:56 -0700 (PDT)
In-Reply-To: <AANLkTimsOCL0xo1Y+KL6FdmXWRcXpNf=DN2PR14tmDz0@mail.gmail.com>
References: <AANLkTimsOCL0xo1Y+KL6FdmXWRcXpNf=DN2PR14tmDz0@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Sep 2010 11:52:56 -0700
Message-ID: <AANLkTi=q=PLzWBCu=oQaY3pt4yxtM+thUpVdBjbbLQio@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Thu, 02 Sep 2010 18:53:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 2, 2010 at 8:46 AM, AJ ONeal <coolaj86@gmail.com> wrote:
> The way that I understand it, OE natively compiles everything it needs for
> cross-compiling everything the target needs - perl, python, etc.

not everything but things that it needs different from native ones. It
still uses lot of
the packages installed on build host.

>
> However, I hear people using Ubuntu 10.04 say that they don't have problems
> building the same thing that I'm building.
>

could be. I don't know what your problem is.

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


