Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JUflq-0002m1-AD
	for openembedded-devel@openembedded.org; Thu, 28 Feb 2008 11:13:52 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JUfl3-0001yK-RE
	for openembedded-devel@openembedded.org; Thu, 28 Feb 2008 10:12:57 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 28 Feb 2008 10:12:57 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 28 Feb 2008 10:12:57 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 28 Feb 2008 11:12:50 +0100
Message-ID: <fq61f2$h36$1@ger.gmane.org>
References: <47C3D204.9090908@dominion.kabel.utwente.nl>	<47C411C8.5030204@balister.org>	<fq192i$nqe$1@ger.gmane.org>
	<47C64C08.3060700@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <47C64C08.3060700@gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=AWL, RDNS_NONE, TVD_SPACE_RATIO
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit 9b9a2409c7e2ddb2caf0a5aba74549f65c52b503
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2008 10:13:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Junqian Gordon Xu wrote:
> conf/sane-srcrevs.inc should be conf/distro/include/sane-srcrevs.inc

Thanks for spotting.  Fixed in b19cee795937802e29fe481b97ba2b84666fb85b.



