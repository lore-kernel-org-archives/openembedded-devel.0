Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MoBUw-00041a-BN
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 09:33:49 +0200
Received: from [81.170.68.179] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MoBUO-0003yL-Bj
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 08:33:12 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0909161456r48c25a89n5d3e902e2f98b089@mail.gmail.com>
References: <c384c5ea0909161456r48c25a89n5d3e902e2f98b089@mail.gmail.com>
Date: Thu, 17 Sep 2009 08:33:10 +0100
Message-Id: <1253172790.4490.1392.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 81.170.68.179
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Fetch machine type list for ARM architectures
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
X-List-Received-Date: Thu, 17 Sep 2009 07:33:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-09-16 at 23:56 +0200, Leon Woestenberg wrote:
> Hello,
> 
> two (known) ARM machines currently have kernel support but their
> "mach-types" file in arch/arm/tools/ is not up-to-date.

How did this situation come about?  The mach-types file is normally one
of the first things to be updated in the upstream kernel; I can't think
of any obvious reason why that should not have happened if the patches
to add the actual machine support have already landed in the tree.

p.




