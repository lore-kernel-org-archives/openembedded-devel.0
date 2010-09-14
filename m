Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OvOdz-0005F9-F8
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 08:05:34 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 4CF76491278
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 08:04:35 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 14 Sep 2010 08:04:35 +0200
Message-ID: <4C8F1077.8040105@dresearch.de>
Date: Tue, 14 Sep 2010 08:04:39 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.9) Gecko/20100825 Lightning/1.0b2 Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C8E07CD.2000809@eukrea.com>	<1284376645-11610-1-git-send-email-eric@eukrea.com>	<1284376645-11610-2-git-send-email-eric@eukrea.com>
	<AANLkTim4hXBoB-gbUT09rWHrF7ENA1v4ix3-fMwp4y+8@mail.gmail.com>
In-Reply-To: <AANLkTim4hXBoB-gbUT09rWHrF7ENA1v4ix3-fMwp4y+8@mail.gmail.com>
X-OriginalArrivalTime: 14 Sep 2010 06:04:35.0358 (UTC)
	FILETIME=[B4E8BBE0:01CB53D2]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] util-linux-ng: remove reset
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
X-List-Received-Date: Tue, 14 Sep 2010 06:05:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 13.09.2010 18:41, schrieb Frans Meulenbroeks:
> 2010/9/13 Eric B=E9nard <eric@eukrea.com>:
>> * reset is a script using tput so it rdepends on ncurses-tools
>>  which also provided reset
>> * prefer using the original and remove util-linux-ng's reset
>>
>> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
>=20
> If they are functionally identical I have a slight preference for
> removing it and use the original.
> No strong feelings on it though.

What about update-alternatives?

Steffen



