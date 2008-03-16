Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JaqKU-00066D-Lw
	for openembedded-devel@openembedded.org; Sun, 16 Mar 2008 11:43:04 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JaqI2-0004A9-Fy
	for openembedded-devel@openembedded.org; Sun, 16 Mar 2008 10:40:30 +0000
Received: from ip-62-143-227-4.1411n-cud12k-01.ish.de ([62.143.227.4])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 16 Mar 2008 10:40:30 +0000
Received: from no2spam by ip-62-143-227-4.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 16 Mar 2008 10:40:30 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 16 Mar 2008 11:40:21 +0100
Message-ID: <fritel$j9n$1@ger.gmane.org>
References: <fpmn1u$53v$1@ger.gmane.org>	<fqhsvd$mdm$1@ger.gmane.org>	<fqi1q5$77t$1@ger.gmane.org>	<fqi970$rdg$1@ger.gmane.org>	<fqiah1$uja$1@ger.gmane.org>	<fqrglf$3pg$1@ger.gmane.org>
	<fr3ojj$c4b$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-4.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <fr3ojj$c4b$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: autobuilds and bug tracker
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
X-List-Received-Date: Sun, 16 Mar 2008 10:43:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Please apply it, I just made other changes to sepukku that will make
> autobuild bug management easier.

Thank you for your work. I have committed the last two changes I was
looking for as

219fa4485d47101df96e2d47c358fe5617f1f2d8
41716f313f0efdbc890ccb2a7a5d8c24cae3ed69

Please report back if there are any unexpected problems.



