Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QbV94-0005Qu-0b
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 12:03:50 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QbV5X-0000Ph-4W
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 12:00:11 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4E09A393.2050000@nedap.com>
References: <4E09926B.2000406@nedap.com>
	<BANLkTikvCycdv2g58Z_m3_14yj=nA9-+xg@mail.gmail.com>
	<4E09A393.2050000@nedap.com>
Date: Tue, 28 Jun 2011 11:00:09 +0100
Message-ID: <1309255209.15156.7.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: how to change system files
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
X-List-Received-Date: Tue, 28 Jun 2011 10:03:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-28 at 11:49 +0200, Jaap de Jong wrote:
> Yeah, but what if I decide at a certain point in time to change the 
> /etc/network/interfaces file?
> Normally I would increment PR in the bb file and then build it.
> And finally at the target I would do opkg upgrade.

Just the same.  Increment PR in your .bbappend, rebuild, opkg upgrade.

p.




