Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UDcqY-0000sm-UP
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 16:35:07 +0100
Received: by mail-ee0-f46.google.com with SMTP id e49so406587eek.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 07:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=QKMneRd0ognWznM6pHBRCsH43uzLgO/Tj3RgDVoZ2ZY=;
	b=m0O8Oj8lIQ2UkkXJ5Mg1+1xDEVHg7ZbXbtqgwNlcPhbcSbw2EUnSwPPAtuKeF0rzho
	qSNKHTe4nGAU3t3riEwff8dyY5XF+uPAMo068dOsg7/pdqkSL5XK8VIqThFytlv8Sq5J
	q9fbkRH25zfImNxPvoN02luxrzWTw0t09Gu03SH2IWGGeToDKySmLPvrWII/cDg8xhdh
	HwOqUHH6wGXAzhOUr2jaPvTknCdZX0to1Yfh1wRuotzPLGk5A+pfUEw1hZbUOjSn/uqP
	QRWtMaWyFfKJU2+vI5b1TRLYm3JRPVdfz3uXO1ZfBw+C0hl37QG9HSC9ZpcV8dAS9aYH
	+opw==
X-Received: by 10.14.214.66 with SMTP id b42mr94574645eep.34.1362669514556;
	Thu, 07 Mar 2013 07:18:34 -0800 (PST)
Received: from ?IPv6:2001:610:612::280a:4994:8703:d6e6?
	([2001:610:612:0:280a:4994:8703:d6e6])
	by mx.google.com with ESMTPS id q5sm2673750eep.11.2013.03.07.07.18.32
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 07:18:33 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LbAF+Fm8HTRFQbSCh0YVXYR_rkvwA1oP-4z9QdLo_ayJg@mail.gmail.com>
Date: Thu, 7 Mar 2013 16:18:34 +0100
Message-Id: <634E44A3-E471-472A-8DAD-AF8BAA316CC4@dominion.thruhere.net>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<20130307130435.GI32228@jama.dyndns-home.com>
	<E780D109-3D15-488F-8CC9-F6829BEE90F1@dominion.thruhere.net>
	<9088096.rvOOlWx1VE@helios>
	<CAP9ODKp1bpin38S3QHaR1s47B9gSxmoMUckWY=NpS_FtB0rVYg@mail.gmail.com>
	<5138A92D.5030809@balister.org>
	<CAJTo0LbnE7DjdJL=9=LDA3kpxhAADJONAu-4Xdwohcno__xXcA@mail.gmail.com>
	<CAJTo0LbAF+Fm8HTRFQbSCh0YVXYR_rkvwA1oP-4z9QdLo_ayJg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQkvHo63p37qnf4VyPbEEQY5hpIcBt3pXBk3DRo0+NEc0d1VNALl+2Oogn6v2MyKGu4dfES9
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Thu, 07 Mar 2013 15:35:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 mrt. 2013, om 16:15 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 7 March 2013 15:05, Burton, Ross <ross.burton@intel.com> wrote:
>> We really need a table on the wiki page listing all of them - I can
>> easily remember the current/previous/next names but after that I =
don't
>> remember them.
>=20
> JFDI.
>=20
> https://wiki.yoctoproject.org/wiki/Releases
>=20
> Only goes back to Poky 4/oe-core 0.9 at the moment, I'll fill in the
> pre-Yocto names later.

I asked this earlier in jest, but it requires a real response in this =
day and age:

	Are those yocto project releases or poky releases?

I get the feeling the codenames are only for poky releases, so I =
strongly prefer using the numbers releases in branch names.=


