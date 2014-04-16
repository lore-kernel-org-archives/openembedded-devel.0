Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id BDDED65E53
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 23:02:34 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id hn18so31298igb.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 16:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YcQxNHq87FSY7zhcEpmh93rI5TGCVh9hty0Xc9v5jPw=;
	b=RehxwRUi6ielFrfHt0ve1bQbXvgaU4gwuzXqERv4xh2JbWvkyYGEa0FqpT7xLGS1Ji
	6YVhDRTvS32GNLIwYNj6W18j/6AHIwi5jyiWDK9SADVZNewF98wRGwKDoD0EYCVztI1D
	f1v0y+nMjh+GM4DxqtO/qNDHLNt0LUA10X3Fh4URyJt6j0H77DXeZF8R2JlXg+gkJx4k
	j+02MUKwJdWLuM/GlK6NtTiIsZ24c/VaZHJ9SNsAJpifln7sDh+USTwiUpZBUVL09kdV
	UWaaaVpYQ8rs0S3va7dRXKT9oG08WIgQYvhxeO2BedEdomd7qtnmQFNzssa8dwcD9Ykx
	AbFg==
X-Received: by 10.50.143.76 with SMTP id sc12mr7825538igb.2.1397689355450;
	Wed, 16 Apr 2014 16:02:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Wed, 16 Apr 2014 16:02:05 -0700 (PDT)
In-Reply-To: <1397671872-57992-1-git-send-email-krzysztof.m.sywula@intel.com>
References: <1397671872-57992-1-git-send-email-krzysztof.m.sywula@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Apr 2014 16:02:05 -0700
Message-ID: <CAMKF1sqxTiKZ5EiOL21Eojgefa8boiBc53E5VVOdkZQmgrT2JA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: martin.jansa@gmail.comexit, Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] bitlbee: add bitlbee-3.2.1
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
X-List-Received-Date: Wed, 16 Apr 2014 23:02:35 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 16, 2014 at 11:11 AM,  <krzysztof.m.sywula@intel.com> wrote:
> +EXTRA_OECONF = "--prefix=/usr \
> +                --datadir=/usr/share/bitlbee \
> +                --etcdir=/etc/bitlbee \
> +                --oscar=0 \
> +                --ssl=openssl"

should these be hardcoded ?

