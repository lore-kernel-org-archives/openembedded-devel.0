Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NDhrv-0007ec-7h
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 18:11:02 +0100
Received: by fxm8 with SMTP id 8so814815fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2009 09:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=RrJx635syKnLHwqiAqOe1068DJOMXLIPgUPuocKNQZQ=;
	b=h49cV3s6nQPfnIrfLML3QUMvhdqpDnpGcpLNuNVpMCB0WTK3bWFJlo5tag9/P3fdFo
	GkmRnJ+IahGYb1ahYn1rVoGFvL/gB9qzxg9Twq3oW0ohPF0i3ajgSbjeSJ8UcTxlKVSX
	jgR/sOutPseT9JPOaq55cjeXwbkgnsdYvcVx0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PppN0LkgqpETwOvI+mFKy8HKDG0Fmh4U+kVNZOwENQSx4OoXBTypKf7wlwMocAKz+o
	Kq28A1GijH8q3tEd8o996ncS0CL9pzenxmDfp+ofwR0TPxWtSVRV9mHPk0GnuF8E36zP
	55VsEF2wxCqCGzfpE2ADUIg/XI3ziHwSN9tj8=
MIME-Version: 1.0
Received: by 10.239.144.97 with SMTP id n33mr909655hba.183.1259255368657; Thu, 
	26 Nov 2009 09:09:28 -0800 (PST)
In-Reply-To: <1258888948-28141-1-git-send-email-bernhard.kaindl@gmx.net>
References: <1258888948-28141-1-git-send-email-bernhard.kaindl@gmx.net>
Date: Thu, 26 Nov 2009 18:09:28 +0100
Message-ID: <c384c5ea0911260909x77b7f9aawab82dde209ab0ce8@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix htop do_configure: use DEPENDS="ncurses", not 	RDEPENDS="ncurses"
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
X-List-Received-Date: Thu, 26 Nov 2009 17:11:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Sun, Nov 22, 2009 at 12:22 PM, Bernhard Kaindl
<bernhard.kaindl@gmx.net> wrote:
> htop: Fix htop do_configure: Ensure that ncurses is staged
>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@gmx.net>
>
Acked-by: Leon Woestenberg <leon@sidebranch.com>

Regards,
-- 
Leon


