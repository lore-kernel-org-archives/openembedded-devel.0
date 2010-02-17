Received: from mail-yw0-f171.google.com ([209.85.211.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NhpAc-0007un-3C
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 20:02:49 +0100
Received: by ywh1 with SMTP id 1so170206ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 11:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=wDQGc5aMkRjzR7Q4zY0b+vcYBHPgR3d36Pt2gp34FeM=;
	b=nSW1aIAlY0QWFMaoXc0tnKI2P/hqa939otKrlSTz7NNg6gGKxyySWWf8dj+tbvcD3D
	NdYhIYPqiAda0Ss4f2muC1Joh0AgkA11HG1hO6c2jU9uqpYX8zph0z/qGwfh5ul0Dw4Q
	VUgmv7ALvn3J9/L5EJig7baqmTVXdPBbjyPe0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HWclWnN1q9GdOkueuk/TG8nmWCzxu3TnlKoW3HF7LKaTC+KDRkjF2M6MIpX3C4Vpiq
	CYt1k0hNJ8rAoYL+azci1nV5tun0XIx8SYNESqooVms5CiGskuXVgNBCP1nCgOmiXyM0
	+WMnljX1rNtaACZhPzdVtr8qDQr4E/ruEmqzU=
MIME-Version: 1.0
Received: by 10.100.83.3 with SMTP id g3mr6105356anb.3.1266433205871; Wed, 17 
	Feb 2010 11:00:05 -0800 (PST)
In-Reply-To: <1266432642.5977.20.camel@andromeda>
References: <E1NhoRW-0004A2-AO@melo.openembedded.org>
	<1266432642.5977.20.camel@andromeda>
Date: Wed, 17 Feb 2010 20:00:05 +0100
Message-ID: <ac9c93b11002171100l2d51fbc9yda47c49a3f992723@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.171
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
X-List-Received-Date: Wed, 17 Feb 2010 19:02:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/17 Michael 'Mickey' Lauer <mickey@vanille-media.de>:
> What has become of our revertion policy?
>
> If I recall correctly, reverting foreign commits need ACK from two
> members.
>
> On the actual subject of recipes; Rolf, let me encourage you to create
> another set of console-image[-base], i.e. agnostic-console-image or so.
> If we can no longer refactor in OE, then we have to resort to creating a
> parallel world.
>
> Cheers,
>
> :M:

+1 for this proposal


