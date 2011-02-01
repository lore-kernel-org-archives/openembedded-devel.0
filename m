Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1PkBh7-0000sA-Rm
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 09:34:37 +0100
Received: by qwi2 with SMTP id 2so6247086qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Feb 2011 00:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=I9OZLirKrqcXMYXnnScado+2WNM8y+zrRR58RBK87lY=;
	b=K5/94+T7OrWEvnpcpau5K7Shw3ezaQujR/RX1DM31YRp1mrsJ4a3GGnUr7Ydy8C9CR
	1VhmoM+IivNpnosZnB2WY/9Zwfu8daWZ6ySWkkISxZsT2+m6Jf1ipq3GYTwPKjdDKsjs
	nXf0VgGAH9WyFuVG4n9AWCyPbNoyuVeC+pBWk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gOI162HXB3kPE4yIcFm3buIxSjHmUNyBwS2u4HtPg7ux5W1SHUkOg7H2S13r0fYUVj
	jXlsJIFYsbp2OCnh0oQ16JspWowJYRvv/VD9X/KiqdDdEAOVlbC65S9MOEWk/43McoEq
	3D4+BG5Di7HM1AqxYa8+Qgucip+c3cltKebhE=
MIME-Version: 1.0
Received: by 10.224.37.77 with SMTP id w13mr7278591qad.367.1296549220013; Tue,
	01 Feb 2011 00:33:40 -0800 (PST)
Received: by 10.220.188.3 with HTTP; Tue, 1 Feb 2011 00:33:39 -0800 (PST)
In-Reply-To: <4D47B720.90008@eukrea.com>
References: <1296220046-14636-1-git-send-email-sujak.marek@gmail.com>
	<20110129140758.GM2466@ibawizard.net>
	<AANLkTikMy0Hw9Yi3B1fHoDbF5jq_J8DaS3vPT+bGs=6h@mail.gmail.com>
	<20110131212130.GB10042@ibawizard.net>
	<AANLkTi=b8QHFgH9Bp4gEBa=rrJt9hQpaxKqdtHa7iAdt@mail.gmail.com>
	<4D47B720.90008@eukrea.com>
Date: Tue, 1 Feb 2011 09:33:39 +0100
Message-ID: <AANLkTimN4ULh9=E3vfX75QqDe0NdTs8+mk8aP4wtPqT5@mail.gmail.com>
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] barebox: added recipe for barebox v 2010.10
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
X-List-Received-Date: Tue, 01 Feb 2011 08:34:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Eric

I pushed your patches yesterday :
> http://cgit.openembedded.net/cgit.cgi/openembedded/log/
>
> Thank you. There is one missing file "
http://permalink.gmane.org/gmane.comp.handhelds.openembedded/42041" which
seems to disappear by my mistake. That file should be merged in single patch
with previous one as Petr said (and it was not because i thought that my
arguing with git will not be conclusive enough).

I will post missing commit today as "patch v5". I'm sorry for troubles.

Best regards,
Marek

