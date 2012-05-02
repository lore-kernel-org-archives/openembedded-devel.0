Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPX2F-0002Vo-5o
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 12:43:51 +0200
Received: by wera1 with SMTP id a1so307823wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 03:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=HGp0MR4dWzK8J/rZL3wTN1E8O+9nU7W1aQx7xTsD3Sc=;
	b=VKA9tPaKDwQXBhdmxePEQfPW06ldCyg+hMcilfCx66/vUdAhHsz87csrXtFFGK+9iG
	ur+4kbrRPNy9+I7glG4o6OUnivqQ8sG6A6oQb+/hM1+OoWfWRClOhD8a3FHfapeIdqZA
	4zAP8JG9hILcC8kcohuBT5J0u0Z9vIkFOGYkwBFCmJ0gkmOi17reMtiUPSDL6HLQ46Qr
	kvrZLnl35APScu/bNvWlFVhI7wlhriuhUiTu5YHPGVvm781SB6a0jLlL9XEVBLONGl4m
	DVPXvuDftkFAQFLOQAasxJZKH9fiLimBI7jU4rJ07FI58dMh/bIM6lAGGcgbzFxW7Q2J
	BQ4A==
Received: by 10.216.145.153 with SMTP id p25mr385595wej.112.1335954846911;
	Wed, 02 May 2012 03:34:06 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ea6sm43368504wib.5.2012.05.02.03.34.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 03:34:05 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120502095150.GA3682@jama.jama.net>
Date: Wed, 2 May 2012 12:33:58 +0200
Message-Id: <524DDF15-E16B-4255-84CA-60DFD9005FB2@dominion.thruhere.net>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
	<1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
	<20120502095150.GA3682@jama.jama.net>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkf8iZFkSmvQK3dodj+no4t5RXEBQlsQr9noskWn97Q94sHxyRcZhhx6sD2/ooz8OItCHJr
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/denzil][PATCH 4/6] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Wed, 02 May 2012 10:43:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 mei 2012, om 11:51 heeft Martin Jansa het volgende geschreven:

> On Wed, May 02, 2012 at 11:45:30AM +0200, Koen Kooi wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>=20
> I'm not using gcc-4.5, but aren't those 3 patches only for master? As
> gcc-4.7 and other gcc changes were in oe-core only after release =
AFAIK.

I might have misunderstood the patches, but these seem to fix real =
issues in gcc 4.5, so I don't really care if oe-core fixed it after the =
release, I care about the release working :)

Anyway, if they don't work as intended, let's not apply them.

regards,

Koen=


