Received: from [85.33.2.28] (helo=smtp-out28.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1LxlKQ-0007na-FH
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Apr 2009 19:06:14 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out28.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 25 Apr 2009 19:01:15 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sat, 25 Apr 2009 19:01:14 +0200
Received: from [192.168.1.107] ([79.51.132.190]) by FBCMCL01B07.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 25 Apr 2009 18:55:45 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1240511199-30422-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240511199-30422-1-git-send-email-marcin@juszkiewicz.com.pl>
Date: Sat, 25 Apr 2009 19:03:31 +0200
Message-Id: <1240679011.9117.5.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 25 Apr 2009 16:55:45.0312 (UTC)
	FILETIME=[ACFB5A00:01C9C5C6]
Subject: Re: [STABLE] Add support for BUG device from Bug Labs
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
X-List-Received-Date: Sat, 25 Apr 2009 17:06:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-04-23 at 20:26 +0200, Marcin Juszkiewicz wrote:
> At Bug Labs we used Poky for development of our BUG Linux. Some time ago
> we decided to move to OpenEmbedded as it has more development going on.
> 
> Creating of stable/2009 branch was suggested by me to make good working
> base for our next release.
> 
> Those 4 patches adds support for building normal images for our device.
> Java stuff which we use is still only in our public repository.
Great...I wanted to do that but I didn't have the time to do it and at
the end I have forgotten to do it.
It would be even better if we also push/adapt theses patches to .dev
Denis.




