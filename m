Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8032560424
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jun 2014 21:36:58 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id b6so4361301yha.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jun 2014 14:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=ATF3YmGOWDoEJqBkK3o4opdA51u3wCrRz3aBYTTc6r8=;
	b=fqaxzn36WqZW+XdvbEGpKIei+s+mjXEkXdzV2eYpc4iDl2009JhkRO6P9cvFNOD95J
	Kox3UwwE1/+NR9Lg8O2hZd/n4sT5DLzPXf4S9LT7MzfHODW/28roMm3f42s0Cgbm6HZ9
	ins38p99K7SwA2dzCmiWMC3duKH+NgqeyQo1ADLpNiI+TqNoDO3pSMhqa69gI8tXqEYl
	aAKrqwliPN/d7ezyuVVjrBEvjwBsFVd/qZcKjHPD6SG07xUVBgf961uC7ZJj+1ck3E0c
	2tiTBb0aZ9SygC8y1u/Px1WGfzQn4ywPMQiAz71eKGWhYMuaEMVCsV2Gp7m1XW9UH6tE
	7gQA==
MIME-Version: 1.0
X-Received: by 10.236.129.227 with SMTP id h63mr7333991yhi.148.1401745019197; 
	Mon, 02 Jun 2014 14:36:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Mon, 2 Jun 2014 14:36:59 -0700 (PDT)
In-Reply-To: <1401743690-25537-1-git-send-email-eduardo@monkey.io>
References: <1401743690-25537-1-git-send-email-eduardo@monkey.io>
Date: Mon, 2 Jun 2014 18:36:59 -0300
X-Google-Sender-Auth: RdBFiHjWP1_vkacJtnjQvqqYalI
Message-ID: <CAP9ODKodoVzhPpXwER9yHSSxm4o3AvepirusL56EV6PY5OFSiw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-webserver]: add Monkey HTTP Server.
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
X-List-Received-Date: Mon, 02 Jun 2014 21:37:07 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 2, 2014 at 6:14 PM, Eduardo Silva <eduardo@monkey.io> wrote:
> This patch add the initial recipe for Monkey HTTP Server v1.5.0.
>
> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
...
> +             --datadir=/var/www/monkey/ \
...
> +FILES_${PN} += "/www"

Does not match. Is it right?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

