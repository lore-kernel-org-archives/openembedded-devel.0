Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id BF59960765
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 12:17:35 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id h2so100764509uaa.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 05:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=L3KoWGJOKYlvTSZBpybx+CW7cMLdmMR+XrKaIMGX4qU=;
	b=OgNXoBpnYRtfDSkvmCsjNxbEfRW7A8q43YNKga4KTHrEboc/6nRNC1y7gSUpz9OLHx
	2/6cAhAH6fLCL5mTOumof3PHQtOEiBII1gV9rUILxssZY8L8sCddmiOQeu7NqRfxGsM9
	Bap1qWgFK2KwLQQ/OhfJo9NQCfNW4bYtprSGUGY1EeXdMjmr6iH3h4XJuACgksf9IUrR
	Xrg9j+gD8jj9Z4OGPn8Vl1nJpPgK76z1u3DUdjQ7DqDwdsoHl86P3VxeLPNyryxGDNrm
	XMB+UoiGuX6qfDwMi5/HkmpE5Y69/uCiydfSvhHbX6WQoGxAy54bsFWBzsCeote+iyWt
	OpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=L3KoWGJOKYlvTSZBpybx+CW7cMLdmMR+XrKaIMGX4qU=;
	b=IavRxBPOzPtUsimwUI2k2z+OEm1d86SJpd/0nrwWQ/vzkS9ogUsWhQYiEYyGlS4UK4
	pRkp6oIDUxrl+gz/PdhOl99xuSLvVQdc/e8por6DR1nqZdje01hi0hPsN207ww0CXPXD
	FoaD1Vg7S2YTLpQYNYuVEGuj3g4fjtrEzlMOEELRRz+SHSu8gHfGppe8wqRTImZr6nVZ
	InhKbEeRvBNOXwnMPsQink6R8ci3tMmtKTGVSp4p8KDCSxDE1cQh2ugTOhoBqRjQLQV+
	3VyI7FKwEWU8+uRJKBPs+V/DRy6oIjX4DCOwZHQG4h+4p0pPCzDUZDAWe7pWPYcFTEcw
	ZmFg==
X-Gm-Message-State: AN3rC/5ya56cdQQk9uG+IlvXMj9KBQI+pZN3A0w3mvs/aFSm60TlHD8K
	LggptfXbGCC07YeBWhbExzNRifU+6g==
X-Received: by 10.176.25.18 with SMTP id v18mr10663580uag.81.1492949856494;
	Sun, 23 Apr 2017 05:17:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.81.5 with HTTP; Sun, 23 Apr 2017 05:17:36 -0700 (PDT)
In-Reply-To: <CAHUNapRERHRGcKnOumS59deT8AasKbX0FxPA73o0E6q=TvNcog@mail.gmail.com>
References: <20170422211821.6015-1-schnitzeltony@googlemail.com>
	<CAHUNapRERHRGcKnOumS59deT8AasKbX0FxPA73o0E6q=TvNcog@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sun, 23 Apr 2017 14:17:36 +0200
Message-ID: <CALbNGRSp4qypsZYvN29a2YJAkPVGi-PD6VHJJTbB_KPEqrQg+w@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: show progress for do_compile
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
X-List-Received-Date: Sun, 23 Apr 2017 12:17:37 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 23, 2017 at 4:33 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> Otavio is quick to apply patches provided as github pull requests :-)
Pull request is out

Andreas

