Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 74F6B6E668
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jan 2017 17:07:39 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id 137so276944946vkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jan 2017 09:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=phLlsJrV9nqNvmOBYB9y4toWJEc/QdtkqJ5xLY19ggE=;
	b=dVGDOzbRxo6dyADP3LfdRwxUKogmUNMPm3RoRhtjCAVSDGflSkRSZpd/ROgLutwJqD
	ZnfOAfbI/KdYz22m7YU5rAcgzvbUh9n6LkLXaYA69WrQboVn8eiV1+US8QKEH8eJz6Mg
	uV+3+HIX0rui2I2QwjB9Y8sfpDk5cL/wWhXBg5Jn4gN1gSHgTNE0KdxsHRvfWlaM66Jy
	G2eAkNQUyiamq+ExF7xYUGpUw5noaE0DYszycBu1QuJLezJgew9EQwtnByRUHrbVwgNQ
	i+43QkydfafFvUL3fn/6vF3AOvdqBoTqquBWvw118w4Uh/sBxI3qT/1xmOgv1/ZhXJTl
	c3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=phLlsJrV9nqNvmOBYB9y4toWJEc/QdtkqJ5xLY19ggE=;
	b=qeYnjbcZKdgAJAajGbFb0E8ASlqZ026dAPP5tpSgFB57YvyRXr0yBIvsFfE5VXq88Q
	/ZG6U6SMeKuFPGfO1PKlTg3SC1vJlPYXbZkkTsLithsjXvasCAuTF/f4LYJjsFVZXW68
	STofcPj9ct/JTBZHz6cehzGntzFtrOLFOfmPaCM1PuHq15lkMQqbIkyR2V4hbUmjeQLG
	FZUjlmlwnF9utXTGSz/OOSTDuTr7pKHuqirXGaLJ36lHyVZlfdprgSz1sC6uft7almaD
	O9Fr+NzHsHQytNXJgeSBmquL0wwWrPyER6lcbalBUIAjjmIhcloHYBOk6oCyxmUSbGtQ
	p8kQ==
X-Gm-Message-State: AIkVDXJKRg2gTt7RtCdz//DgZEf3hpVrTNmYNlbjBdDBsr+OwvNpeALokW7SPbxK9X4Cv7P/h0M2YDbuo0uuOg==
X-Received: by 10.31.234.199 with SMTP id i190mr21725063vkh.31.1483463259687; 
	Tue, 03 Jan 2017 09:07:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 3 Jan 2017 09:07:09 -0800 (PST)
In-Reply-To: <1483462910-24912-2-git-send-email-schnitzeltony@googlemail.com>
References: <1483462910-24912-1-git-send-email-schnitzeltony@googlemail.com>
	<1483462910-24912-2-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Jan 2017 09:07:09 -0800
Message-ID: <CAMKF1so8B_AXK4AyB4YTveyRe23Z-hoq7c-C5xSa9E3KrcykMA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] raptor2: initial add 2.0.15
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
X-List-Received-Date: Tue, 03 Jan 2017 17:07:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 3, 2017 at 9:01 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> +LICENSE =3D "GPLv2 | LGPLv2"

minor nit. It should be LGPL-2.1

