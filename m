Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Oq6MX-0002B4-Ht
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 17:33:34 +0200
Received: by wwb31 with SMTP id 31so6528611wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=u0hZCBGh4dOY38BS7lJzdVyTOqQsC4l60q7QaDlMAWs=;
	b=qoNAvV+D2c1K8MVrH1OHYrjvIdfitG6F15HgMAkqIGkRHvszQiujWQdyPle3hkUhwJ
	VY8wcBAn7MES8uCMS7sxgTb4dNtKVcOoXsgptdDGBIoxC1PKeuiFtAcfYFFW3pjobuz2
	t4s6+le2nUU2Y7o9QHohhHaeQrMjj5UFFAZDU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=n/AXtyaxOGyfpECIpidS05uX/fPN58AFgJBX76gfzk3mb2Wx1Ry8p8AhnquGuxEkKg
	FfA3nIaCPcEQoVahT6OCazBCVzj0FX6mJSoV7yjMjzoeE3fEb3Ld5saDd0qUv61+O5Kc
	dVHeWev0I/YyR2yJiAP1kepUQZ+ImhLF0Xd9Q=
MIME-Version: 1.0
Received: by 10.227.129.80 with SMTP id n16mr4710794wbs.104.1283182378474;
	Mon, 30 Aug 2010 08:32:58 -0700 (PDT)
Received: by 10.227.142.79 with HTTP; Mon, 30 Aug 2010 08:32:58 -0700 (PDT)
In-Reply-To: <4C7B8C6D.4040703@dresearch.de>
References: <4C7B8C6D.4040703@dresearch.de>
Date: Mon, 30 Aug 2010 17:32:58 +0200
Message-ID: <AANLkTi=BaBWrXi__aFHjpm5iRr8BJZ4RR9djaNiQi0rA@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Wiki problems
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
X-List-Received-Date: Mon, 30 Aug 2010 15:33:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello all,

On Mon, Aug 30, 2010 at 12:48 PM, Steffen Sledz <sledz@dresearch.de> wrote:
> Tried to update some pages in OE wiki with this result:
>
> Fatal error: Allowed memory size of 20971520 bytes exhausted (tried to allocate 7680 bytes) in /usr/share/mediawiki/includes/SearchEngine.php on line 184
>
> :(
>
Does the same server run OE GIT?

It does 20 kB/s on me the last few days, and several disconnects/timeouts.

Regards,
-- 
Leon


