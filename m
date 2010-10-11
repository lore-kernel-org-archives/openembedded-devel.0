Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5Br7-0007Sv-Vy
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 08:27:30 +0200
Received: by iwn7 with SMTP id 7so2282958iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 23:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dFq3s7o/hTgEz5G1RybI3iA4+dpnggfUgOkxTgcOhXs=;
	b=la9rjaItCTwbIY+dAGjSKAJeZCZ0CWP838+100kqEkhn1BKshGJmDWoF4E5zW8K0qG
	DvCdLcAwBLnYcJe82Vuwow4CklYomgsEJjgZa+xxfylnpF2+xypcdUPJWuqS0kqzuOtj
	5Oz13ZP4fC/lBvDHx+4aeaPdrJiUT1spjSRoY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gG7oVdyIXFZ6nTLT3Ys0grRn0xb9Lx7ZhgrP4GzQx7XY9Z2X+X52S/Bu0BYapZ7q9g
	Hn7WU/Pbm2Ol/1k6vxXZDmv2KzQpZ1+LsJecEyYNjsMauwZQbdErTunV0OfETYGmwApT
	AoRSNhCBnn5DpqGtMgtfczaO3Du8QZH3daUY4=
MIME-Version: 1.0
Received: by 10.42.148.74 with SMTP id q10mr216023icv.431.1286778422742; Sun,
	10 Oct 2010 23:27:02 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 10 Oct 2010 23:27:02 -0700 (PDT)
In-Reply-To: <F34D057F-F640-4BB6-841B-2B66AFE37A99@mac.com>
References: <F34D057F-F640-4BB6-841B-2B66AFE37A99@mac.com>
Date: Mon, 11 Oct 2010 08:27:02 +0200
Message-ID: <AANLkTin8xbEBR=mVr3PHN9cjwqtUoM9BxpYkgBE7p_UY@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Building for multiple machines
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
X-List-Received-Date: Mon, 11 Oct 2010 06:27:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/11 Elvis Dowson <elvis.dowson@mac.com>:
> Hi,
> =A0 =A0 =A0 =A0What should I do build for multiple machines ?
>
> I have an overo-oe repository, but I need to temporarily build u-boot for=
 a different board.
>
> In my auto.conf, the entry is MACHINE=3D"overo"
>
> u-boot board definitions for say beagleboard, have named the board "beagl=
e"
>
> So, would an appropriate command be
>
> bitbake u-boot-omap3 MACHINE=3D"beagle"
>
>
> Elvis Dowson

I guess trying this would ahve been much faster than waiting for an answer =
here.

And OE does not have an auto.conf

Frans


