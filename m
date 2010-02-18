Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ni1Ue-0000KV-ER
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 09:12:19 +0100
Received: by yxe5 with SMTP id 5so7159027yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 00:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=N+avMTN6Jahon1Gq+kUrljtxgIvzGdYaCtnNvrM4rQE=;
	b=FjU/PTgcccrbyOSp4Wq9+6VUBG17Hr2AvA9NHXpULNGjv2OEty2ox0XmpTPXnp8k8X
	kv+uyQxB3SQ9q7rxHItGjnVtZ8gsp8dW0ni/Gz598DBm1fIIl6kfv9loD0CCjTmjbgji
	CwncC2KCIzC1RudvxsBZ+GuL0ycoffTYIPYC0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=e4jJcdEijBRCyS98vbpHN397FnB7IjKSJq6IQprSLZvYT6l87yHhqedpfPxBHqPngK
	jir4YazjAhj7tl12+QCp/ftKwUmMA2G+JrgXy8gVev5b9qapVXuqrXnaz5Vcg80rWIal
	IbLLZHD+Z01auY3R8YKCwcE04K0TWnvkvpWc0=
MIME-Version: 1.0
Received: by 10.101.40.1 with SMTP id s1mr8604727anj.222.1266480575559; Thu, 
	18 Feb 2010 00:09:35 -0800 (PST)
In-Reply-To: <ac9c93b11002171100l2d51fbc9yda47c49a3f992723@mail.gmail.com>
References: <E1NhoRW-0004A2-AO@melo.openembedded.org>
	<1266432642.5977.20.camel@andromeda>
	<ac9c93b11002171100l2d51fbc9yda47c49a3f992723@mail.gmail.com>
Date: Thu, 18 Feb 2010 09:09:35 +0100
Message-ID: <ac9c93b11002180009j65c436ebu3e740b9fd29afb64@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
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
X-List-Received-Date: Thu, 18 Feb 2010 08:12:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/17 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/2/17 Michael 'Mickey' Lauer <mickey@vanille-media.de>:
>> What has become of our revertion policy?
>>
>> If I recall correctly, reverting foreign commits need ACK from two
>> members.
>>
>> On the actual subject of recipes; Rolf, let me encourage you to create
>> another set of console-image[-base], i.e. agnostic-console-image or so.
>> If we can no longer refactor in OE, then we have to resort to creating a
>> parallel world.
>>
>> Cheers,
>>
>> :M:
>
> +1 for this proposal
>

Can we have a TSC decision on what to do with console-image?


