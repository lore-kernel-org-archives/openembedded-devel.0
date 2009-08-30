Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Mhqfj-0008T6-2C
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 22:06:43 +0200
Received: by bwz6 with SMTP id 6so1417168bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2009 12:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ll65C8BzHnEZtE/wI4VtInsOV4wec3GhSM4zPKtf18Q=;
	b=ijVE5Tjj67LIsArBSi0wVqBQKc/U5fXmD00UITRSFNOhXsroY2QFWwGDDXNuubFvMg
	U/KRQ4HWfGKxlsuYNWf/MTE1AGgQWeWSuYk20K394ZCGnqfESj12SLSmHFg6582ISl3V
	OPYclW0U/tJNOXp0sj/WrL3SzIaG1F2D3cUY8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=b2crqoEbZ+XoPC+6gdjpDGbzN0DFfllaqcq6eCEXX4xzXaHlVueLRA2id/b97/6tUV
	hzM8ADhJlYvlvDIw6dpWjNImSYFke0gAd+/9TROyA1dt19HfoT+vZL8iEJDRfjagrTAA
	tRcxONC3ro3U7W3sXouPHSdNSiZpP1KDAu6nM=
MIME-Version: 1.0
Received: by 10.239.163.199 with SMTP id q7mr361426hbd.29.1251661695541; Sun, 
	30 Aug 2009 12:48:15 -0700 (PDT)
In-Reply-To: <1251594936-4909-1-git-send-email-raj.khem@gmail.com>
References: <1251594936-4909-1-git-send-email-raj.khem@gmail.com>
Date: Sun, 30 Aug 2009 21:48:15 +0200
Message-ID: <c384c5ea0908301248j9299b3co899d86b475d61fac@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] micro.conf: Remove PREFERRED_PROVIDER_virtual/libintl
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
X-List-Received-Date: Sun, 30 Aug 2009 20:06:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Aug 30, 2009 at 3:15 AM, Khem Raj<raj.khem@gmail.com> wrote:
> This is set appropriately in toolchain configuration.
> It gives a possibility to cleanly override LIBC
> say to eglibc or glibc.
>
Acked-by: Leon Woestenberg <leon@sidebranch.com>

-- 
Leon


