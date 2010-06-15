Received: from mk-filter-3-a-1.mail.uk.tiscali.com ([212.74.100.54])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <superaorta@gmail.com>) id 1OOQSH-00073i-Do
	for Openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 09:21:06 +0200
X-Trace: 418660933/mk-filter-3.mail.uk.tiscali.com/B2C/$b2c-THROTTLED-DYNAMIC/b2c-CUSTOMER-DYNAMIC-IP/79.70.159.171/None/superaorta@gmail.com
X-SBRS: None
X-RemoteIP: 79.70.159.171
X-IP-MAIL-FROM: superaorta@gmail.com
X-SMTP-AUTH: 
X-Originating-Country: GB/UNITED KINGDOM
X-MUA: KMail/1.9.9
X-IP-BHB: Once
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AsEaABfFFkxPRp+r/2dsb2JhbACBOgORGYYMgQCFD3GuKIdsLohUhRoE
X-IronPort-AV: E=Sophos;i="4.53,419,1272841200"; d="scan'208";a="418660933"
Received: from 79-70-159-171.dynamic.dsl.as9105.com ([79.70.159.171])
	by smtp.tiscali.co.uk with ESMTP; 15 Jun 2010 08:15:34 +0100
From: superaorta@gmail.com
To: Openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jun 2010 08:15:32 +0100
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <201006150815.32214.superaorta@gmail.com>
X-SA-Exim-Connect-IP: 212.74.100.54
X-SA-Exim-Mail-From: superaorta@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: comedi / angstrom
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
X-List-Received-Date: Tue, 15 Jun 2010 07:21:06 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


I would like to build comedi (www.comedi.org) for my beagle board. From the 
instructions for comedi, "you will need to havea correctly configured Linux 
kernel source tree".

I have built comedi on many platforms without trouble but I'm completely lost 
in Angstrom - I have the kernel source (2.6.29 from kernel.org) but I don't 
know where to find the config files. I have done this on and x86 host: 
http://www.angstrom-distribution.org/building-angstrom

I don't fancy building comedi using bitbake because I have not the slightest 
idea how to adapt it to this purpose. The easiest thing seems to me is to 
find the correctly configures kernel source and config files and install them 
on the beagleboard then build comedi locally.

Any advice? overwhelmed and stuck here.

Cheers,

SA



