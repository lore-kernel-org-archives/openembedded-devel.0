Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R3qvy-00033B-SK
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 16:59:30 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R3qr0-0004ui-LR
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 16:54:22 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Sep 2011 15:54:21 +0100
In-Reply-To: <1316010273.6686.105.camel@mattotaupa>
References: <cover.1316006259.git.otavio@ossystems.com.br>
	<1eb2612347e83d9906021429768912fcd036951a.1316006259.git.otavio@ossystems.com.br>
	<1316010273.6686.105.camel@mattotaupa>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1316012062.27603.1.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/1] xorg-xserver-common.inc: usr ${datadir} instead of /usr/share
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
X-List-Received-Date: Wed, 14 Sep 2011 14:59:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 16:24 +0200, Paul Menzel wrote:
> Am Mittwoch, den 14.09.2011, 13:18 +0000 schrieb Otavio Salvador:
> 
> There is a typo in the commit summary: s/usr/use/.
> 
> What distributions do not use `/usr/`?

Micro doesn't, for one.

p.




