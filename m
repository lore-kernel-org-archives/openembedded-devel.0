Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 71B3A6C1BE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 09:39:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45xHps6W9Mz4M;
	Sun, 28 Jul 2019 11:39:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564306790;
	bh=xSW+6KmW4/lb6CeQTk3x8aHitgZF/1EHQPHqcmEGvk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dzXoGOmFkrkzwGUtNxq05LxJMv/zlIYQt/sMt/fEv+dTc+U1MsVSCDHh6DAs3R2uP
	eFe8TdhysBtCrx8DyXfPkound+QavCkSPg5ACAy6jckwNFjDjXzALqcWIjH5g2zaZi
	HyWhNQMNzkGZ6nEKwo0sl5uCHYlj9izBxAdSc/uRVP5cFrOzLCfGurcqv2qUCFStza
	ls6X8O9dQVHldwrw4f+zhfn0aHgXb+mSOWBkasUmd4/RppaPTFACxDs4tMeQQGtUuB
	6hwd4+HvKCr9F6pjzEaa9UIT3JIy/H4iTDRLDxPj7clFRg0TJp3odWf18H/6jCUvLA
	S+IMsVdEbKBPVpjP2N7UYXW3c+ozIp3i4U1lHGpw94G3ZS0AmqFXUeqxOfHqW78ajf
	YY4GLd7zkNYT4Sh+mWaQ5a1YZps69xrgyXY/Fld0iKv9YdJjowapBZSICZZEhvjSLw
	Ub+YTl7Z8nUMpxgvPqIu5wLOd/lX/msJBSPx/AT9PIvX9EqMATQywzWYHPni35uqdg
	y0wUdxVJQPWjqNmt1moWRn/A7B7Wc6mhEKeaQNIPf/dmtHVO74OjquY8Nco7Uf+xMp
	r11O3nSmUqhm5mBx0kPlR8SjOWCQGEgTzRVdXbEH0HjYi+x2795D80DKvjveqmPAPa
	tZJn2yy1/TwLNJgAhbrwZfL4=
Date: Sun, 28 Jul 2019 12:39:47 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Message-ID: <20190728093947.GC15666@localhost>
References: <20190727142628.6417-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190727142628.6417-1-Randy.MacLeod@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] poppler: update from 0.75.0 to 0.79.0
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
X-List-Received-Date: Sun, 28 Jul 2019 09:39:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Jul 27, 2019 at 10:26:28AM -0400, Randy MacLeod wrote:
>...
> Drop 0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
> since that was done upstream in:
>    9481c473 glib: pass poppler to gir libs.
>...
>  .../poppler/poppler/basename-include.patch    | 31 +++++++++++++------
>  .../{poppler_0.75.0.bb => poppler_0.79.0.bb}  |  5 ++-
>  2 files changed, 23 insertions(+), 13 deletions(-)
>  rename meta-oe/recipes-support/poppler/{poppler_0.75.0.bb => poppler_0.79.0.bb} (91%)
>...

The dropped patch is not removed.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


