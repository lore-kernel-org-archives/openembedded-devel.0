Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MPBEi-0001zc-WA
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jul 2009 10:13:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 673112CA01
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 08:00:16 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z5jS+tImBIJO
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 08:00:15 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id BB1842C9FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 08:00:14 +0000 (UTC)
Message-ID: <4A56F55E.8010000@gmail.com>
Date: Fri, 10 Jul 2009 10:01:34 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200907091522.22285.marcin@juszkiewicz.com.pl>	<4A55FF61.8020501@gmail.com>
	<200907091711.27475.marcin@juszkiewicz.com.pl>
In-Reply-To: <200907091711.27475.marcin@juszkiewicz.com.pl>
Subject: Re: [RFC] Updating stable patches in linux recipes
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
X-List-Received-Date: Fri, 10 Jul 2009 08:13:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz ha scritto:
> Dnia czwartek, 9 lipca 2009 o 16:32:01 Marco Cavallini napisa=C5=82(a):
>=20
>> that's a good idea, but could drive to a huge overhead.
>> What do you mean exactly with latest stable updates?
>> How frequently would you check the stable patch availability?
>=20
> I track kernel version RSS daily but work on kernel recipes less often.=
=20
> But when I work on them I would like to know is it ok to bump it or=20
> should I contact each developer who use recipe to get Ack from them.

+1 from me,
although I still have some doubts

1. how do you know who is responsible for each recipe, considering that
many of them haven't a proper header showing that.

2. many recipes are often used by other recipes, how can you check all
possibilities?

thx

/marco


