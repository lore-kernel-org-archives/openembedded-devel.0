Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q7t7r-0000ps-5N
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 19:36:11 +0200
Received: by wwb17 with SMTP id 17so2930658wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 10:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=9ycvEhzgZxljHL0iJh2it97+3tAZrUMSgWdEZ8VvaVc=;
	b=p4GiDyFVOvoYIbTkMs4lY55X4VkSga4ZG/KYMumSB5uB06rNEW785duUl5yf/KuLdO
	d3sAqrCVoHWghpNG/JQPuMHFFuNsEiUMcYl/EOk60lQxwWogQLKvtyrVadjLGgCfUm6u
	Q5574gXN/OreZm7TIKJpuJ39R01UeHE6Mb8Ho=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=wUKNQTD3Z+8xHh12zmaKTEvMxhO3CHEEX7skHVIxG31s/fnQ4oGf1mXp91MzT4USC2
	Dn7BBCJncOGNJ8jJBo0xlWmYkEc96O1FyLHDswm8+2g7RqErHCKioVZXV2I9kVzfVEjt
	+Fro6hH0kRtdjg8ayHfynqPFBhnVIXeyqPrgU=
MIME-Version: 1.0
Received: by 10.227.208.136 with SMTP id gc8mr1248781wbb.37.1302197642604;
	Thu, 07 Apr 2011 10:34:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.46.207 with HTTP; Thu, 7 Apr 2011 10:34:02 -0700 (PDT)
In-Reply-To: <1302197239.14449.446.camel@phil-desktop>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-4-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-5-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-6-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-7-git-send-email-otavio@ossystems.com.br>
	<1302197239.14449.446.camel@phil-desktop>
Date: Thu, 7 Apr 2011 14:34:02 -0300
X-Google-Sender-Auth: mmvov3ybhJrEwXnWXbmlbVkcdvw
Message-ID: <BANLkTikWf8o_Cko4V4ya6xhPbD-bWdxz-w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 6/6] freerdp: update version to 2009-03-29 snapshot
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
X-List-Received-Date: Thu, 07 Apr 2011 17:36:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 7, 2011 at 14:27, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2011-04-07 at 13:19 +0000, Otavio Salvador wrote:
>> -# Copyright (C) 2010, O.S. Systems Software Ltda. All Rights Reserved
>> +# Copyright (C) 2010, 2011, O.S. Systems Software Ltda. All Rights Rese=
rved
>> =A0# Released under the MIT license
>
> Not a comment on this patch as such, but a meta-comment on the recipe:
> does it really make sense to state "all rights reserved" in this
> context?

Not a big deal to us; dropped it.

Will resend it after end of review.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


