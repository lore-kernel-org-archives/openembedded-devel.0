Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N7os9-0005s6-PH
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 12:26:56 +0100
Received: by yxe5 with SMTP id 5so3531444yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 03:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=VWCMXL8v0L+aonalMc3A1jFJBR9vSKqeRtBlXEih0+U=;
	b=vBBM88Z9umHOnqVjbUoZfsHKaCEvy73veUw9DTmgfoAtKwjloBoJ/nKCjMH99S7Arn
	3FK7DUU81egFsprf74tcvu34zKp8wUj3Sl/m5vswgA+t08v5ne0KHvFNdqWU7RG/Zf5N
	RJ4hwecaSYVTZ5/O1flEPI3ivym9May2lmP5k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pb/4kYFDSsWx1ePxytSJI1zVcyOhH4GIPyJUiqLdQwmHmGEZU/A0iFN0BpMSvqWREJ
	hGBmYg9TXALWFjQgHATa40XiU3JgZqGUM8rOTgloOzIBASFol37Go2re+0sE1jMGEM0D
	WGHO/Szekkc20E6shuQ87wWw0VM+GxZF1efLY=
MIME-Version: 1.0
Received: by 10.101.167.27 with SMTP id u27mr3761740ano.199.1257852333628; 
	Tue, 10 Nov 2009 03:25:33 -0800 (PST)
In-Reply-To: <be7a9f3d0911100239k1fdbc89dr28a4d355d7cad27f@mail.gmail.com>
References: <1257762970.29038.40.camel@dax.rpnet.com>
	<hdaeo3$9l5$1@ger.gmane.org>
	<1257817816.29038.153.camel@dax.rpnet.com>
	<be7a9f3d0911100239k1fdbc89dr28a4d355d7cad27f@mail.gmail.com>
Date: Tue, 10 Nov 2009 12:25:33 +0100
Message-ID: <ac9c93b10911100325i2ccebd25y766695688ea999d9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM - Summary of some the outcome
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
X-List-Received-Date: Tue, 10 Nov 2009 11:26:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/11/10 Otavio Salvador <otavio@ossystems.com.br>:
> Hello,
>
> On Mon, Nov 9, 2009 at 11:50 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
>> That is unfortunate but I suspect if we waited until everyone's personal
>> favourite distro adopted it, we'd impose artificial limits on what is a
>> development branch. No easy solution really :(.
>
> Even being a big fan of Debian I must to agree here; OE shouldn't wait
> for distros to make changes otherwise we'll have a nightmare to
> manage.

actually installing it from scratch is not really a big deal anyway,
grab the tarball (I used wget
http://download.berlios.de/bitbake/bitbake-1.8.16.tar.gz)
untar to the right place, then rename dir to bitbake; then python
setup.py build and optionally python setup.py install

And RP, thanks for the report! Very appreciated!

Frans


