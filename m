Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NAi9v-0007lX-7C
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 11:53:14 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NAi8X-0001LP-4y
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 10:51:45 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NAi8V-0003mL-Lo
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 10:51:43 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091117103442.6DD8014068@mzh.zlo.nu>
References: <20090812095518.GA21131@zlo.nu>
	<200908171521.07317.holger+oe@freyther.de>
	<20091117103442.6DD8014068@mzh.zlo.nu>
Date: Wed, 18 Nov 2009 10:51:40 +0000
Message-Id: <1258541500.26517.92.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] curl: Fix CVE-2009-2417.
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
X-List-Received-Date: Wed, 18 Nov 2009 10:53:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-11-17 at 11:13 +0100, Marc Olzheim wrote:
> For some reason, my patch never landed and 7.19.6 was added in the mean time,
> which fixed this problem, but we still need the patches for previous versions.
> 
> The 7.18.1 patch applies cleanly on 7.18.2.
> 
> See http://curl.haxx.se/docs/adv_20090812.html for more information.

Thanks for the patch.  I checked this in.

p.




