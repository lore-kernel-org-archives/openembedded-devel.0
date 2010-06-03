Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OKITL-0000Hl-9E
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 00:01:12 +0200
Received: by yxe42 with SMTP id 42so300706yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 14:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ASEbg/IWlW2m3Uvs5ROHFPy3WxcjbNDefXVaDVhH638=;
	b=xHAcFPQgYOqjmunSEuy1sN8Ag5ZIbSq150VVhLaqBMZm6BT2KBi2sSnUvvt1VDzqra
	nWeqprZIO8Z2hb/OnTMr8pkE/jOWuyb5i3OkG08rKWfnI9EWHhaEws4TrxCM4F29bQg6
	1KwSb/TWysRuXzWgZVoN1sizNLLOYvCDFFD/o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ZY/wfVneQchpVXXxSqRYPnpoIJ95ck/eZAopsMWRpPmCtLTt+hIiDXI1LC94O4EXXQ
	FoJZaiqTWrRaBfHETPHyeMsu3hpHYkhSXKtEAWuAyvzEX6pVB2R9pNTduLzYG84RtXaI
	RJRtgHeh10wP+YQBO16Zahu9mu3ABmqS3DYwc=
MIME-Version: 1.0
Received: by 10.100.246.28 with SMTP id t28mr11362620anh.122.1275602209502; 
	Thu, 03 Jun 2010 14:56:49 -0700 (PDT)
Received: by 10.100.232.16 with HTTP; Thu, 3 Jun 2010 14:56:49 -0700 (PDT)
In-Reply-To: <AANLkTimkddVJqU15C0NqsM5L3zPVvgfX5sZo4hXU6385@mail.gmail.com>
References: <AANLkTimkddVJqU15C0NqsM5L3zPVvgfX5sZo4hXU6385@mail.gmail.com>
Date: Thu, 3 Jun 2010 23:56:49 +0200
Message-ID: <AANLkTilz8asaVog9NrNqJaJyh0egkO4OxLtLmuxbFkqM@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: psplash vs. psplash-$DISTRO
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
X-List-Received-Date: Thu, 03 Jun 2010 22:01:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

FWIW here is the missing warning:

On Thu, Jun 3, 2010 at 11:54 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Hello,
>
> building console-image for minimal distro I receive the following warning:
>

ERROR: Multiple .bb files are due to be built which each provide
virtual/psplash (/oe/openembedded/recipes/psplash/psplash_svn.bb
/oe/openembedded/recipes/psplash/psplash-angstrom_svn.bb).

Sorry...

Andrea


