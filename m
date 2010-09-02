Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Or5lb-0006nN-EG
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 11:07:32 +0200
Received: from [192.168.1.14] (e180147196.adsl.alicedsl.de [85.180.147.196])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 0AF80584199
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Sep 2010 11:11:49 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1081)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <AANLkTinbOUUS3vw+yoHqaMRELMGyC_Xikf-QH8CWsOLQ@mail.gmail.com>
Date: Thu, 2 Sep 2010 11:06:56 +0200
Message-Id: <6A0959E7-8C24-4F4B-BD61-73E4EF0AB687@vanille-media.de>
References: <AANLkTimDF5zZ-F3-GDe_OUJv3nFKD+YGn4_7xWYuEatc@mail.gmail.com>
	<AANLkTinbOUUS3vw+yoHqaMRELMGyC_Xikf-QH8CWsOLQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] openocd-native_svn.bb
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
X-List-Received-Date: Thu, 02 Sep 2010 09:07:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Am 02.09.2010 um 11:01 schrieb Frans Meulenbroeks:
> 2010/8/6 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> Hi, I bumped upon openocd-native_svn.bb and I was wondering why we =
have that.
>> No-one seems to depend on it.
>> Do we want our own openocd instead of the one that is on the host?
>> Or should this be removed?

IIRC I have added this recipe when I worked with the
Openmoko devices which needed a custom version of openocd-native
(built out of the OM SVN) to debug.

Until we have verified that the specifics have moved upstream,
I'd like to keep this.

Cheers,

Mickey.



