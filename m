Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oqtcc-0003Rc-Gz
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 22:09:26 +0200
Received: by gya6 with SMTP id 6so3411520gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 13:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=GHoGEgkzcBDivZBzeR0M3mzGoE5S0dA9TkB5Agybszw=;
	b=aM9K6euxX0hFLN/cyW4uuwgf8vlS7RpoPnIXSIHS7bpkhsL2w1ggAjxVIeT+l18LoD
	A/ASVHLwwKHnI4wNOqUGdlAZ7h9KaoId+ebOxNBrt523WrCPQcKdskB2u7nSt1iQ5r3n
	90lkbBtSp7z5fQsMs4610O0ZHtWuY+OalOTlc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NMJ7W0TwZYzde1KCLYBdcKql9IeeSE3FTwhKXNyEWkefmf1Bxqj6eheXI+kPSG77kO
	dnbrX7A3MEfyn7C+Mfp6bwJEenUvE1AYYB5PwlMo7BIySfDYtHfWopWwti7iCQutJsIP
	C5HfVWlfkNJmmaD4zt3HwO9W6i6TDn6WN/2Fk=
MIME-Version: 1.0
Received: by 10.90.94.2 with SMTP id r2mr4943217agb.77.1283371725628; Wed, 01
	Sep 2010 13:08:45 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 1 Sep 2010 13:08:45 -0700 (PDT)
In-Reply-To: <AANLkTimeV1FbwQCMYL7WH3tuo_zwcYX1o9cs1H66VPhu@mail.gmail.com>
References: <AANLkTimeV1FbwQCMYL7WH3tuo_zwcYX1o9cs1H66VPhu@mail.gmail.com>
Date: Wed, 1 Sep 2010 22:08:45 +0200
Message-ID: <AANLkTinqVEs+Uh6jNJJVzqjE2SXMbM1ni60nUx+qtXka@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libxml-namespacesupport-perl stuck in do configure
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
X-List-Received-Date: Wed, 01 Sep 2010 20:09:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/1 J. L. <vwyodapink@gmail.com>:
> I am trying to get this to build and it seems to be stuck on the
> do_configure part, I let it run for over 24 hours before killing it
> and when I tried to alt C to kill it, it endlessly looped showing
> something about selecting the country your in and loops through the
> choices endlessly the only way I could kill it fully was to close the
> terminal. I noticed in May someone else brought up this or a very
> similar issue, what is the work around and or fix for this? Thanks for
> any help or tips


I think I had this once too.
Not sure how I solved it, it is quite some time ago.
However, it could be that I configured cpan manually on the host system

No idea how to fix this permanently.

Frans


