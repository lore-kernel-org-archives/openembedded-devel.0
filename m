Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N9j8r-0001kB-0q for openembedded-devel@lists.openembedded.org;
	Sun, 15 Nov 2009 18:44:04 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N9j7W-0004H8-Vj
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Nov 2009 18:42:39 +0100
Received: from 91.213.169.4 ([91.213.169.4])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2009 18:42:38 +0100
Received: from dbaryshkov by 91.213.169.4 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2009 18:42:38 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Sun, 15 Nov 2009 17:42:26 +0000 (UTC)
Message-ID: <hdpei2$9pm$1@ger.gmane.org>
References: <E1N9c2H-0004ay-Ni@melo.openembedded.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 91.213.169.4
User-Agent: Pan/0.132 (Waxed in Black)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Michael 'Mickey' Lauer : ltrace: fix wrong path to	coreutils-native and add actual dependency
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
X-List-Received-Date: Sun, 15 Nov 2009 17:44:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

git version control wrote:

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 7df40b3378412f4700224e44042656159bc8f86c URL:   
> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=7df40b3378412f4700224e44042656159bc8f86c
> 
> Author: Michael 'Mickey' Lauer
> <mickey@vanille-media.de> Date:   Sun Nov 15
> 11:08:43 2009 +0100
> 
> ltrace: fix wrong path to coreutils-native and add actual dependency

Hmmm. This broke ltrace for me (install.coreutils-native not found).
Do you have any pending patches on coreutils-native?

-- 
With best wishes
Dmitry




