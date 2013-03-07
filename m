Received: from mail-oa0-f41.google.com ([209.85.219.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UDZti-000262-WE
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 13:26:12 +0100
Received: by mail-oa0-f41.google.com with SMTP id i10so458757oag.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 04:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=hlLh2dOr3DUcCWaRFkfqsy3tMF6YdVOi1WtshsyySC0=;
	b=V0/h2VKUwDWIKU+MJx1G9ZbdaoM7odBZssgUBDkIxtEv6yIOsmZAZyqjqfVQSpsNdb
	K52JoQ1kS/W8eyBMtZyuY81BE54V9S0VcG/mJaO9Adr/QZ1WNLl+59SeUGZGg6CRQzRF
	eWYS3wR7XaII7peTQBkDvlF8FWWozN79wt5nOcJ5bZPdvEgxgS+pnFIbXQ8T9vK9unMq
	26u3za6MJcF5xrE8pWFhg/LabEZ0iXspKek1dZWyml7bxxpN65JBiTBd5FofDwfKYIp0
	X/Tf7uYvhQD/KmlPocIOVmrtxsHNK2T1PXYMQ6AfTyBiXafkBg5shqIlcQ1eZK2D06mX
	viFQ==
MIME-Version: 1.0
X-Received: by 10.60.19.101 with SMTP id d5mr24815259oee.115.1362658178565;
	Thu, 07 Mar 2013 04:09:38 -0800 (PST)
Received: by 10.60.76.199 with HTTP; Thu, 7 Mar 2013 04:09:38 -0800 (PST)
In-Reply-To: <1362649839-9160-3-git-send-email-koen@dominion.thruhere.net>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<1362649839-9160-3-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 7 Mar 2013 13:09:38 +0100
Message-ID: <CAGiJk9fvW_5jNScu23YvC81i-R481ykNMRaj8aHM92etym8m1g@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Thu, 07 Mar 2013 12:26:12 -0000
Content-Type: text/plain; charset=UTF-8

2013/3/7 Koen Kooi <koen@dominion.thruhere.net>:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/README b/README
> index 0635e10..cab1e21 100644
> --- a/README
> +++ b/README
> @@ -10,7 +10,7 @@ Samuel Stirtzel <s.stirtzel@googlemail.com>
>  Contributors:
>  Copyright 2012 - Kai Kang
>  Copyright 2013 - Khem Raj
> -Copyright 2012 - Koen Kooi
> +Copyright 2012, 2013 - Koen Kooi
>  Copyright 2012 - Robert Yang
>  Copyright 2011, 2012 - Samuel Stirtzel
>
> --
> 1.8.1.4
>

Thanks for your patches,
I applied them all.


Unrelated to your patches:
There are some upcoming changes, but they don't fit into yocto 1.4
(assumed that yocto is the orientation point for third-party OE-layer
releases).
So there will be a yocto-1.4 branch in advance and the development
will continue on master.

Hopefully meta-angstrom + meta-oe + oe-core + <bsp-layer> is a
supported use case in yocto ...

-- 
Regards
Samuel


