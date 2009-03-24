Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1LmEp3-0002iZ-7V
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 23:10:14 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.107]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1LmEnL-0001Us-SF
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 06:08:40 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <49C94FFC.1040604@gmx.de>
References: <49C94FFC.1040604@gmx.de>
Date: Tue, 24 Mar 2009 16:08:16 -0600
Message-Id: <1237932496.16710.22.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 70.73.132.19
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Re: python-ecore_svn fails
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
X-List-Received-Date: Tue, 24 Mar 2009 22:10:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-03-24 at 22:26 +0100, Stefan Buschmann wrote:
> Hi all,
> 
> I'm trying to build fso-zhone-image for my freerunner, but I get the 
> following error message in python-ecore-0.3.1+svnr39502-ml0:
> 
> ecore/evas/ecore.evas.c_ecore_evas.c:19373: error: 
> 'ECORE_EVAS_ENGINE_SDL' undeclared (first use in this function)
> 
> The build system is KUbuntu-8.10 (32 Bit), build-log and local.conf are 
> attached.
> 
> BTW, I've checked out only the OE tree from 
> git://git.openembedded.net/openembedded. Is this correct, or do I need a 
> different mirror/overlay for OpenMoko/FSO? I'm still a little bit 
> confused about the different OpenMoko-repositories ;-)
> 
> Thanks,
> 
> Stefan
> 


You should probably try the fso/milestone5.1 or fso/milestone5.5 branch.
The 5.5 branch is changing almost daily, so if you're looking for
stability go for the 5.1 branch.

Angus



