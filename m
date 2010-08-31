Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OqUws-0002Tt-BZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 19:54:11 +0200
Received: by yxk30 with SMTP id 30so2817464yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 10:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=t6oyCBoS0oVB7iS7x0/j272LErCo5X/ewQZrCkBytVk=;
	b=v5qp+YUUBoVK60vY++F2nnCWzVDKlmLMwmuDVY7VlWTNrNSO/X2FCPcytD7qyFGEBb
	d4PWeWpQboMOVs8mPpUSv6MWLE4xM4xkLBYspTPY+H8aAtwi3NBDlJgb0EO3EztKO1Cc
	6tyC7cuhLsEYjhg1oFeIOIhq7/H/KgCTnN2S4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RPDMLjwWX7ea+u22DCvNCNiX/XVYGH28Fnb2EFDyRzldlbRdmMZ66UDKQNwWpd7dpt
	6+8Dv2IDTX5mA0MbyOYK11oTduCcWKHOIkCUphsei5/98R4IUKyB+K5hMPmbm7pLoSfK
	F5MJb0xwa5Xcht4hlsjxjB8dDtQg0HAY/ZxsQ=
MIME-Version: 1.0
Received: by 10.100.33.3 with SMTP id g3mr6930992ang.170.1283276888005; Tue,
	31 Aug 2010 10:48:08 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Tue, 31 Aug 2010 10:48:07 -0700 (PDT)
In-Reply-To: <4C7CD21C.7090003@kernelconcepts.de>
References: <E1Oke6x-0002a5-Qc@melo.openembedded.org>
	<4C7CD21C.7090003@kernelconcepts.de>
Date: Tue, 31 Aug 2010 19:48:07 +0200
Message-ID: <AANLkTikNTgYR5qVfdxEsGJiNfVtbNEUezCL=UA_1AO4a@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Scanned: No (on linuxtogo.org); SA Timed out after 240 secs
Subject: Re: [oe-commits] Frans Meulenbroeks : gtk+: remove old versions
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
X-List-Received-Date: Tue, 31 Aug 2010 17:55:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/31 Florian Boor <florian.boor@kernelconcepts.de>:
> Hi all,
>
> git version control schrieb:
>> gtk+: remove old versions
>
> I do not agree with this. Some older Gtk+ releases are useful on devices with
> limited RAM and we have some patches for these we do not have for modern ones.
>

Ok. I restore as soon as I can (don't have access to a git tree right now).
As already asked on irc: do you want all 5 versions back? I think
there were a few releases with two vresions. Are these both needed or
can we still punt the lower version?
Note that none of these are pinned.

Please let me know which ones you want and I'll restore asap. Or if
you need them quickly feel free to revert the commit yourself.

Best regards, Frans


