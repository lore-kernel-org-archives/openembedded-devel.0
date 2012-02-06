Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1RuQv4-0004GC-Kd; Mon, 06 Feb 2012 16:55:54 +0100
Received: by eaal10 with SMTP id l10so1660209eaa.6
	for <multiple recipients>; Mon, 06 Feb 2012 07:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=JXtBzo0TCXH0TTonNgD/KC59wUFvM6lwMEfWT8WCOLE=;
	b=drGWjtapsUToeUWUQ6BgzPvHSYpRIPnAnZSoFaDr0jp9rsESxyqkAQw0PHm2mVABZP
	Lp1gnlpTR2YeUhxn1FtvJddTB8D7thz+E3FXfmEwDNIzkpODBEMXnIUNATgwzd6y6cwd
	dNwrO9+Pr1CaNiJ3xoESsF3gTzPziYxTtIQTc=
MIME-Version: 1.0
Received: by 10.213.3.68 with SMTP id 4mr2934194ebm.88.1328543273640; Mon, 06
	Feb 2012 07:47:53 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.47.10 with HTTP; Mon, 6 Feb 2012 07:47:52 -0800 (PST)
In-Reply-To: <1408084.uBj8QddilE@helios>
References: <CAMKF1spO-FVweKU21EdHK-Rs5gc4qun=JRYnwMWc88SOSeQufg@mail.gmail.com>
	<CAMKF1soq=EaZ4KMb7McFcEjNyTVT2sMHPHvEr11+kL603iCOUQ@mail.gmail.com>
	<1408084.uBj8QddilE@helios>
Date: Mon, 6 Feb 2012 13:47:52 -0200
X-Google-Sender-Auth: FIRVwDJjHhVDTlGMdbdxi9Le__A
Message-ID: <CAP9ODKpx9_Mc5w9aHy_k1t-L3kLw7HRmtiM9EkjpX6NvvDaFRg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Duplicate recipes in meta-oe
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
X-List-Received-Date: Mon, 06 Feb 2012 15:55:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 6, 2012 at 13:39, Paul Eggleton
<paul.eggleton@linux.intel.com>wrote:

> I talked to Koen at FOSDEM and apparently he prefers having a symlink
> rather
> than a copy for the timezone file. I can't express an opinion one way or
> another but it sounds like this one aspect still needs to be resolved -
> should
> this be selectable?
>

I don't think this is worth to be selectable.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

