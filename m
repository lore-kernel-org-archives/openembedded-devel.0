Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWrn8-0006Zh-2u
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 17:14:02 +0200
Received: by wwb17 with SMTP id 17so486701wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 08:10:35 -0700 (PDT)
Received: by 10.216.0.206 with SMTP id 56mr2232549web.112.1308150635273;
	Wed, 15 Jun 2011 08:10:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id u64sm312172weq.4.2011.06.15.08.10.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2011 08:10:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DF8CAB7.8020403@dresearch-fe.de>
Date: Wed, 15 Jun 2011 17:10:29 +0200
Message-Id: <6FAE1562-AA38-44BC-B757-01AC8EB65BD9@dominion.thruhere.net>
References: <4DF735B3.1020106@dresearch-fe.de>	<4DF767F9.3070500@dresearch-fe.de>	<4DF77D33.7080407@mentor.com>	<4DF8B96D.7090605@dresearch-fe.de>
	<itae90$9a0$1@dough.gmane.org> <4DF8CAB7.8020403@dresearch-fe.de>
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Mailer: Apple Mail (2.1084)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request (resume)
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
X-List-Received-Date: Wed, 15 Jun 2011 15:14:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 jun 2011, om 17:07 heeft Steffen Sledz het volgende geschreven:

> On 15.06.2011 16:06, Koen Kooi wrote:
>> Which commits are in that branch? Could you please post a pull =
request
>> formatted similar to the other requests?
>=20
> Is there a guide which informationen such a message should contain in =
which format?
>=20
> Can git prepare a summary for it (i just branched from =
2011.03-maintenance and cherry-picked some commits from master)?

I tend to use this one:

koen@dominion:/OE/angstrom-2008/sources/openembedded$ git shortlog =
origin/2011.03-maintenance..2011.03-maintenance
Koen Kooi (1):
      x-load git: 1.5.0 sorts lower than 1.44ss, so bump PE

But you could also use:

koen@dominion:/OE/angstrom-2008/sources/openembedded$ git cherry -v
+ 067da6cb5ce5aac4a793fdf59769ff5cc0eadce4 x-load git: 1.5.0 sorts lower =
than 1.44ss, so bump PE



