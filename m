Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 134CA74AD4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:12:59 +0000 (UTC)
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B538C20899
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1527660781;
	bh=aLu9t9tFxYP0uibJ4wazArwz0UF2TIeOIm/7FyJMpI0=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=ayb/nSUXkfAhN2SnqaLK3X9nK6MEhIUBPWcJ+v/y0kjVRaLI/cXv93BROGNCqCwAS
	i717POUuIvVEggGoClARBhTEtzWXuQvD7j71q4KdEFLtayJyMZKTFk7mE5S9KH0XM7
	ufKuFGyD+LnHTZBwUt57zP6TixJsc6i22/l2zPd4=
Received: by mail-wr0-f172.google.com with SMTP id l41-v6so28230781wre.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 23:13:00 -0700 (PDT)
X-Gm-Message-State: ALKqPwcvqhsjiF0eTsJKOkQsMeC/M2nVZhNL7iHhchVSR9e/5sBSVfJR
	C7DZUPQUqbOy1hBRXwvXDfoNAO0Juf4I6u93PYE=
X-Google-Smtp-Source: ADUXVKJcYqYAqLLDXaP6uCXBT9W4mzDcSSKuoSrGQaHfi2HkwmUwEp+JzaBWsSfUgZlBoVQBfTGiunlVdxYGbwoFotk=
X-Received: by 2002:adf:f391:: with SMTP id
	m17-v6mr862810wro.279.1527660779180; 
	Tue, 29 May 2018 23:12:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:9166:0:0:0:0:0 with HTTP; Tue, 29 May 2018 23:12:58
	-0700 (PDT)
In-Reply-To: <CAMKF1sqPhonFVTVhMtmbpiGhySrbYkPjERcoOWWAeroxSaRvcg@mail.gmail.com>
References: <1527600941-1521-1-git-send-email-krzk@kernel.org>
	<CAMKF1sqPhonFVTVhMtmbpiGhySrbYkPjERcoOWWAeroxSaRvcg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 30 May 2018 08:12:58 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfDcYauEWwh2biKq6thE3QSF=OC=96k2O1QYyq6V1CWmg@mail.gmail.com>
Message-ID: <CAJKOXPfDcYauEWwh2biKq6thE3QSF=OC=96k2O1QYyq6V1CWmg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] broadcom-bt-firmware: Add new recipe for Broadcom Bluetooth firmwares
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
X-List-Received-Date: Wed, 30 May 2018 06:13:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 6:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Previous version is now upstreamed. Please send the delta rebased on
> top of the prior version in a v3

I missed that it is already applied, sorry for the noise then.

Best regards,
Krzysztof

