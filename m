Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OmCGX-0001ya-6U
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 23:03:14 +0200
Received: by gwb15 with SMTP id 15so962521gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 14:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=DMTBwu1A4AQQadpG5A0JcOHChgRJZIKIeswa+km7Wd0=;
	b=tGaRkzBkQSCEUdTJCFRTjMzuX1PD390AnLi01/B0ubwpUR4AUuVZ2hmZDh6c3M4Iku
	uv+iAsD5wCT7NZ16LZQQdKCObW65gBFiQHxpuMGv22Fk+s+SDIypT1Sj9Mfl5fPXty+v
	eY8Dc04WmrtIufb46b7t59QodJ7Kvj0Vw+uVc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=N0da6FpD7AajMoAsUMAVp07oBDN71AYmWIUE7hAu/gAMZ7eR8ncYoLAEhlHNavTPd8
	uuu7AGPJLDK4yftYKwUOssmo7o5OouDASm0Vd7hv0GQVMTD6zkAqQgCK3tGMZUbpAG5f
	LOHt+ZIfPSKBrlbvv4VXcTagh5QRGlgpQYRts=
MIME-Version: 1.0
Received: by 10.151.6.5 with SMTP id j5mr590638ybi.278.1282251770079; Thu, 19
	Aug 2010 14:02:50 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Thu, 19 Aug 2010 14:02:50 -0700 (PDT)
In-Reply-To: <AANLkTikg6S_BgHYYfDb63Pd1qLMHD5T8obfx4_R+rJNV@mail.gmail.com>
References: <1282118880-27729-1-git-send-email-fahad_usman@mentor.com>
	<AANLkTik0m-1QRcExaT9wX2kc5SA8XyBDOGiC7nad5rvz@mail.gmail.com>
	<1282212714.27679.158.camel@pkl-fusman-ubuntu>
	<AANLkTikg6S_BgHYYfDb63Pd1qLMHD5T8obfx4_R+rJNV@mail.gmail.com>
Date: Thu, 19 Aug 2010 23:02:50 +0200
Message-ID: <AANLkTinoi=QYMhf7ZZRUii1QB6jzBNSj-vX-ZD=EfwER@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gawk-native_3.1.4.bb: Removed legacy style staging
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
X-List-Received-Date: Thu, 19 Aug 2010 21:03:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Since I had some time to spare I converted the recipe to BBCLASSEXTEND
= "native"
Thanks for your contribution and inspiration.

Frans


