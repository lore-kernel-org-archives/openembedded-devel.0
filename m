Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 86D476FF56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 06:35:25 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id 99so1703907lfu.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 23:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=Pgm82aiFSoMYBtdsouk7NBP8kMzbSJYTW4B9XJXbnCw=;
	b=01rA5dF2AZNYVpef39oHbO+vasoNTQnDUcSfMFHw7xXumgMYccgIqy16wGAxt5r4Ph
	I8zAUA9o8svJrICFSHsQU0drHu5Vg8vZAKjmxv2AIlAiFIWdPWP6lh9GBrR4Kgu2ZTl4
	3kshP2TS/UgMaOgxdOr8MZ/mctFEk+z07pwjeKqTRT6v86EMqn7XNaNP1p1LDRSXSaFw
	PKAuc33QIyY4E7ITgrdl7brS4XLwlR2HJEx4navse9ZHmnuyccdkcsYR8OE3wfg8k8MK
	HBF0SRNsI8oRIWlZY7F4CpFq55Hdpmfe0DYSIuRoyB0G7gFwy/9WWVFptJKlZjpsd8Nw
	u1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=Pgm82aiFSoMYBtdsouk7NBP8kMzbSJYTW4B9XJXbnCw=;
	b=ShG0Qy4lfgOkJMPHaQuzfhRK0Bcjx33ZwepwgNXqN+qMvhKN2dIOYwGeOxpvb3bwK/
	72gUjvftR0fLjVblF+gBhYCi5gemrLW0jdhZ3X4z8C7Nrkj1vPgrZ8I6t9h2JQxdfVmy
	JrZkPKUUzJ5KGXG8eyXh0jBu2TzzmFLDeGpqj+iZeNZgErBZZ7xBDmo1uQU6fV+VfiVy
	cGUh5c+C8j7tJ3FYcsvcO8uYA6tHlhS7983tKMAd3mvuM3GmrOSWk24KQ6FwJ8+oX0DZ
	6URxbQi5F0x1jKwBA4/kRuVnVEZ9EBsPrsPg+mULxPAscKDbsg23ssSyVqbRM68lLHUL
	daYw==
X-Gm-Message-State: AODbwcBan3shOvQP4/wQGlnuj6qKyMl/QbVbd+ptEqcuxYJc0H31Z2hH
	0E9NxSJ9P0N5OXIxU53JBA==
X-Received: by 10.46.74.1 with SMTP id x1mr572748lja.117.1495002925936;
	Tue, 16 May 2017 23:35:25 -0700 (PDT)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id 20sm211889ljf.8.2017.05.16.23.35.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 May 2017 23:35:24 -0700 (PDT)
Date: Wed, 17 May 2017 08:35:23 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170517063523.ltvullw64jv4zotd@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1494933300-31618-1-git-send-email-costamagnagianfranco@yahoo.it>
MIME-Version: 1.0
In-Reply-To: <1494933300-31618-1-git-send-email-costamagnagianfranco@yahoo.it>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170306 (1.8.0)
Subject: Re: [PATCH 1/2] libndp: switch to github uri. libndp.org is unstable
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
X-List-Received-Date: Wed, 17 May 2017 06:35:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

* Gianfranco Costamagna <costamagna.gianfranco@gmail.com> [170516 13:15]:

First, the subject should have included [PATCH v2 1/2] instead of just
[PATCH 1/2], as this really is the 2nd version. (This applies to the
whole series).

> From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> ---

Down here, a changelog for the changes between v1 and v2. (At least if
they'r not covered by a cover letter).

>  meta-oe/recipes-connectivity/libndp/libndp_1.6.bb | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

> -SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz \
> +SRC_URI = "git://github.com/jpirko/libndp;branch=master;tag=v${PV} \

Pleasen, remove tag=v${PV} from the SRC_URI. Instead, add a SRVREV= the
SHA1. If you use a tag, bitbake will reach out the git server upon each
build to verify the SHA1 of the tag. That'll break off-line builds etc.

Cheers,
Anders

>             file://0001-include-sys-select.h-for-fd_-definitions.patch \
>             "
> -SRC_URI[md5sum] = "1e54d26bcb4a4110bc3f90c5dd04f1a7"
> -SRC_URI[sha256sum] = "0c7dfa84e013bd5e569ef2c6292a6f72cfaf14f4ff77a77425e52edc33ffac0e"
> +
> +S = "${WORKDIR}/git"
> +

>  inherit autotools
-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

