Return-Path: <rcagley@gmail.com>
Received: from mail-yh0-f43.google.com (unknown [209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id ECF7A65D0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 18:26:31 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id v1so2026420yhn.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 11:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=SUqBO3VdPFUJbW5bLC4WzttmP8EgNRji1UYD8QSXh/I=;
	b=rm2nXtk/Uxo52A2Ers9+G+Sx9ziYE66717icUbj2+GVKb8ks7px6gKUC+fsWRx9/pu
	wIQ3zxxj2VfmUW6a0D/Qs1+cbqFZ9GA3Vy/c2z7F4tX23utOGmReL8UOrImD1Dcmmdaz
	Bvmea4lCaS8du7CdUAvejhl5BskNcG/oPxu7wE1vToRWXp7rI2EwgaqEhiMGrwU9Zs+6
	t8kXOPnsRbN+Dh6JtIcuzcLZDMoDhImz91DP9x0TPeTMtI8yBZsyMBQMRc3n5r5d2DPm
	GQaiasIBPq8ShnrLMF7fgAbKuNwtpcrTPxDQ8jSqLYY70gYxqa+Q3bdcnFi3qu9aV91u
	Xh4g==
MIME-Version: 1.0
X-Received: by 10.236.147.232 with SMTP id t68mr29168831yhj.127.1400696792173; 
	Wed, 21 May 2014 11:26:32 -0700 (PDT)
Received: by 10.170.110.8 with HTTP; Wed, 21 May 2014 11:26:32 -0700 (PDT)
Date: Wed, 21 May 2014 11:26:32 -0700
Message-ID: <CAN-NoH3tU4wfadSOS4F78DQrqar9sHz_3Ecf49ENEog=P06=MQ@mail.gmail.com>
From: Richard Cagley <rcagley@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: how to create a new layer
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
X-List-Received-Date: Wed, 21 May 2014 18:26:32 -0000
Content-Type: text/plain; charset=UTF-8

I'd like to create a new machine that inherits from an existing
machine. What's the easiest way to do this?

Looking through the yocto documentation I see "yocot-bsp create" but I
don't seem to have that executable. Do I need to use this or is there
an alternate method?

