Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id 04D1E7DEBF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 20:35:53 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id r17so3839883ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 May 2019 13:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cGC/FrFKOkw+HfTuiyttso+Rf3oWfDqqbIms9nW/UtE=;
	b=g/f1/c5mVlAvV39DGNIsuBPLdIR7hkBziUBaK264DP0UI2BPOgHT1Hatk5mbw+EC2o
	ahyHyFMj781H2auDkOaJVO/0qX9C40W6UyKl+aV6JARbYbwXIuwy8kBMqjTl/1ZXt774
	Wai5ZSYWTDTtLcjJ5D1JyHjcXlURmJu1zoyYVIHeok7a16o5ZQ2LS362qEyJ38pllj5R
	YwRX3zr3HBQOoPMY1c0USz6k9FRVOUWQad+Z2e9J5HIOgWUToU03NRANkOkE5tvOgvau
	+zCCobWL85WbpZWtoyMAbaz2a+lWFIguclDT1ysG0EwSMvQjE/K5aZ7VV/5UYs60qB/I
	1U0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cGC/FrFKOkw+HfTuiyttso+Rf3oWfDqqbIms9nW/UtE=;
	b=YsxZ/JogtvWym9+ziVy4k05hUvncGlmIu6wDJ5iudNoNw2EzwWkd3Sj2d3iHz+cp7A
	0cVQFbKjhh0tIQcZoRTtV4p2DPfTQVXDom1O731vIL1ILRPKWeFY/LOy3FnKdbIf6zIE
	Uq6/rePp2Fd51mQp+8nhj3gabiXSTCEBUKc76358XSoMFhlgjAsNY+bfncclO3Y5CVUG
	yDaoKUT9e7OCByO7kZu0A4Fbo4zm0ni+m4SaSLuN/bDSfFWPohmBqQI79gKYG1ER5mEs
	RfUvXelwpMxUGtRv7M9hQTe2FgQ0QmY0m00rRIiqnbj3fw6DNOHYx038oWVU8I3d6mAf
	4zAw==
X-Gm-Message-State: APjAAAW7a5y2RKz0KXx7n1wpVBbPSe3HYnAINTuQ3h83YCuDrsn3T/qq
	NSvySPpxFFdPLP4g8NqcHZQccZymM4sH0oMT/RHXntgKJQA=
X-Google-Smtp-Source: APXvYqwMuySKrYwrsG30aGDT375fHNEBxrx3r3tZbC1hLqxTLAnCwHFSNZOShQSUpr/mv3pTO4TnEYC5BiueIyK3VlI=
X-Received: by 2002:a02:3846:: with SMTP id v6mr5201jae.81.1557347755057; Wed,
	08 May 2019 13:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190508195852.28803-5-bunk@stusta.de>
In-Reply-To: <20190508195852.28803-5-bunk@stusta.de>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 8 May 2019 22:35:43 +0200
Message-ID: <CALbNGRQr_0b0kTt6JeWz8K=tdr34NumX5PEHCUZHJMnGnrLXnQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] Remove liboil
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
X-List-Received-Date: Wed, 08 May 2019 20:35:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 8, 2019 at 10:00 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> It was replaced by orc 10 years ago and no users are left
> in meta-openembedded.
>
Hope I did not miss something but I think it needs to be removed from
packagegroup-meta-multimedia either

Andreas

