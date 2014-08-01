Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id C139E70960
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 12:57:36 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id a41so2517062yho.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 05:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=VLFixsFiNaAbx0U8AUDpVnn9/iLR2lEkhCpA/j/7PvU=;
	b=g332fwpjd8DSPfV2NdkhoVdvm+RNwJPhEZwbHKvphppEo9p4tS2NNRduWLtF+8nYjf
	Jfxrt/K5f1b1MXo7PKmYVTqn+qadlfLLXIqrT3JSrA3D3X5FMw8DQt+oi+u/d++qkEzq
	3ASKk3LnunJX9J9ryrlXjhuOTB9h/JiHm5NGMIn6aseUfvcETL8wtaiJlE3AYa1ian3H
	lfr8SGLRXw64uNNo0V6ftHtXxSWvz/VmNUvUBsG7GqZju6tPQTcrZxkgLoTpKj19ccaM
	4KvOCMZbSJEG02u5aMqPBlv4yoCUryNIwMjwesHRYcgVYP0gds1Mi3HZqcIhw/6OLXWT
	zOKw==
MIME-Version: 1.0
X-Received: by 10.236.129.3 with SMTP id g3mr7915760yhi.67.1406897857392; Fri,
	01 Aug 2014 05:57:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Fri, 1 Aug 2014 05:57:37 -0700 (PDT)
In-Reply-To: <1406629327-29169-2-git-send-email-dv@pseudoterminal.org>
References: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
	<1406629327-29169-2-git-send-email-dv@pseudoterminal.org>
Date: Fri, 1 Aug 2014 09:57:37 -0300
X-Google-Sender-Auth: qZ7ZO5Znt248Q20Xqwwe9Irqo9s
Message-ID: <CAP9ODKqJLQOLkbos5=oqfw+QkAyGh10irbpiN0MKBC23ejdq=g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 2/2] chromium: Add recipe for version 37.0.2062.0
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
X-List-Received-Date: Fri, 01 Aug 2014 12:57:39 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 29, 2014 at 7:22 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> This version includes Wayland support by adding ozone-wayland
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>

Applied.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

