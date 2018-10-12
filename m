Return-Path: <dachaac@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id BDCB179BCD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 17:52:27 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id z21-v6so12111615ljz.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 10:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=TMre8HU28Dau0dNZbIDZWN/JZdVMsoG7bUs6U9mZYa8=;
	b=ln6llohKTWfnhzCP9D4krEVLLq694/Hfb37OmqX4mxMz3mKHcEwN8NrwsDuPgsB0lb
	L0g2QJka1XzBEX5m7DaTxVjGHBLgBevrp6gztuTiVFZyoqABDxNKQ6t5khJqW6/hPNKq
	bLinQQZGwJgtzAcDP+VzZFONPAC9nXfHCl7g1R/jL6p+9v3XYnPYcHuRks7mMJfL7cPK
	nKgg3GvGgyNTtc+wvINkgLb7I72C9EYAt3tRR1U1YQ9KjvinseH/mkgN/Hk8+W5jXZbv
	+Nhq64Qk/pzMn7+l4uDUkIya1c2ZTc/BB7y7fkAfIPJGNIsnu2Y/I4gZ75Eeq3BdbrxO
	MYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=TMre8HU28Dau0dNZbIDZWN/JZdVMsoG7bUs6U9mZYa8=;
	b=fxdD3nG+yY7izECFCX+yHdJugmw+iVe2IoUvNAYaTq2hUai3Uv523KXzf2Ex/bBpOb
	UTn7HqrKVWUH4lt0Wnbtv8yofQcG7l9SuCYbHT9BMcTd8ghMKmJ/x9/z7NjA+ulNxsjf
	wxTfxm0/rZ/O4bUZwCZNwk0QbR59HhEv9B4rHX83CyRp3LopItTEF8fQMJBOnVX0OWxy
	Avct+DikxtwkwSMXPjSal0RKKyASpvbPgrgt4QmZmtjpMtGSevMG+8YON1LuNDB0IVed
	O9SDEQlhHTNkwd7ekw8pH+lta/L7/p59bmNImAjJxrzp080QhNSYg+sIb1zoGTpEaARd
	5ASA==
X-Gm-Message-State: ABuFfogOYwsta3J6T6S8ARzy/FLOT+sWH0MIF866g7o2o7Zn163i5/5Y
	y2g/pPtHhmHsgkwIb0sCsKPXFod4
X-Google-Smtp-Source: ACcGV60ocdk1y4s82bAywCph2kSmaTXqaEgDevdc5Wb4Wn26eT4Px33kkn5PDtzv8CjlVD+kTI7bBQ==
X-Received: by 2002:a2e:8ec6:: with SMTP id
	e6-v6mr4115832ljl.166.1539366747832; 
	Fri, 12 Oct 2018 10:52:27 -0700 (PDT)
Received: from ?IPv6:2001:14ba:8017:3300:685a:e65d:93a9:5922?
	(dtynxhydknnxg7f9lnfvy-3.rev.dnainternet.fi.
	[2001:14ba:8017:3300:685a:e65d:93a9:5922])
	by smtp.googlemail.com with ESMTPSA id
	k19-v6sm397019lfi.51.2018.10.12.10.52.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 10:52:26 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
	<1539357981-3675-2-git-send-email-akuster808@gmail.com>
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Message-ID: <0256528b-d1aa-75f2-f660-b5e37fddecf3@gmail.com>
Date: Fri, 12 Oct 2018 20:52:26 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1539357981-3675-2-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-oe][PATCH 1/5] directfb: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Oct 2018 17:52:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 12/10/2018 18.26, Armin Kuster wrote:

> package has depends on vlc and gtk
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   meta-oe/recipes-graphics/directfb/directfb.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
> index 96aa311..cf8f19a 100644
> --- a/meta-oe/recipes-graphics/directfb/directfb.inc
> +++ b/meta-oe/recipes-graphics/directfb/directfb.inc
> @@ -32,7 +32,8 @@ LDFLAGS_append_arm = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -f
>   
>   BINCONFIG = "${bindir}/directfb-config"
>   
> -inherit autotools binconfig-disabled pkgconfig
> +inherit autotools binconfig-disabled pkgconfig distro_features_check
> +REQUIRED_DISTRO_FEATURES = "x11"
>   
Wrong method?

Quote from:
https://github.com/DirectFB/directfb

"Optionally, depending on the configuration you want:

    FBDev
      - Linux kernel 2.2.x or newer with working frame buffer device
        (check /proc/fb) for the fbdev system.

    SDL
      - libSDL (Simple Direct Media Layer) for the sdl system.

    X11
      - libX11 (X11 client library) for the X11 system (libx11-dev and libxext-dev packages)."


