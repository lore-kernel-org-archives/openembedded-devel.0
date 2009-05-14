Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1M4YfC-0002EQ-Ig
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 12:59:46 +0200
Received: by ewy20 with SMTP id 20so1408350ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2009 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mdrdJM3PJb0fqcaUylXmjYLw16jJyGnyEX4kYnBsx3E=;
	b=TIX2w7lnG0vos9AU8VszToJ+2gOf1EyvcqBXW9RpilHjcAAlpG+gUmMc/AdnE8RBI4
	3S3GAlLICgEvTfg03nYK+nfYo7nULyUrBTRZk3l8GtPYiIgeioTWPRc2qpG9TCN8U/dI
	x++6hxFsaxreKsOWA+ZG+kqBZlgsH0X8PhDLg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jnE7Bq69SzT1QnekUSDMwgvE0zpVa/AlFpqrNEcHt36qpLplzG7VKdayTl02BT79w0
	7G8rXbut6zh2HbItkmcNV4lrpoCKcmrYLiU2RQt7iw8YRIzUHb2Zdi+a3FW/b8ENJZiz
	rrz6UzGvuooKjqaPWK5phrSGbJ1W68jQvmrwg=
MIME-Version: 1.0
Received: by 10.210.10.8 with SMTP id 8mr1708453ebj.87.1242298374919; Thu, 14 
	May 2009 03:52:54 -0700 (PDT)
In-Reply-To: <20090513152443.E8DE11893A9@amethyst.openembedded.net>
References: <20090513152443.E8DE11893A9@amethyst.openembedded.net>
Date: Thu, 14 May 2009 14:52:54 +0400
Message-ID: <48239d390905140352k60f3c63crd2337be420d63bef@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : angstrom 2009.X: toolchain updates:
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
X-List-Received-Date: Thu, 14 May 2009 10:59:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi, all!

On Wed, May 13, 2009 at 7:24 PM, GIT User account
<git@amethyst.openembedded.net> wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 448b9103e494765fe589283d399c90e9b6e9cd84
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=448b9103e494765fe589283d399c90e9b6e9cd84
>
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Wed May 13 13:36:43 2009 +0200
>
> angstrom 2009.X: toolchain updates:
>  * make gcc 4.3.3 the default compiler (except for ppc and avr32)
>  * make binutils 2.18 the default (except for armv7a and avr32)
>  * disable thumb for armv4t/5te since there's no gcc/binutils combo that works 100% with thumb
Could I have some details please regarding thumb?
I remember there was a discussion regarding enabling thumb. Then we
have silent rollback.
Do I miss something?

All the best,
S.


