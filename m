Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NpdLg-0004SP-Ep
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 09:02:29 +0100
Received: by yxe5 with SMTP id 5so1969414yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 23:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CivzjLZkW6U+3hoULoBgLppYc9dJROn/tYCM/HSOhPw=;
	b=pUfagNVbxBTVOP9SoFFBGV/KK0OmUvvdpRtwnQPh+Gy1jfj7f1u3baeudoHQu9+XSo
	oSatXMIns/ZpiIlaJSNkPT8Ej7ZCM1MpRmxkOVwx3ldXX2oI+Lzs+omQrb51paJKH+Ir
	jCMi9nJUaEhfkl5vrnwUPpJeO6z3FUhItoayg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Zw2YpVNQNHhV5yYm11spDNA2fTqDJXL4coksIQY2dJunZbI3wTPJIgXm8ecy6OSEFD
	2Zlyaj4jIDhBNx79IxP0BE+pSXYulR/c3hpl0CnsKIo0aI2m9fNVfhPo3Mj5AXGPgJLa
	n/EVpALP1E8OkEtl24ThrILmux9+o+DoD7pD8=
MIME-Version: 1.0
Received: by 10.100.60.19 with SMTP id i19mr3222080ana.62.1268294369387; Wed, 
	10 Mar 2010 23:59:29 -0800 (PST)
In-Reply-To: <4B9894F4.5@dresearch.de>
References: <DB561678F08F554EB0D9F21B70E268A505AE79@exchange.intern.dresearch.de>
	<4B97C28F.2020609@dresearch.de>
	<d1ded4381003100919y125959b5m3198c8d848661187@mail.gmail.com>
	<1268246120.14566.1078.camel@mill.internal.reciva.com>
	<1268248565.16526.231.camel@trini-m4400> <4B9894F4.5@dresearch.de>
Date: Thu, 11 Mar 2010 08:59:29 +0100
Message-ID: <ac9c93b11003102359n42d2e94yf56b05a39decb4fd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Where are my patches?
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
X-List-Received-Date: Thu, 11 Mar 2010 08:02:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/11 Steffen Sledz <sledz@dresearch.de>:
> Tom Rini wrote:
>>> If your patches are reaching the list then it is probably nothing withi=
n
>>> your control. =A0I think some folks have had trouble with patchwork's s=
pam
>>> filtering in the past.
>>>
>>> In any case, it isn't necessary for your patch to appear in patchwork i=
n
>>> order for it to be actioned, so there is no need to worry about it too
>>> much.
>
> That's clear. But when i create a patch suggestion outside my area of
> knowledge which needs some discussion and may be some updates it
> would be very helpful to do this within patchwork.
>
>> There is for people without write access.
>
> Do you say that patches from people with write access generally do not
> go to the patch queue?

They also go to the patch queue.
What Tom probably wanted to say is that most people with write access
commit the change themselves (unless it is a patch that affects core
functionality)

Frans


