Received: from mail-yx0-f178.google.com ([209.85.210.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ng3Ns-0001fD-SP
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 22:49:12 +0100
Received: by yxe8 with SMTP id 8so2829445yxe.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 13:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=8ADvXysNaw3Vlsk94DLtbqo6QApboYbYJqYvssBUC0k=;
	b=XMXKS2xssCnfWjy5Te0WM1jFhzrDB5sWuNEQZaL618+WAZK9WBtDxiyzll0So6GuyP
	xCuL3AO/3cv19S/9Awt7JopI6cY5UaHUJxiqZi0BUF+Fd9wRTBo1MebypeWJfwO2AOmd
	n5PvYn/fikJMcB4dnvqRM2BnNHc3kBAHm4U5g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aN77BdPybs474eBAzv4qVB8zZsKHpaVGZXu8/o37R0CX+ArNhuAyzFw1U4BQWJeIHJ
	bVKourXMrzkP5QwZwHNaBa383elkfU5X/ju4APaflZwL3/Ufy+RqnIdI+ELJYmIVlTOB
	kAinAWAMXC5/7deepNUzsClXJ/Ie8lvsjyMZ8=
MIME-Version: 1.0
Received: by 10.101.132.8 with SMTP id j8mr2984280ann.44.1266011192741; Fri, 
	12 Feb 2010 13:46:32 -0800 (PST)
In-Reply-To: <20100212194114.GH1638@il.fontys.nl>
References: <20100203104829.GL17820@il.fontys.nl>
	<1265195232.5591.75.camel@mattotaupa>
	<20100203111649.GN17820@il.fontys.nl>
	<20100210072033.GF1638@il.fontys.nl>
	<ac9c93b11002092333s3a90d623xd6234e392d84925d@mail.gmail.com>
	<20100212085414.GG1638@il.fontys.nl>
	<ac9c93b11002121033s6b25910fj87fbe29373cf6870@mail.gmail.com>
	<20100212194114.GH1638@il.fontys.nl>
Date: Fri, 12 Feb 2010 22:46:32 +0100
Message-ID: <ac9c93b11002121346l6cf2b82s59b71ebaa8849123@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New machine: Embedded Artists LPC3250
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
X-List-Received-Date: Fri, 12 Feb 2010 21:49:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/12 Ruud Althuizen <ruud@il.fontys.nl>:
> On Fri 12 Feb 2010 07:33 PM, Frans Meulenbroeks wrote:
>> Ruud, can you resend your patch.
>> I wanted to apply it, but you've submitted two patches and the text in
>> the first one reads:
>>
>> This is a kernel recipe for the LPC32XX (LPC3250) based Embedded Artists
>> development board. It uses public patches provided by NXP and Embedded
>> Artists. The other two patches provide drivers for the PWM capabilities
>> and fix one NXP patch.
>>
>> (and there are 4 files in the patch).
>> In order not to make an error I wanted to verify what exactly need to
>> be patched.
> 0001-linux-ea3250-New-recipe.patch:
> =A0 =A0 =A0 =A0Kernel recipe, defconfig and 2 extra patches (included in =
git-patch)
> =A0 =A0 =A0 =A0to fix update5 and make it possible to use the PWM pins.
>
> 0002-ea3250.conf-New-machine-config.patch:
> =A0 =A0 =A0 =A0Machine config (depends on kernel) and updated checksums.i=
ni

Patch applied.

Ruud, thanks for the patch.
Please verify that everything is ok in the archive.

Frans


