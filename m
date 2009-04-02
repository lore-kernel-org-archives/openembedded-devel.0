Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LpDLU-0007jj-W3
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 05:12:03 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx03.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LpDJB-0006jM-UV
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 22:09:38 -0500
Message-ID: <49D42C75.9090805@dls.net>
Date: Wed, 01 Apr 2009 22:09:41 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-SA-Exim-Connect-IP: 216.145.245.199
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_05,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: 2.6.29 kernel bloat
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
X-List-Received-Date: Thu, 02 Apr 2009 03:12:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The IXP4xx kernel for 2.6.29 has jumped 85 KB in size (1105K on
2.6.27.8, vs 1190K for 2.6.29).  The defconfig is the same, or as nearly
as I can make it (make ARCH=arm oldconfig, answer "N" to everything).

Anyone else observed this, or have I missed something?

Mike (mwester)


