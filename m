Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PXeob-0001qh-JR
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 20:02:33 +0100
Received: by gwaa12 with SMTP id a12so1704260gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Dec 2010 11:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=hRxSCC8z4zWIj3C7E7QQHBxHCswjcr2zttSpI9IHhq8=;
	b=qKpGvzdSgyKGwkAUN25sdhblPshaeb4p9pP/m0Gm1eostwtxO1ukCOLdpUZ6AhagFF
	Hd42Oq8b153tBpXKV4JhJ6eScAx5tmhrzsaJugemgpJS2Hd6YN3/qx4liRdd46bLq3Ra
	uSB0oyscnDh9ANdFbMrDK8f6jn7FCnbBN6vrA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=C7MIoisW3n7U9OU/2clTdKQZLQ1PV0tMfvHg9AW2C25ULHj8cSYMZtkIwJRnVbHi/b
	yt2skVFzb8SHQK9kVGV+WxTQV4HKO77EHYBkw+74YSkP+gd5hvO58N2zIKyLdhHXb3cz
	L8LCZip3rdvGO6llwLqH11uXvd/o6qnBhVZZk=
Received: by 10.90.10.31 with SMTP id 31mr4564433agj.85.1293562937446; Tue, 28
	Dec 2010 11:02:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 28 Dec 2010 11:01:57 -0800 (PST)
In-Reply-To: <AANLkTimmk7wnCS66EUFu6=A+c9ckgse8ECRGLz+RD-mx@mail.gmail.com>
References: <1293476385-7289-1-git-send-email-bgamari.foss@gmail.com>
	<1293476385-7289-2-git-send-email-bgamari.foss@gmail.com>
	<1293499083.2173.26.camel@saphir>
	<AANLkTimmk7wnCS66EUFu6=A+c9ckgse8ECRGLz+RD-mx@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Dec 2010 11:01:57 -0800
Message-ID: <AANLkTikkEQF90jW6NvzsC8zBg5O2bo-FH4UAaubcJAKX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python: Initial commit of python 2.7.1
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
X-List-Received-Date: Tue, 28 Dec 2010 19:02:33 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 28, 2010 at 3:11 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Strange.
> I see the patch on gmane, but it never made it into my mailbox (not
> even the spam folder, also re-checked the trash).
>

somehow it did not get caught in patchwork as well. Please resend the
the patch probably use git format-patch and git send-email
as described in
http://wiki.openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded

> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


