Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsV9P-0002in-IM
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 08:26:12 +0200
Received: by gya6 with SMTP id 6so1656705gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 23:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=6ErDu94LbkKvsQ3gxaRmtKi6oeerUScVAKjmh9i+4oE=;
	b=qJAFBFeh5yM5uc3w1ly046m0rbjc5R23Lcf5lvVljk8W3znQcUaZpFOEt6prFttGNW
	yND+iKEZ5RmlGduTi7bsWG2FvwXILIrEcfhrQI/PNZDuxP2eWNHoP0F6a+HrZdTi5+K1
	kcLiEESjH5TzA7lYTCPqA6WMx4wSVdLB4zOr0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=rOEYadXiblypm6nRJ57QIpJbClLsresIBmhmwm32wGpf3LCizO5kH+vzq6leTQkvhn
	lezVKqQdMvxejr2+sRWRA/bA4vOr5tqI5V20v2yDAOutMALTXrS4QI8fF3xV8Fd0xWa2
	lWozo2oqoDTMVu4ZdDAQiB5HfFukZLjEk1CZg=
MIME-Version: 1.0
Received: by 10.101.176.35 with SMTP id d35mr2467662anp.107.1283754312835;
	Sun, 05 Sep 2010 23:25:12 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 5 Sep 2010 23:25:12 -0700 (PDT)
In-Reply-To: <4C836376.3050709@eukrea.com>
References: <AANLkTi=j4E6ZLet=qemx-Ec1CaySKLCuzZMDriX9WQ=T@mail.gmail.com>
	<4C835C8E.1000008@eukrea.com>
	<AANLkTi=GrTNa2H+UZjM6RrYU6xAx-DZg2KwDix8MzOgM@mail.gmail.com>
	<4C836376.3050709@eukrea.com>
Date: Mon, 6 Sep 2010 08:25:12 +0200
Message-ID: <AANLkTiktKfjWwgs2-xAxoOWH7_RdXfkbAYiOZoCbf51M@mail.gmail.com>
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
Subject: Re: ushare_hg (the leading ushare recipe) does not fetch
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
X-List-Received-Date: Mon, 06 Sep 2010 06:26:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Eric,

I think the problem is resolved. Somewhere something went wrong with
installing 1.10.
Although my bitbake dir was a symlink to the 1.10 dir it still
reported as 1.8.18, so guess either I misplaced things or maybe this
is a pre 1.10 version.

berlios is currently not responding so cannot re-download 1.10. I'll
try later and let you know the result.

Thanks alot for your help!

Frans


