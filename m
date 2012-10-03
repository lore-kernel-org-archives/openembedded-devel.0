Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TJNZ0-0006pj-Fu
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 13:56:30 +0200
Received: by wgbdq11 with SMTP id dq11so4855801wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 04:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=kmaUI54PatV5C4H1Xmygev1A4NUnDhLSy8rnCArfVxU=;
	b=G3jBvrzrQGkH81W7T8o51zXiz/iKcnPv/gQkLR301s3jBOMzplHG9e2+gR8jWofh9S
	+VBwrHreSga257lI0tPIsuLPgNsZJjhxs310SqBZr82+ExdaX/Shu13ImzQft8VcTVMu
	L85yKE2Jo0pvH178szgIjvCekd0ay2d73frA3ZvJbVsQtFkaq5dkHDqkSbX8FrS4RFmD
	fK9qQ6LLlqTJDklM4CZaedALjbn4PLPDFEhNDhu5Bbb1YgkDDvwzjKcJRYwWKC+RZJN8
	rmxdyl3AN9ytGK1pIaE+fxQ9SN4HQfIVVMic/+JATzO2MSwIzrNPj8PPh9eyXPhr6Fx/
	ChTQ==
Received: by 10.216.193.158 with SMTP id k30mr1146866wen.89.1349264611191;
	Wed, 03 Oct 2012 04:43:31 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id cn6sm8006391wib.9.2012.10.03.04.43.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 04:43:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2386446.3zWsEst4ZG@helios>
Date: Wed, 3 Oct 2012 13:43:30 +0200
Message-Id: <DDBB0A17-7234-45BC-9D2E-E9C0ED7C4086@dominion.thruhere.net>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<1403689.8imU91Pjgi@helios>
	<8B480455-60FE-418C-9A98-DB281B347CE2@dominion.thruhere.net>
	<2386446.3zWsEst4ZG@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQlDYTW0q5nq8Ve4GKBwJGgMgUeQqRobemNUKTm/xTyu7GEV0zp/oYAa/Q+D5V7mp9ofyPas
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH 0/6] Add meta-webserver
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
X-List-Received-Date: Wed, 03 Oct 2012 11:56:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 okt. 2012, om 13:29 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Wednesday 03 October 2012 13:27:41 Koen Kooi wrote:
>> Op 3 okt. 2012 om 12:43 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com>=20
> het volgende geschreven:
>>> On Wednesday 03 October 2012 12:24:19 Koen Kooi wrote:
>>>> Squash those "import" with the "fix" commits, no sense in having a =
broken
>>>> recipe in there.
>>>=20
>>> I'd rather not - there is sense in being clear about the changes, =
because
>>> there are a large number of them in this case.
>>=20
>> The broken recipes are still available in OE classic if people want =
to
>> compare them. I still don't get why you want to have broken recipes =
in the
>> tree at multiple points in your series.
>=20
> Because I want to easily see in "git blame" where particular lines =
came from -=20
> did I add them, or have they been around for ages?

Does oe-core have the same flow for new recipes?=


