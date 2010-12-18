Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PTzIa-0000as-HQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 17:06:21 +0100
Received: by iwn8 with SMTP id 8so1900076iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 08:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=KYhit78dssGwaVmh6Dh0z/8FWDYvcnxiX0dlne9T9ZU=;
	b=gRXGi3BP73FMNJCB874+Ae6/vrUwfU/MkIeDVXcYB21GaktqLdCdiPkWpJGzPpQjK9
	anm5EF6oyBFFl+ltaMuoPGhu9L5LKfO/euzLrc0TRSbQnGD+2xrCL5pr7YFsW+20dTed
	9rRafRNlqN62Kccms8XrsbHXfvRMzvI0g4tyQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EulmjMSBn1YtegAtSarbEfO7ID5n5/3LRkuOvQNr7yDgbNq4JL4tzTS7/PFwjy7upb
	VITaLW6uoFg/aUSeQ+UhlHalT1vs10jIOUAKzh8Ic6oSH7iGMvrju5MTL0QyyXBgFZWG
	vXswaxYnwoTceCT5+Ux0acwJWVCPLhoniwDi8=
MIME-Version: 1.0
Received: by 10.231.149.194 with SMTP id u2mr2084766ibv.32.1292688376293; Sat,
	18 Dec 2010 08:06:16 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sat, 18 Dec 2010 08:06:16 -0800 (PST)
In-Reply-To: <AANLkTikPkD=e6O=cXQA5b5LYd6kapdgtjx=UG_pSweGn@mail.gmail.com>
References: <AANLkTikPkD=e6O=cXQA5b5LYd6kapdgtjx=UG_pSweGn@mail.gmail.com>
Date: Sat, 18 Dec 2010 17:06:16 +0100
Message-ID: <AANLkTim_OLguz9NcTbCiXyzipjcefUR4cAPQ_=N756bg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2010-12-17
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
X-List-Received-Date: Sat, 18 Dec 2010 16:06:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

For me nslu2le, nslu2be, calamari, mpc8313e fail on e2fsprogs. This
has been fixed by koen after the testing branch was made.
sheevaplug fails on gettext. Note that this is with minimal and has
been fixed by JaMa since.

I don't think we will see success reports on this one (at least not on
unpatched versions)

Frans


