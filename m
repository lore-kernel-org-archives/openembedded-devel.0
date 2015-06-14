Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 10559758D3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jun 2015 15:45:44 +0000 (UTC)
Received: by igbos3 with SMTP id os3so3044643igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jun 2015 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=HvunU9E5/vBOQbLTHgwtHwXx3dph2TKpNz+UPMAKZDQ=;
	b=w/7MrYzwEJL0tDnhyKOHIxvlrepgrrCLWdXhT8ljyCBIiJB5iBoVgkh59LEwtwZ8zE
	7aCTPlNJKdo4EuH+2v8FY26Sezis27OeRwFwJBLxgMLWP7u2qq+wnwzAvKIMlqRqqmE1
	73EzsS1GV6xGwM6y+TfWCZfVs2GX9ft8qQk//K076lXm/uCgoU/32ht5+7dn5DDTBBX6
	7MU5eyQn0EQI8DHHIRQss+PsRgcZI7Qr5AXxtB9TGV02YGvXoPmyWdx20JSeCkMTyHsy
	+Di0efJysMCQFDp8orjcj2sh8+x5AZyxJEc9OcydkFi2I3WMt44nzrU7KNZsMlTY2dnL
	jCpQ==
X-Received: by 10.107.157.205 with SMTP id g196mr29794484ioe.57.1434296745921; 
	Sun, 14 Jun 2015 08:45:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Sun, 14 Jun 2015 08:45:15 -0700 (PDT)
In-Reply-To: <1433812320-1835-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1433812320-1835-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Jun 2015 11:45:15 -0400
Message-ID: <CAMKF1so8YC7TsmBUcoqoXKJoOj7cE=JdTXq9jPxLRkiSV24cSw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] lvm2: add systemd support
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
X-List-Received-Date: Sun, 14 Jun 2015 15:45:46 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 8, 2015 at 9:12 PM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> +SYSTEMD_AUTO_ENABLE = "disable"

why is it disabled by default.

