Received: from [209.85.219.223] (helo=mail-ew0-f223.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1MRmfK-0002Jh-1q
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jul 2009 14:35:54 +0200
Received: by ewy23 with SMTP id 23so803011ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2009 05:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bPwcwcKL8H+ZrBT1ux9RkTlCq1coZ6FpIyesMmCESAo=;
	b=NDpaYKc3FQsurCOwgYMhbO23D1Fkw6QbTvezd8cDWa/U1OF7hibwj5jikoBf5ifeQr
	7Xy6T1JjE65b0I2hNgLe1s9piKITjf5RVGTgZoZWLMDrASlY4RfRZdf6xv12jfsMVEL9
	5SpR+3c/BTH8UsaPrz+KoPeOMfsiYapOi2Q4I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DOfFryhWSEJh0qsj8xJtSqZ7EZ8eMQHKi8z7tdg/gaXwvTzBkIzRwrou2Mit7KQ1Tx
	C7ibrsQ7NsSM6e1tyLGLr2ECvBPNUQlyn4vYRvRSxP+YStEB5FS4N0KkMZSul2iby+Id
	n7ep1WXR6bGdqT6HLeeWYoF6gIa3p0DThoIuk=
MIME-Version: 1.0
Received: by 10.216.13.194 with SMTP id b44mr289687web.139.1247833334627; Fri, 
	17 Jul 2009 05:22:14 -0700 (PDT)
In-Reply-To: <1247829612-9310-1-git-send-email-khimov@altell.ru>
References: <1247829612-9310-1-git-send-email-khimov@altell.ru>
Date: Fri, 17 Jul 2009 14:22:14 +0200
Message-ID: <d1b08f940907170522k35cc3024q11647beb4fa45f1c@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] package.bbclass: introduce KEEP_GNU_DEBUGLINK
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
X-List-Received-Date: Fri, 17 Jul 2009 12:35:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ah, that's explain the different checksums then...
Nice catch, thx.

BTW Gentoo offers the interesting "splitdebug" option see:
http://www.gentoo.org/proj/en/qa/backtraces.xml

Regards
Andrea


