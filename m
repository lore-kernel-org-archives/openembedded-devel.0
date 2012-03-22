Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAfBn-0000Ah-IY
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 11:24:15 +0100
Received: by wera1 with SMTP id a1so1668360wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 03:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=5HkI5ob57epwTMAEIZO+Vdkd3plzRwzVsvqEc291S00=;
	b=OPI3zNow1twoot8hf4l2HTDecLXdek5i/6qmoVEXwDf/B701QtXmoelv2DSt8OjDUd
	A8Qvhb4sZRxqw6Va7fzTGxC2YRxotx3GwT/g/TwZaU6mZ5kNrHlF5JDspdOFiuV2zDI7
	Tat7Rn8NQUXYLCm/4AtlDGWseeyX1pHg60pTZD2fuvcdfjfZ2h6eIvoXxX9e4cegJ35P
	5XZo3FhBoaWxC85aVEPuckj1c4txEYADYkuXzCMeoQbZKTK+1c4DBW0bjZI91E+IbhGe
	1Aq78Eze/WVAxsZB0mjWuTcaPyEDCjD6KI0KymRSUSxDyxBPeQ9NxJDGAoPcx359Fd7i
	GVvA==
Received: by 10.180.78.225 with SMTP id e1mr3783699wix.0.1332411321034;
	Thu, 22 Mar 2012 03:15:21 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n15sm4095372wiw.6.2012.03.22.03.15.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 03:15:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120322100758.GG4010@jama.jama.net>
Date: Thu, 22 Mar 2012 11:15:17 +0100
Message-Id: <FD67157F-A373-42D4-93CE-3FF8A142CA56@dominion.thruhere.net>
References: <1332410499-18183-1-git-send-email-koen@dominion.thruhere.net>
	<20120322100758.GG4010@jama.jama.net>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmVGDgnuUrXFglpNujxxynSjcDNvUI2YBYFPiywoxgHrCiubQ9SAdSi4fkdccjXeMOkob+I
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][meta-oe][meta-toolchain][PATCH] meta-toolchain: populate with gcc and binutils from meta-oe
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
X-List-Received-Date: Thu, 22 Mar 2012 10:24:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 mrt. 2012, om 11:07 heeft Martin Jansa het volgende geschreven:

> On Thu, Mar 22, 2012 at 11:01:39AM +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> Why not move them?

This was done to have people test it in the oe-core + meta-toolchain =
setup. And to avoid bblayers.conf conflicts

> Or create stub of meta-toolchain in 1st patch for people to add it to
> bblayers and then move it in 2nd.

That sounds like a better way to do it. Maybe Eric will do that in his =
patchset :)

regards,

Koen=


