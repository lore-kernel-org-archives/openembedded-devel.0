Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NN2oP-0005uI-Iw
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 12:22:00 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6E17211000A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 12:20:07 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E57401100092
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 12:20:06 +0100 (CET)
Received: from rhein.familie-heinold.de (g225074124.adsl.alicedsl.de
	[92.225.74.124]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 12:20:06 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 2E4FC3C112; Tue, 22 Dec 2009 12:20:06 +0100 (CET)
Date: Tue, 22 Dec 2009 12:20:06 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091222112005.GA21050@rhein.zuhause.netz>
References: <op.u5bvk31emn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
In-Reply-To: <op.u5bvk31emn1qzu@guohr-laptop-ubuntu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: compiling dietlibc failed when DISTRO = "minimal" and MACHINE = "qemux86"
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
X-List-Received-Date: Tue, 22 Dec 2009 11:22:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

sorry I didnt test it with i386 yet. But seems that the strip of diet somehow effected compilation, because
the compilation of elftrunc segfaults now. Maybee its my patch, which let diet compile with ccache.
And sorry that I dont have the time to look at it closer.

Bye Henning


