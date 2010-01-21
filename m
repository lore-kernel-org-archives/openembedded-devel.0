Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NXuBH-0001sD-Is
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 11:22:30 +0100
Received: from [192.168.1.8] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id A88DD58412A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 12:12:06 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1077)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <201001211102.11252.holger+oe@freyther.de>
Date: Thu, 21 Jan 2010 11:20:13 +0100
Message-Id: <883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<201001211102.11252.holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Thu, 21 Jan 2010 10:22:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Am 21.01.2010 um 11:02 schrieb Holger Hans Peter Freyther:

>>=20
>> 2. Is there a way to have a staging branch where all patches are
>> committed to, which have not been reviewed for let us say one week, =
to
>> get more testing and before they go into the dev branch? Maybe it is
>> easier for people to at least test build such a branch?
>=20
> Would you be interested in creating such a branch for us? I assume it =
is=20
> certainly easier to git cherry-pick a patch than to download the mbox =
and use=20
> git am..

I fully agree. I'm neither using patchwork nor do I find patches on the =
list a good idea.
I'd welcome for-oe-upstream trees that would contain patches that -- if =
good -- we could
just pull from.

:M:



