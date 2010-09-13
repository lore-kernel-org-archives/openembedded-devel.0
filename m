Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ov2TG-0003cE-CY
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 08:25:02 +0200
Received: by ywa8 with SMTP id 8so2039642ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 23:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=098y55Kgkv082tco5bcTO3CwLGzisGeNaQC+cAG8tFg=;
	b=iM6IesvP8p/ngpGL7V3k0YrRrM71UXuDtvxCq7Wmz/hLnUQvVNbUW1nCwrGut+3uY2
	EClkC2YpN8iNMw1fDF7y3uHYjsk2PadH5n4W4CA7QTD++ZwMjf2zXJpQHC1mu+rbbcNr
	UzWXlqs5n+2CGAgguVexRD8ZtKcY7UjGzfgn8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=p8tvasuJxzcZhd/FSWk8Zv89VqJFFlKbfneTN7CaTCJ91RoMmkp64a+71YjQ+Akdp7
	rZYPSh65eoNs54Kdr/RLVtWPOLe2pBybg+Fg/S6f5TzUAxCXSqFafjJr/fL7LtOTjAql
	3KNeT/MeM1tFPF1AqyN0j0vB4NI0rQghAdM7s=
MIME-Version: 1.0
Received: by 10.150.55.28 with SMTP id d28mr279265yba.223.1284359037084; Sun,
	12 Sep 2010 23:23:57 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 12 Sep 2010 23:23:56 -0700 (PDT)
In-Reply-To: <i6j7h4$m7t$1@dough.gmane.org>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>
	<i6629i$d5c$1@dough.gmane.org> <201009081609.32135.pieterg@gmx.com>
	<4C879EC5.10402@balister.org> <4C8ADB7A.4000303@techsol.ca>
	<i6f9uu$39o$1@dough.gmane.org> <i6fc40$90f$1@dough.gmane.org>
	<i6j7h4$m7t$1@dough.gmane.org>
Date: Mon, 13 Sep 2010 08:23:56 +0200
Message-ID: <AANLkTikbF1e5LxEVduNiS7oyxNd=smDh2AnmBR4oOxu8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patch to fix libstdc++ problem, was Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Mon, 13 Sep 2010 06:25:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/12 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Apart from bikeshedding on PR bumps, does this patch work for people
> besides me and is the solution acceptable for gcc-cross?
>
I don't know, I was planning to set up a test, but your usual kind and
friendly replies caused me to direct my efforts and cpu cycles on
different issues.

Anyway, as long as there is no PR bump, for me this is a NAK.
If it is fixed it should be fixed in the best way. A PR bump is part of that.

Frans


