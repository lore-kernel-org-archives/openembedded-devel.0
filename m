Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1ObHZu-0006EG-1v
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 20:30:07 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1ObHZi-0000vK-P2 from Tom_Rini@mentor.com ;
	Tue, 20 Jul 2010 11:29:54 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 20 Jul 2010 11:29:54 -0700
Received: from [172.30.80.25] ([172.30.80.25]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 20 Jul 2010 12:29:53 -0600
Message-ID: <4C45EB1A.1060407@mentor.com>
Date: Tue, 20 Jul 2010 11:29:46 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: Andreas Fenkart <andreas.fenkart@streamunlimited.com>
References: <20100720112607.GA9142@biggy>
In-Reply-To: <20100720112607.GA9142@biggy>
X-OriginalArrivalTime: 20 Jul 2010 18:29:53.0195 (UTC)
	FILETIME=[8BAF27B0:01CB2839]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/1] gcc-cross-sdk: fix C++ headers include, bump PR.
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
X-List-Received-Date: Tue, 20 Jul 2010 18:30:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Andreas Fenkart wrote:
> Hi
> 
> The location of C++ headers has changed in gcc-cross-sdk_4.3.x
> and above. See error message during packaging step:
> 
> NOTE: the following files were installed but not shipped in any package:
> NOTE: /opt/angstrom/arm/arm-angstrom-linux-uclibcgnueabi/include/c++/4.3.2/ios
> NOTE: /opt/angstrom/arm/arm-angstrom-linux-uclibcgnueabi/include/c++/4.3.2/map
> NOTE: /opt/angstrom/arm/arm-angstrom-linux-uclibcgnueabi/include/c++/4.3.2/new
> ...

I'm looking into these patches and the possible reasons for this and 
that to happen as it does.

-- 
Tom Rini
Mentor Graphics Corporation


