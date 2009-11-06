Received: from [209.85.222.185] (helo=mail-pz0-f185.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1N6Rfv-00014u-3D
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 17:28:38 +0100
Received: by pzk15 with SMTP id 15so895154pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2009 08:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=hT6k340padxpyE2qzGOsfrykKXhvt9NiFoo8mwsysnI=;
	b=QhfjnayaQQzoJrVQ+sQWkeBISugk9zWdJ9QjohPLIYmI4fV5yAtU2uLTiAKyMhlbZN
	Pxq/4Q8APFcC0whsD8Ho/w5QogveFmnXK+SkAjbIzjPBF43dLsGELKph8/HvIdH6va2O
	z8TVt47lFgxPLJkc0BmT+qYTwX3MJs1lj22GI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gFk+EYtAkn7Pm7OCtxZdkLa7KbKpjjGKnOqsKihQorW7gzl/pkpvgK3udagF3jC8K5
	8k69Ma/+dtO8+UJtBQEJixbwsj5Xh0Es0tiW6+pGVfDb9sP7E+lXDDuJB0BqlNjk/iMF
	4apawNGTa2yCba3ZS+eqWz4l4vQUfryi7KWUo=
MIME-Version: 1.0
Received: by 10.140.177.21 with SMTP id z21mr256316rve.52.1257524342766; Fri, 
	06 Nov 2009 08:19:02 -0800 (PST)
In-Reply-To: <19c1b8a90911051227i83370f0u2847b51f4d5536d0@mail.gmail.com>
References: <alpine.LFD.2.00.0911050101490.17537@localhost>
	<19c1b8a90911051227i83370f0u2847b51f4d5536d0@mail.gmail.com>
Date: Fri, 6 Nov 2009 17:19:02 +0100
Message-ID: <d1b08f940911060819k66b3b64ehab1fbe1e04691ace@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.185
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OE breakage: qte-mt_2.3.10.bb.
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
X-List-Received-Date: Fri, 06 Nov 2009 16:28:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

There is a new patch floating around, c/o Paul Eggleton.
The old asm-patch needs to be removed.

I think this could be committed today

Regards

Andrea


