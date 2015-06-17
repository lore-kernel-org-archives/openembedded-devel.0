Return-Path: <ashcharles@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 10EB87573C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 00:12:30 +0000 (UTC)
Received: by iebmu5 with SMTP id mu5so23738069ieb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 17:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=40q2dhSsh2t517ZNaKPYHpLDtLyxg6pYfaThXw/ul2w=;
	b=MZI2DiypOk1tNMbIbV16lmfLjasHnUyQf66uynZJnRWBJTMd4MFlVu8ozwriw/NPUV
	4RJ8polY5u6/5q+w9uBb4+wyma29QPJHUwGMCKJdAKHcKNftZ6PZHHaalpGfWU3PXo0m
	MCj8EJnInnmiVV+qzo/k6MQHup9zZOGkVUifjT0t2AziQie+9EmrweAyXO5VyglVhidm
	oTbFiyms11CX2LMiIKBT6o2MBHPpRIteWT13LTpiHLGIAF+Ng8mztLxCBAGv0N+zH24F
	kg9W3a+AWpIeoPVmGiVHM3NIev9pY5rPZ8KQZ+cxLZbgkUFcNdRCWxnyWCzY7zkSj1B9
	VpJg==
X-Received: by 10.107.31.134 with SMTP id f128mr4012456iof.19.1434499951758;
	Tue, 16 Jun 2015 17:12:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.78 with HTTP; Tue, 16 Jun 2015 17:12:01 -0700 (PDT)
In-Reply-To: <CAMKF1sqOe8AN3f1ELc2sdiYTqWscpLx3k62Vv8Hek+vJoPZiKw@mail.gmail.com>
References: <1430883943-30031-1-git-send-email-raj.khem@gmail.com>
	<CAK8F28m=ZQLXUgNHZ8P8Fm6Bt55KApbO8YETf2AjyQzafcHnTQ@mail.gmail.com>
	<CAK8F28=gpkoBJcwdPjwyG8VfSsMt60q5VGdFses+HNbVmv40JA@mail.gmail.com>
	<CAMKF1sqOe8AN3f1ELc2sdiYTqWscpLx3k62Vv8Hek+vJoPZiKw@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 16 Jun 2015 17:12:01 -0700
Message-ID: <CAK8F28mqMb2xvYmLC02c-h5vHgHdoUzgs7yS2ofJq53G9VaHgQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH V2 2/8] polkit-gnome: Upgrade 0.102 -> 0.105
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
X-List-Received-Date: Wed, 17 Jun 2015 00:12:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 12, 2015 at 3:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Its really case by case. If you give a good enough reason and even
> better propose a tested backported patch for appropriate branch
> then send it with [branchname] in subject. It will happen quicker.
Cool---thanks for the explanation!  I've cherry-picked these two
patches to my fido checkout, tested and sent out the patch mail so
hopefully this is all in order.

--Ash

