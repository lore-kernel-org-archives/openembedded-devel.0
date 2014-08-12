Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 63E1570C27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:44:42 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id c41so7385242yho.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 05:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=fFLVQPTjBusFClfNynI7C2s3eBYnPlSfQYL/QRTW13c=;
	b=yXAxEP2UP8eM/rEnN3MUrVn6sXOA7Q1PihpNuZJWQ9kIhDvcenPNAF8GhNf08ybZiT
	PfYnqcKUlUILd11k0rOzTP7ZIyiC8v9u2zHCxLuqPVLyLcO4TrXKT2bRUX58Ke/m5MRb
	MGBkj5IYLRq6eDMeUtAKCkdA7SLXrnBVP30A7QPKl7ZKkqb97rWsTzcqYDvDOImjqIER
	m5AjsZ2nkbb/Z8h5a1aj9TUJsF69LHrxJ/u9YbFneyHsSq6MVT3vppQ0m7FONtJ7xo6r
	gtX7P6/GPI9CW7K/bML3t4r7g7DvA81ZHiUM7MbX/EGD7qtRLHUztmE4Dd2INnOtG3bG
	7Pqw==
MIME-Version: 1.0
X-Received: by 10.236.31.135 with SMTP id m7mr53945651yha.104.1407847484093;
	Tue, 12 Aug 2014 05:44:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Tue, 12 Aug 2014 05:44:44 -0700 (PDT)
In-Reply-To: <cover.1407846175.git.Martin.Jansa@gmail.com>
References: <cover.1407846175.git.Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 09:44:44 -0300
X-Google-Sender-Auth: RtKBrQyJng6mJs3x2zkCmAK03yc
Message-ID: <CAP9ODKoypiVSqwgCwWO4h9UFoQSSY12UYvXgWc2A2727FuhMVg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [daisy][PATCH 0/5] small build fixes for daisy
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
X-List-Received-Date: Tue, 12 Aug 2014 12:44:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 12, 2014 at 9:25 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Martin Jansa (5):
>   sethdlc: Set MACHINE_ARCH, because of virtual/kernel dependency
>   ktap: Set MACHINE_ARCH because of ktap-module runtime dependency
>   glmark2: Add virtual/libx11 dependency
>   irssi: add --with-ncurses option
>   libgc: add PACKAGECONFIG for libatomic-ops

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

