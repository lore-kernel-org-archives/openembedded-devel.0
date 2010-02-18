Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ni46x-00069A-Gn
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 12:00:02 +0100
Received: by yxe1 with SMTP id 1so589620yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 02:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=GlmA1R1HBGpsluO3MdxRTIV7qL2jOai5oQ0O8uCAwLc=;
	b=seI6y6+c7A83MFySdSLWGSxHFRePm0VpQjtwKtgWgojGsJcagSSBICV17zN4JtCblX
	ZeJLhibljTI+zeVAO7tfOBp4fGP94Sjb7OD+0UDwRWDIYjesE9MwoZsdD0MGGj7zq8CH
	Z30OvM+3B1FkAOCtBbwOyfjm8q9cfW/gcTuqE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vbil5avyKVlLmK9HjIs+ZhTTnsuU+Teiy9pNBH8PYC1wQQxb12yAKgCIu8r11XlVXP
	Ol7bb8nhGMKCbCbvQEXbb+1av5JOGdI+zjJxy1AHb/XHnNz5UmXiq4PPQJI8iakkBcny
	s43gd50ffRbDqnkzSKPscI/nlGelGyjbJenvg=
MIME-Version: 1.0
Received: by 10.100.200.20 with SMTP id x20mr970714anf.171.1266490638785; Thu, 
	18 Feb 2010 02:57:18 -0800 (PST)
In-Reply-To: <20100218105029.GI2251@xora-desktop.xora.org.uk>
References: <E1NhoRW-0004A2-AO@melo.openembedded.org>
	<1266432642.5977.20.camel@andromeda>
	<ac9c93b11002171100l2d51fbc9yda47c49a3f992723@mail.gmail.com>
	<ac9c93b11002180009j65c436ebu3e740b9fd29afb64@mail.gmail.com>
	<20100218105029.GI2251@xora-desktop.xora.org.uk>
Date: Thu, 18 Feb 2010 11:57:18 +0100
Message-ID: <ac9c93b11002180257m3c89be51v345032f94b9ec8cb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Koen Kooi : Revert "recipes/images/console-base-image.bb: factor out Angstrom-specific bits"
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
X-List-Received-Date: Thu, 18 Feb 2010 11:00:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/18 Graeme Gregory <dp@xora.org.uk>:
> On Thu, Feb 18, 2010 at 09:09:35AM +0100, Frans Meulenbroeks wrote:
>> Can we have a TSC decision on what to do with console-image?
>>
> Please be aware that the TSC has members for different timezones and that
> we all have daytime jobs so a decision will not come until appropriate
> discussion has finished.
>
> Graeme

I know (and I fully agree with it).
It would be nice if the community would be kept informed on the
process (e.g. when the TSC does meet).


