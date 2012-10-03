Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TJNaD-0006um-9w
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 13:57:45 +0200
Received: by mail-wg0-f41.google.com with SMTP id ds1so1095276wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 04:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=dImk9ivh7iif5ElLxsTJPoPuRlh+lc+FrZZVcN0d6Fw=;
	b=J/Cbr4wVSc0FvYjVwyFCOiYLcEdGcLizMCAg8aCI3GTdY67WwIxblLr69ouOFsDo36
	Bjz1AzuyuPSzwXXCaKZRK1tqwaKR99dfzddPya0Jl5jH8WDpNBN7GGPcLpr4dSKpvrxT
	1TWpnHOhubqNtjgVM1UWkJIZ/RrfWPUZ66PcYzZ9NQfaotSrl+3Ehn+A2HjM0YhfAFxh
	PGCz/AxmgLkVT2eQOZSWPMAPiOkFJE6XNTtDbyeNycV0YvXI3p+53kZ1xCJ2ksOak5EC
	IpgY0REYyOC4fXcC22pVJCPRnJH0ItK6CNUo4y+CBGyPruM+HKkm24iPq3QSZyJlOuXM
	UlIQ==
Received: by 10.180.87.42 with SMTP id u10mr4463761wiz.0.1349264685820;
	Wed, 03 Oct 2012 04:44:45 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id bn7sm8015508wib.8.2012.10.03.04.44.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 04:44:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <9997133.uIUMnIOYLI@helios>
Date: Wed, 3 Oct 2012 13:44:45 +0200
Message-Id: <F687ABE0-E04A-4BDC-8D78-DB7AD23E944B@dominion.thruhere.net>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<f4fa3e7556b5456ed8f9e5450669ab108bd08325.1349107616.git.paul.eggleton@linux.intel.com>
	<k4h3gv$n4q$2@ger.gmane.org> <9997133.uIUMnIOYLI@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQkRFqmEh0D0Z/Q0IFQjS0hS929DgerJVQdtKE1ksw/f176iiEcl4IkFFfF4worh0/51fkzu
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 3/6] modphp: add from OE-Classic
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
X-List-Received-Date: Wed, 03 Oct 2012 11:57:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 okt. 2012, om 13:28 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Wednesday 03 October 2012 12:20:16 Koen Kooi wrote:
>>=20
>=20
> Already fixed in the patch following. (Did you look at those patches?)

Not at the time of the email, I went patch-by-patch.=20=


