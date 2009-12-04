Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NGYXu-00079V-Ob
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 14:50:10 +0100
Received: by fxm8 with SMTP id 8so1334803fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 05:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=uCkP0Bv/DNeInbsKMidplpi7TJS10GXKJsKhtYIPd4Q=;
	b=JtoQegAn1Wn0A7Meqgni9xWN+psCLL48uYPxj5vYTkeFRPvyVi695rAF+wz/HxKrgg
	o6bRBUYei7UANVi75FwO+ncl6tJltl/EcobWOE0ucxxXmT3dp35OQf8kEWgXf9qyktJD
	6hIzvFW28986dV0x+QkypuTrU5qneRKaKtolQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=sfm5qtZeGTWg0XuqyHzTQEs/W9/xk/85voDRQh6mphhl5XnFQtFvGIaQxQu6+UdhEm
	8fwZnpFP7dVN2QYQHXK0SWae+saG7j2HlC+XUkFQhxApmIck4hrUlnB4PRwKbwn1tsGf
	96SMavubVhHC2CLHnirzWMcxoTcMlk6dcG+9Q=
MIME-Version: 1.0
Received: by 10.223.15.4 with SMTP id i4mr492037faa.39.1259934509824; Fri, 04 
	Dec 2009 05:48:29 -0800 (PST)
In-Reply-To: <E1NGVGl-0006do-JZ@melo.openembedded.org>
References: <E1NGVGl-0006do-JZ@melo.openembedded.org>
Date: Fri, 4 Dec 2009 14:48:29 +0100
Message-ID: <141020e30912040548u2fec09dal9cf48622ded5adb7@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Koen Kooi : efl: bump SRCREV to fix some crashes
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
X-List-Received-Date: Fri, 04 Dec 2009 13:50:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 4, 2009 at 11:20 AM, git version control <
git@git.openembedded.org> wrote:

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: ea85fd4e1fdb1f09fd21f65e077aab2f7ccdf65e
> URL:
> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=ea85fd4e1fdb1f09fd21f65e077aab2f7ccdf65e
>
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Fri Dec  4 11:17:57 2009 +0100
>
> efl: bump SRCREV to fix some crashes
>

This patch
http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/efl1/ecore/iconv.patch
does not apply anymore, only first chunk, which should be easy to update

I'm not sure if its worth creating new patch and let old one exist with
maxrev=sth, so please someone else update that one.

Thanks

Regards,

