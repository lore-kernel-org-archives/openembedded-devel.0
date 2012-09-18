Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TE01l-00020B-LS
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 17:47:57 +0200
Received: by wgbds1 with SMTP id ds1so3398954wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 08:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=hB3cztbdKJrzw414p3SJSrZ4tm0jnq4+m/kSfUtecj0=;
	b=bVHd8muT4x2PdslStQwLl1HyVw/7dz8eZM9uIN3ISxcz70G2+QjpcFz57V/whBmNR9
	nHbLyX2brEay+QOb0zrPkyOq3FqL1MEPLqGS4MH6jaQFdBH5y6SzgtCc/SvjZ21/Zg0H
	eYulXGR+e0EVNVYlfOFTEjhnaI8q4ujRUUMQb1SJQ6rAR8/WRFpZFxFejrnRYtgcalqO
	8wPTA+iw8kx3LUhDeMMuIgzbbrWUh45PtxAl5CjT8EKhAwfPSk4pZKpRqxb6ePrTpDc/
	+AQkARUYn0denhfIHMMZfOJ9q2v42CMwzL7cPExdDW1GmAe8W44aw60t6g5mRfnXephF
	O74Q==
Received: by 10.216.211.158 with SMTP id w30mr116435weo.55.1347982517677;
	Tue, 18 Sep 2012 08:35:17 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id k20sm23277413wiv.11.2012.09.18.08.35.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 08:35:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAK18fxHzC+3nrhVbsntm+3DbF=pzwtZoF8R0EcZ33z3G4uv9Mg@mail.gmail.com>
Date: Tue, 18 Sep 2012 17:35:18 +0200
Message-Id: <E5E9389A-9AA7-4BE9-85A7-BD6D5DDC9A88@dominion.thruhere.net>
References: <CAK18fxHzC+3nrhVbsntm+3DbF=pzwtZoF8R0EcZ33z3G4uv9Mg@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQmbK1ovobca6l1VRdPiyqZCcftSGpz8Cv6ZSBzv5VeX7vo6ufmJ3/0HcUREq4z1GEUqYSjj
Cc: openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] zram service in meta-systemd
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
X-List-Received-Date: Tue, 18 Sep 2012 15:47:57 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 18 sep. 2012, om 16:58 heeft Andrei Gherzan <andrei@gherzan.ro> het =
volgende geschreven:

> Hello,
>=20
> I would like to move the zram service from meta-raspberrypi to =
meta-systemd. This is not specific to raspberrypi and can be used by =
others as well.=20
> Koen, what do you think about this move? And if so, what recipes =
directory should i use? recipes-extended?

What other machines use zram as well?=


