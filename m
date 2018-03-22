Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id C470E78932
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 20:56:14 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id y15-v6so239142ybb.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 13:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WJxPLVXvcHYf1Z5OnSheWBgA4j1Zkeu3gQSW1FbT1hA=;
	b=r/iVEIQTeyP5LgXrGy4CJ/4GV6w0+/BCOV7VP7+mGEdLNQIwqOuEGoziF7dArdVK+o
	UcRQh2Q8qmol1QULKSV/E1A8j2Z122py4wZQ9/j0FVeJ7EZ4bMVcj9Wof5srRMzcFd8k
	luOn91YOjMRVAk3+d0SkFWxgRYPYYqGvkqT2CwhLkjIw6Tot426emiUdkU3c2PJh0ee0
	WUC+GcQMWnEh8RD8s2cdBCrhbWF0v5qYpDicSkPCLmO8/sV60M47BSKnlr3wDdZQVg1r
	5r/9SsdaMmdN/3rhT4Sj2j9wcf3314cJ4XC2JFUbMZe5nQ39lmW1KJRFFK33aXXQKmlF
	vqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WJxPLVXvcHYf1Z5OnSheWBgA4j1Zkeu3gQSW1FbT1hA=;
	b=EiOSO8jAUroOATCmCjSGbH3nLn+SkYqgsvlXiJZXFmO87QZyQ9BWeFLDBf/9sb1/yV
	7MsMSH7xoqhdEqMyxYC1k1t3Zg23NM8oDr3S1SZJK07X6KdYpvSTmqGiUieOEa8xKMi4
	sqPoxsXkUr8FJXALarAixuvuBZ3Knd0ydPHjhfGJHoTNp5D7Upy9/7PHOa6crRPYMPSy
	CECkhgQQJnGUCdpwjacoaTefYUcAb62Dfn8FPNyi743BQsvCk67q4h5sdPj1dnf3DiFO
	z9bgkOX2a6J8yHpWScBK8jMoheR7L4kIotKDhF9j0lGqPDwgLzvfv9PZ7e2boc8V2Bcm
	pu5A==
X-Gm-Message-State: AElRT7HiyxnjxcWZAUYcCLZu4sKgnMlSMBvpKFf1kaH7WQFPq6CyRJGf
	DkmYns3+zM/WNfsFzQBrNgf8sa3X1SBAXhrLaMI=
X-Google-Smtp-Source: AG47ELs+YgM3wtDcFdrG27bjhO+BLrrvbjQ6ZOQolDuJuw2zQleA35fAB3AIfQyijEHxfopTALIPcWirH8mEg5xF+t0=
X-Received: by 2002:a25:d388:: with SMTP id
	e130-v6mr3608382ybf.224.1521752175778; 
	Thu, 22 Mar 2018 13:56:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 13:56:15
	-0700 (PDT)
In-Reply-To: <CAC-M0MLwD3emQxMPXN+WiowJrPyjveWN01JjeLPeEB58iAVwQQ@mail.gmail.com>
References: <CAC-M0MLwD3emQxMPXN+WiowJrPyjveWN01JjeLPeEB58iAVwQQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 22 Mar 2018 21:56:15 +0100
Message-ID: <CALbNGRRXdaiT8JhW0wvPWogbP1QY=ODk-q0kzpgzqhVm67h7Wg@mail.gmail.com>
To: hunter hu <hunterhu.ca@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-xfce and meta-browser
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2018 20:56:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 22, 2018 at 9:46 PM, hunter hu <hunterhu.ca@gmail.com> wrote:
> Hi,
>
> I am entering the exciting world of Yocto project, and trying to build a
> xfce based image with chromium browser support.
>
> After enabling meta-browser layer and building it, I am expecting the
> chromium browser would be included in the final core-image-minimal-xfce
> image, but it is not.
>
> I also tested the same with core-image-sato, and the chromium browser is
> indeeded included in final core-image-sato image.
>
> What makes the difference between core-image-sato and
> core-image-minimal-xfce images? how do I make core-image-minimal-xfce
> include chromium browser?
>
> Thanks in advance for your insight,
> Hunter
Chromium has to be added to the recipe you create your image with e.g
add 'chromium-x11' to core-image-minimal-xfce.bb - or create your own
recipe. As the name says core-image-minimal-xfce is a minimum
xfce-desktop. As far as I can remember it was created for test purpose
(I never used it to be honest).

Andreas

