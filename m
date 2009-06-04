Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MCJ8f-0001Az-2V
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 22:02:13 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KKQ0037KCK7NBFC@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	04 Jun 2009 14:52:55 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4719814AF5F; Thu,
	04 Jun 2009 15:52:55 -0400 (EDT)
Date: Thu, 04 Jun 2009 15:52:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090604195255.GA24772@denix.org>
References: <58E23116-2D95-4C1C-8C17-EDA168C129F9@mac.com>
	<200906040644.46800.zecke@selfish.org>
	<E1863E56-343C-41E8-8E9E-2E911CD12F39@mac.com>
	<200906041108.35572.zecke@selfish.org>
MIME-version: 1.0
In-reply-to: <200906041108.35572.zecke@selfish.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: How to fix OE missing checksum error for	some?rt2570-k2wrlz recipe
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
X-List-Received-Date: Thu, 04 Jun 2009 20:02:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jun 04, 2009 at 11:08:35AM +0200, Holger Freyther wrote:
> On Thursday 04 June 2009 07:40:12 Elvis Dowson wrote:
> > Here is what I can see in my tmp/checksums.ini.
> >
> > [http://homepages.tu-darmstadt.de/~p_larbig/wlan/rt2570-k2wrlz-1.6.4.tar.bz
> >2 ]
> > md5=21f6e873ad7ee34843dbcd1204f9eda3
> > sha256=5b2d382504d0aee14cf24f0eb3c483a79c712f8aa1ca027a7d4425891f1bb2ec
> 
> Please send a patch, it is more easy to apply, it will be recorded by 
> patchwork and will not fall through the cracks.

And don't forget to sort the checksums file before making the patch with the 
contrib/source-checker/oe-checksums-sorter.py

-- 
Denys


