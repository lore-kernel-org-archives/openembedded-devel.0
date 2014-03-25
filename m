Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3FAA56BB8C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 11:37:39 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q9so775656ykb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 04:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=tLF/Op+jW4e8KDJL60gM2Osmb69a8artAraGFXe6fp8=;
	b=SLbng91VlsEww3f5A6hdsSOOw+3vxrVdyL2GIAgPzW9IIqB5T3cfZHYdfBQPOu5/uw
	HsYI3qtag//2KHGGzOQJam/pMb05IAEKI7S8WItTwUrUD21d+5H7Jpj8z5lidmlZgJNl
	Q9V/AbNVh/BvDTtVUmdm2pdh2rhQ5uIJb0u+/8YgagHYCGogX5VKM3dohuPi9Ts+sNjV
	kA41hUoWJAxGdWdAUlI8zSDrWNBCOgeU1BrhLrtxbygfDiCkU6D6x5U4cvvnfralqxYR
	i2UfSjdQwTJGMd/GJP1BPoJyyYNJxk7Dzf4/aOyEdEQoHkdcxGXYxHOGaSqpso1W7g04
	22Xw==
MIME-Version: 1.0
X-Received: by 10.236.46.5 with SMTP id q5mr72911045yhb.21.1395747460036; Tue,
	25 Mar 2014 04:37:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 25 Mar 2014 04:37:39 -0700 (PDT)
In-Reply-To: <lgrmjl$edf$1@ger.gmane.org>
References: <1395672589-29305-1-git-send-email-otavio@ossystems.com.br>
	<lgrmjl$edf$1@ger.gmane.org>
Date: Tue, 25 Mar 2014 08:37:39 -0300
X-Google-Sender-Auth: ipNtJHdEDXybRF7TGB04DSsiqig
Message-ID: <CAP9ODKoDYKJzoUYgEy7Lm_cbTkb9wQQ1eLrdnx39jTcZMMgYaA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gnome-desktop3 : Updated to 3.4.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Mar 2014 11:37:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 25, 2014 at 7:43 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Otavio Salvador schreef op 24-03-14 15:49:
>> From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>>
>> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> ---
>> .../{gnome-desktop3_3.0.2.bb => gnome-desktop3_3.4.2.bb}             | 5
>> +++-- 1 file changed, 3 insertions(+), 2 deletions(-) rename
>> meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.0.2.bb =>
>> gnome-desktop3_3.4.2.bb} (81%)
>>
>> diff --git
>> a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
>> b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb
>> similarity index 81% rename from
>> meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb rename to
>> meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb index
>> 16f1c60..a99bb7a 100644 ---
>> a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb +++
>> b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb @@ -7,10
>> +7,11 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \ PR = "r2"
>
> Please drop PR when updating to a new PV

Oh, good catch. I will do it and send v2.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

