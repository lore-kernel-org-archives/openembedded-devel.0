Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1647B6DC27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 12:40:33 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id z6so678612yhz.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 04:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=SEXGo28m87F6be7zn/y7hWKizFZwDpUx098+FFOVOx4=;
	b=MgTzze+Rdc2lPy58r4iNH5Rzopa6tqrC6rdkYRuQsGTz9H6pm/yYV5vbU96fxIXImr
	iLmF/nxHeorMnFbjTDeXlRB6ovzJf8ubBIPhuQhzeqQyoiuF0oFgebJkyeMiofZJnz/z
	CHCc069Mqop4ib3o2gShFiIF1dY6rQpJ2nseHbCWnuAxPAnhMYsGhk4A4gv+7CW2NIEH
	0c7bCEYLZQ+6Z/QrxA4SMCSRfVN7X5tmuRKXylAbDCxNXtzY7IrFkSnW4VG+QZ2Rp2WQ
	M+2+ZImrG0dxCay5zQZsm+E934K4HMfM66d7l5GILLcoKjDLeZkp0ifWOLKZ7knvvoSh
	/KSA==
MIME-Version: 1.0
X-Received: by 10.236.158.226 with SMTP id q62mr7333791yhk.2.1393418434444;
	Wed, 26 Feb 2014 04:40:34 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Wed, 26 Feb 2014 04:40:34 -0800 (PST)
In-Reply-To: <CAFYUCi7N-M1DVsnnxqcmMy8YJFsocDeYOn5Y3qBt8Ku1GB4_NA@mail.gmail.com>
References: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
	<1393273696-9249-3-git-send-email-otavio@ossystems.com.br>
	<CAMKF1sor8AfGAjLODy5W9N91HQsBTTvAhh0+j3S-Obn_Gdv2Nw@mail.gmail.com>
	<CAP9ODKp_b4MmZZ38DSB5JwWevucrOmE3tzFeL2F-DKe9=LyEnA@mail.gmail.com>
	<CAFYUCi7N-M1DVsnnxqcmMy8YJFsocDeYOn5Y3qBt8Ku1GB4_NA@mail.gmail.com>
Date: Wed, 26 Feb 2014 09:40:34 -0300
X-Google-Sender-Auth: -P63I3_qaMPklSqWyAbOfv_f0LQ
Message-ID: <CAP9ODKp0UPWJypF9F6f+bL+xL8eaHYHb9H=RYG_sKV8DMyS=SA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Giulian Vivan <giulian@ossystems.com.br>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/3] packagegroup-qt5-qtcreator-debug: Add package group
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
X-List-Received-Date: Wed, 26 Feb 2014 12:40:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Khem,

On Wed, Feb 26, 2014 at 9:18 AM, Giulian Vivan <giulian@ossystems.com.br> wrote:
> We tested it and when qtcreator tries to connect to the device with
> dropbear, it gets "server rejected password". A connection done through a
> terminal is accepted normally.

Any specific reason to prefer Dropbear?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

