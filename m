Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OnPpk-0007fl-K6
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 07:44:37 +0200
Received: by iwn2 with SMTP id 2so2716305iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 22:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=T+pvjR64vVuvk1bkFAQHaMaAFUuK2WRXw0DzogUx7gE=;
	b=DhkA8PzDWXkyf4U5e9TZWpRdq65Va4QfljgwrqZBnVQJIeBZU9s2j8hLb4SCFbDQ2M
	6K7In5frDMe/HskRiWGr0oKg8tzdg4i/frWQxAUsD7atbc9vP27KBh8uAzy4IDMtL4pr
	pI4wQoJChhM0ybJN93T+B2ggPMQ1hA3JF5+vs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Be8gugSMXosKO815IH/vvSm9xI5iQMMdJtO7gV3YO3m943DjeQF2Ti1guy5xz5rfZR
	q6WuPjAkY3SSofibHxSrDLU46BYzFI9lmllRnYVpjdcI+p+3Do6ffy0Nwj2u9BAmj3EE
	yAUHHYNMnsDnuo7q157XoYpdF9E8HIUKKu2i0=
MIME-Version: 1.0
Received: by 10.231.19.6 with SMTP id y6mr5419020iba.16.1282542243821; Sun, 22
	Aug 2010 22:44:03 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 22 Aug 2010 22:44:03 -0700 (PDT)
In-Reply-To: <1282533191-11579-1-git-send-email-raj.khem@gmail.com>
References: <1282533191-11579-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 23 Aug 2010 07:44:03 +0200
Message-ID: <AANLkTi=VrAJaQxoshR8aLWnrCWnMcL5oc-jiZ1uaT5Yo@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] Add efika MX support to OE
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
X-List-Received-Date: Mon, 23 Aug 2010 05:44:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/23 Khem Raj <raj.khem@gmail.com>:
> Hi
>
> Following three patches will make OE support Efika MX smart computer.
> The kernel and u-boot is used from powerdeveloper.org as all the changes
> are not upstream yet.
>
> Thanks
>
> -Khem

I have reviewed (but not build) the code.
The code looks good and as this does not interfere with other recipes
or systems I'm fine with getting this pushed.
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
This ack is for all 3 patches.

FM


