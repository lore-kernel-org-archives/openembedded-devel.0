Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MlXgY-0004ho-3W
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2009 02:38:53 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1299984qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Sep 2009 17:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oBPG7i2KkYQvA7DrDEex61ByqUxaanS517wHbGNVscc=;
	b=DeAr5xbHVIph2YWaCcvUbkTb0B9ZSFwPCHfgLaVmv8Yk2TeogTT31iOhi51tRxTgwI
	OGDsNno/j2VsuoDWCbKKUn5yAT8pqbapjjZn2lzINUGYDFyNACFgqUUCwO9QM8oxigNk
	7W5TknAKjwgZ6She7X3ay12O4DCOdvDJjMX30=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xSym2iZPvpwSsGxh8DzNTWTmZo7Hf//GDyg3M4wAQyHH+HOFVglKavAZlLmVeNVNMi
	Uiik2UsVEOaB9pL+7QacAYUOx6xCB4plNMDfSBk+Kb/MvpUgblmzFTmSDL2oefpc8pei
	btJdeMhCDjrvmy6p7x9u0sfEouhY5UROguuHM=
MIME-Version: 1.0
Received: by 10.229.20.206 with SMTP id g14mr533669qcb.32.1252543103578; Wed, 
	09 Sep 2009 17:38:23 -0700 (PDT)
In-Reply-To: <1252493367.27780.741.camel@mill.internal.reciva.com>
References: <4AA758CC.7030505@gmail.com>
	<1252493367.27780.741.camel@mill.internal.reciva.com>
Date: Thu, 10 Sep 2009 10:08:23 +0930
Message-ID: <6ec4247d0909091738k7805b5b3v34f5042397a1b97c@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.148
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix netsurf touchscreen behaviour.
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
X-List-Received-Date: Thu, 10 Sep 2009 00:38:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/9/9 Phil Blundell <philb@gnu.org>:
> On Wed, 2009-09-09 at 16:57 +0930, Graham Gower wrote:
>> As per http://vlists.pepperfish.net/pipermail/netsurf-dev-netsurf-browse=
r.org/2009-September/001588.html
>
> Is this damaging for non-touchscreen users? =A0It wasn't completely
> obvious to me from the patch what effect it would have in that case.

As far as I can tell, it appears to function with a usb mouse attached.

-Graham


