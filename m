Received: from opensource.wolfsonmicro.com ([80.75.67.52]
	helo=opensource2.wolfsonmicro.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@opensource.wolfsonmicro.com>) id 1OmToV-000141-MQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 17:47:28 +0200
Received: from [172.20.20.118] (lumison.wolfsonmicro.com [87.246.78.27])
	by opensource2.wolfsonmicro.com (Postfix) with ESMTPSA id 12034110292; 
	Fri, 20 Aug 2010 16:47:06 +0100 (BST)
From: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C6E920E.4030806@balister.org>
References: <1282294508.6198.27.camel@dpdev> <4C6E920E.4030806@balister.org>
Date: Fri, 20 Aug 2010 16:47:18 +0100
Message-ID: <1282319238.17914.5.camel@dpdev>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 80.75.67.52
X-SA-Exim-Mail-From: dp@opensource.wolfsonmicro.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: broonie@opensource.wolfsonmicro.com
Subject: Re: udev hangs on boot
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
X-List-Received-Date: Fri, 20 Aug 2010 15:47:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

> Look in /etc/network/interfaces (I think, not at a desk where I can 
> check) and comment out the line auto eth0. I think the bootscripts take 
> the interface down and up and that is bad if you are using root over nfs.

It seems that udev still hangs. Nevertheless, I can still ping the
device.

Thanks,
Dimitrios



