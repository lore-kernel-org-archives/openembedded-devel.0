Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OiXpp-0001y3-Dl
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 21:16:34 +0200
Received: by gyd8 with SMTP id 8so3794182gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 12:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=z53hq2zMgQEhxp9F5pzE7yfpfdZiTZx1GU0d7PXBGuQ=;
	b=kWG+KYx6aoxgMwmM2/fVdKgPQs+R5g86zNnrR7W4OSEdiCPm4fUu40eCAcXsu0nSWB
	yRBzwQch/U8thBP89s2+ky6vGtfyrvaEA/9qazSORW8/ckoTGJLBGW7FAKuoNLJB5u4v
	hNTwSSe+oG3B35YAcLytbJj5494Zh480AiIC8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BEtAmzNeM/y7kbe7wNR5iKJ3vafxXzXITYfW7NW3caC59L2120o584PaZmAzwupge2
	0a5+SsPvYlcnSAVo/v6GG+gu4cr1yOLAmfRoyETVuFRaMTx3FgGdc8+z+v89jy/61nKx
	vNhqu2zF4NvSxc+W2MsZXes5CRPh2//JjhQJg=
MIME-Version: 1.0
Received: by 10.150.96.2 with SMTP id t2mr65338ybb.129.1281381383055; Mon, 09 
	Aug 2010 12:16:23 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 9 Aug 2010 12:16:22 -0700 (PDT)
In-Reply-To: <4C602232.8030806@dcombus.com>
References: <AANLkTikjR5wxTzno2fJwtnDwVzDrQaMTVU=SiEbxHbCp@mail.gmail.com>
	<1281353772-30862-1-git-send-email-henri.bragge@dcombus.com>
	<1281354725.3767.25.camel@mattotaupa>
	<4C5FEF0B.2070600@dcombus.com>
	<1281357382.3767.28.camel@mattotaupa>
	<4C602232.8030806@dcombus.com>
Date: Mon, 9 Aug 2010 21:16:22 +0200
Message-ID: <AANLkTikn+YAjeUgO9DBJXKEGUd=k0BXvoK-ZyyGnm-iy@mail.gmail.com>
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
Subject: Re: [PATCH 1/1] gsnmp-0.3.0: fix quoting in autoconf macros
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
X-List-Received-Date: Mon, 09 Aug 2010 19:16:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/9 Henri Bragge <henri.bragge@dcombus.com>:

>
> Got it accepted, included some upstream info in the patch (see v3).
>
> - Henri


Pushed your patch. Thanks for contributing.
One small remark: I had to fix 3 whitespace errors.
Perhaps next time run contrib/oe-stylize.py
Looking forward for your next contribution

Have fun! Frans


