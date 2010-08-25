Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1OoJCq-0003V5-5u
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 18:52:08 +0200
Received: by ewy7 with SMTP id 7so425490ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 09:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=tgG/dYewh7Gds8zPjnBbUfQVeIxDF8USh9zWbPkTosM=;
	b=sWbcahnEesCGmAMX7IS14TlvRjbG4KD2Pe5/g/FTui9Ox6j9SLFNKTZ+cpFjeoBa+4
	A+l4kbPD6g9IOjPaNxhMigOlXDH2AOxB1th+2hle7oB3A5juwOIWL312p+kgU5yUvpfz
	hSOcggVZ8M448pnZiTNnqTxOhZBo4z19O8Yqs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GgO6LZisfnNmNty7G1f6rHvzYC2g1rBNMGFFsjMXxWtQFSR2n7ObvoE8eXbxssnsBS
	aPzrrgwgsrMDJfSiGgzECXumb/0Tn8i3uuNx6+yrKt2hO34p2baOZR3SLYVUCmaspXIp
	DU9sMZRp1dGPmfhQW85iGKSR0UmCqcyT2FuKA=
MIME-Version: 1.0
Received: by 10.213.31.73 with SMTP id x9mr4000914ebc.51.1282755103462; Wed,
	25 Aug 2010 09:51:43 -0700 (PDT)
Received: by 10.14.6.75 with HTTP; Wed, 25 Aug 2010 09:51:43 -0700 (PDT)
In-Reply-To: <1282739805.3880.96.camel@mattotaupa>
References: <AANLkTi=nsTUOndpz7duDncPmbto8vueL0axvEV2qRCBQ@mail.gmail.com>
	<1282731315.3880.8.camel@mattotaupa>
	<AANLkTi=ofXwz1kEQih4Yk0At8X0YDFmtQ2TwrWZTuwji@mail.gmail.com>
	<1282739805.3880.96.camel@mattotaupa>
Date: Wed, 25 Aug 2010 22:51:43 +0600
Message-ID: <AANLkTi=SgVW5dOyK6m1ezv6F7HQB9AUNo_eOPaKzRrYi@mail.gmail.com>
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: norguhtar@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Upstart sysvinit compat
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
X-List-Received-Date: Wed, 25 Aug 2010 16:52:08 -0000
Content-Type: text/plain; charset=UTF-8

> Unfortunately I am quite lost, what patch is right and what wrong, since
> they have no iteration numbers [v2], [v3].
>
> Please resend making this clear. Since they all are mangled, this is
> necessary anyway.
Done.

> Sorry for the inconvenience. I hope the next iteration will be fine.
No problem. Now i'm know how right send patch :)


