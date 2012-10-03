Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TJNXC-0006kY-A7
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 13:54:38 +0200
Received: by wgbdq11 with SMTP id dq11so4854567wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 04:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=obZZhEMdq7zdTfJx0k5+vv3vk2/M5FyY2mKi4YqtVBY=;
	b=Yo9QCa0qxpz2VZqMjnviYVtUkhk6c+ufo/BoXbOuJc17YhcXvLaL/70gE4mfCMBXuP
	ZrPxjlgo/czuQP/R8tcffRlHvQzt81N/Jr3yDnDUMbwNRNQGNKcT8zCcQsUPXPry24uR
	W+Q6N3chFK9BsIeWxYKe/ZmGNBsAPkkOx+/m1l1VtRlKzzs0e8F6RPL7CubgKgQGiS2U
	KFVzrkNVHHS7NulWwgF3qN2Wk96R0goxLNsv65aD4qcRiiDuRbbJu0IeT7E0TZQwbMTo
	BdmzbokdKvPDfu1p2iZIf+eMekEc4CychFFYZvNhqYwcjuZhbETUUotm27grr9RL7b9W
	PA4w==
Received: by 10.216.214.91 with SMTP id b69mr1066131wep.70.1349264498882;
	Wed, 03 Oct 2012 04:41:38 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id f1sm8968672wiy.2.2012.10.03.04.41.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 04:41:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4258940.BqvSfKhsZ3@helios>
Date: Wed, 3 Oct 2012 13:41:38 +0200
Message-Id: <8836BA14-373E-4530-8F81-9EE8DA000926@dominion.thruhere.net>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<bc45dc7aa0affaab30b86764930897ac81d81bc2.1349107616.git.paul.eggleton@linux.intel.com>
	<k4h3c4$n4q$1@ger.gmane.org> <4258940.BqvSfKhsZ3@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQl7J3kFfeDuR6d4AfCyIh11QhcchYryN0r+XW9vCnWDy56sSTpMA4pSF8lhXhh3gf/ojH+9
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 2/6] apache2: add from OE-Classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 11:54:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 okt. 2012, om 13:28 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:
>>=20
>>> + +PR =3D "r0"
>>=20
>> that's the default, drop that
>=20
> I'm sorry, but for reasons I've already stated on several occasions, I =
won't=20
> leave this out in any recipe in meta-webserver, nor anywhere else =
where I'm=20
> the maintainer.
>=20
> Given that you often complain about people forgetting to bump PR, why =
do you=20
> insist that people should remove PR =3D "r0" when having it there =
would be at=20
> least slightly helpful in that regard?

I haven't seen any evidence that having PR =3D r0 helps people with =
that. Have a look at all the patches that were posted with missing PR =
bumps, they almost all have PR present.=


