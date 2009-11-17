Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NAPEt-0008Se-Rw
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 15:41:06 +0100
Received: from tamarin.localnet (siminn-int-gw.on-waves.com [157.157.59.158])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 9492D1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 14:50:59 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Nov 2009 15:39:34 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <20090812095518.GA21131@zlo.nu>
	<200908171521.07317.holger+oe@freyther.de>
	<20091117103442.6DD8014068@mzh.zlo.nu>
In-Reply-To: <20091117103442.6DD8014068@mzh.zlo.nu>
MIME-Version: 1.0
Message-Id: <200911171539.34668.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
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
X-List-Received-Date: Tue, 17 Nov 2009 14:41:07 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 17 November 2009 11:13:54 Marc Olzheim wrote:
> For some reason, my patch never landed and 7.19.6 was added in the mean
>  time, which fixed this problem, but we still need the patches for previous
>  versions.
> 
> The 7.18.1 patch applies cleanly on 7.18.2.
> 
> See http://curl.haxx.se/docs/adv_20090812.html for more information.



Oops... I will try to land this one...


