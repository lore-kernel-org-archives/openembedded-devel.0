Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHIhP-0001UW-Sy
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 19:48:20 +0200
Received: by wgbdr12 with SMTP id dr12so3600570wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 10:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=q9p+Rft3sDbtlgkXxPWH9vcF+phflPg982d4WUGJlCo=;
	b=WWRYYI+EW9WSjHYMFHSmEBE2zb69jf/l+TKxRocw6hX66oamgE5qsK5RYtouRHVk7T
	5xafTvFFRTaboKzPfSt3vczTbYvRoxzPeyqLflh8pzgxHSRu+tMWrIeAdyotpHfC1vZ6
	W3SqBTttV8OeAOLZWLqhS4gGq4RIOwMRr0LS/wkdyDD+6NBKstIHCoNEeDwS3b/cJzl7
	hNNK9jTfVQ++VMpTU2ozkRlEhoOLG12cOYmEF6HFUneg5eGlJF7XWkXC4qfQmcSDOvgt
	4avKQEttrY4jHKdXvieSqFLmHQVprgiTUvT8/vzwhGYSkbQMvveSA9S6k2FtK+7LGSf3
	3Spw==
Received: by 10.180.89.130 with SMTP id bo2mr17560555wib.17.1333993143360;
	Mon, 09 Apr 2012 10:39:03 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b3sm31807918wib.4.2012.04.09.10.39.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 10:39:02 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120409173205.GA27686@denix.org>
Date: Mon, 9 Apr 2012 19:39:14 +0200
Message-Id: <95A4FA11-8282-464D-AC37-941611ED385A@dominion.thruhere.net>
References: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
	<1333984573-28464-5-git-send-email-koen@dominion.thruhere.net>
	<20120409173205.GA27686@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlAAxJiHRH7+7NtHLN+ZFwH9hD8OoD6NvIjck7Y7YKvZxq4FnWculKeFzwNiIHSRyHjI4jd
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 05/10] cloud9: remove 0.5.1
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
X-List-Received-Date: Mon, 09 Apr 2012 17:48:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 apr. 2012, om 19:32 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Mon, Apr 09, 2012 at 05:16:08PM +0200, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb |  114 =
-----------------------
>> 1 files changed, 0 insertions(+), 114 deletions(-)
>> delete mode 100644 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
>=20
> Patches #3 and #4 make changes to cloud9_0.5.1 and then in #5 you drop =
it,=20
> which is kind of confusing. I understand that was the development =
progression=20
> to get to version 6, but I guess they can be squashed here...

I wasn't sure if someone wants to keep 0.5.1 (or object to the node =
changes), so I kept the commits seperated. If people think it's better =
to squash them all into one, that's fine by me.

regards,

Koen=


