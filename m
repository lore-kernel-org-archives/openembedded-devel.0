Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MQSAa-0007O5-M2
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jul 2009 22:30:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id A8DE92C9FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jul 2009 20:16:46 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id teSnHG1dMNJ6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jul 2009 20:16:45 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTPSA id 4EBA12C829
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jul 2009 20:16:45 +0000 (UTC)
Message-ID: <4A5B965B.9080908@gmail.com>
Date: Mon, 13 Jul 2009 22:17:31 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1MQN0M-0007Vp-D6@melo.openembedded.org>
	<200907132000.15889.marcin@juszkiewicz.com.pl>
In-Reply-To: <200907132000.15889.marcin@juszkiewicz.com.pl>
Subject: Re: [oe-commits] Marco Cavallini : Added machine taskit Stamp9G20 Evaluation Board
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
X-List-Received-Date: Mon, 13 Jul 2009 20:30:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz ha scritto:
> Dnia poniedzia=C5=82ek, 13 lipca 2009 o 16:59:46 git version control=20
> napisa=C5=82(a):
>=20
>> +++ b/conf/machine/stamp9g20evb.conf
>> @@ -0,0 +1,26 @@
>> +#@TYPE: Machine
>> +#@Name: taskit Stamp9G20 Evaluation Board
>> +#@DESCRIPTION: Machine configuration for the Stamp9G20 Evaluation=20
>> +#@MAINTAINER: Marco Cavallini <m.cavallini@koansoftware.com>=20
>=20
> Can you add URL to homepage of board (if such exists)?

I thought it was unnecessary because none of the machine has such info
into the recipe header. Is this a new rule?
http://www.taskit.de/en/products/stamp9g20/index.htm

/marco



