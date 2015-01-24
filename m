Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9C6D772D2F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jan 2015 00:50:44 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 200so306517ykr.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 16:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=lkXA0qoElAQmbQ6SpwP6aauS0tUwBWWe0d/j7wJFV2k=;
	b=UgH05wm1mYLWjicQurucJ/cPNWqlJrwFNrmopC7j3Gi/TMbrhlH01uCevcIJ3B4qbm
	V5gsclA3Y+6G0/2vTIUKxKT2EbFQCyIsREjUG7lEH1H3VL2v9iGlCpGVh1HIYpqh4Qp3
	TFSuIfOX4vpRMjYcnakgG2ckYGWzgtwce8TvWeG2LnTPpbtUsMgXwbK3IgEXC8EPzXVz
	wKSdgeW+FJ4mYU/rIYY2SXwBLbojKgVmXCCNs3BrrcM4/o6v3c8n7k/qC2f8rtQSBu3x
	T+pGCC6z7oY2Wc6YXQ9ORyFSVWnA41EVoZBsPxGxfaHaS2TFhbbmYarl/I2KAijJZZbs
	Ew2g==
MIME-Version: 1.0
X-Received: by 10.236.30.98 with SMTP id j62mr4163866yha.105.1422060645067;
	Fri, 23 Jan 2015 16:50:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Fri, 23 Jan 2015 16:50:44 -0800 (PST)
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
Date: Fri, 23 Jan 2015 22:50:44 -0200
X-Google-Sender-Auth: z6GCAFu0-x11ww5XC_uBCyskeJM
Message-ID: <CAP9ODKqxCf1pYqhEaDjHCwz4iVOb5G0n6R=s1zvNVEP4W5+iMg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/11] [Dizzy next] pull merge request
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
X-List-Received-Date: Sat, 24 Jan 2015 00:50:50 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 23, 2015 at 8:53 PM, Armin Kuster <akuster808@gmail.com> wrote:
> Please consider this changes for meta-openembedded dizzy
>
> The following changes since commit 3b83aa44186fac44a679cd24a5ae64560cb4118f:
>
>   xf86-video-glamo: fix build with xserver 1.16 (2015-01-18 16:40:55 -0800)
>
> are available in the git repository at:
>
>   git://github.com/akuster/meta-openembedded akuster/dizzy-next
>   https://github.com/akuster/meta-openembedded/tree/akuster/dizzy-next
>
> Belal, Awais (1):
>   iperf: fix out of tree configuration
>
> Jackie Huang (8):
>   meta-gnome: Add LAYERVERSION and LAYERDEPENDS
>   meta-perl: Add LAYERVERSION and LAYERDEPENDS
>   meta-python: Add LAYERVERSION and LAYERDEPENDS
>   meta-ruby: Add LAYERVERSION and LAYERDEPENDS
>   toolchain-layer: Add LAYERVERSION and LAYERDEPENDS
>   meta-efl: Add LAYERVERSION and LAYERDEPENDS
>   meta-filesystems: Add LAYERVERSION and LAYERDEPENDS
>   meta-gpe: Add LAYERVERSION and LAYERDEPENDS
>
> Otavio Salvador (1):
>   nbench-byte: Fix license QA error
>
> Qi.Chen@windriver.com (1):
>   xmlto: remove recipe as it's in OE core

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

