Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JDPcS-0001td-2c
	for openembedded-devel@openembedded.org; Fri, 11 Jan 2008 20:32:44 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JDPc7-000243-Kt
	for openembedded-devel@openembedded.org; Fri, 11 Jan 2008 19:32:23 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 11 Jan 2008 19:32:23 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 11 Jan 2008 19:32:23 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 11 Jan 2008 20:32:12 +0100
Message-ID: <fm8g7r$r27$1@ger.gmane.org>
References: <47871C71.5020800@student.utwente.nl>	<fm79ef$hak$1@ger.gmane.org>	<47872B1A.9010400@student.utwente.nl>	<fm86uh$qa8$1@ger.gmane.org>	<fm8dm0$ikl$1@ger.gmane.org>
	<4787C194.4060907@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <4787C194.4060907@student.utwente.nl>
Sender: news <news@ger.gmane.org>
Subject: Re: mtn disapprove
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
X-List-Received-Date: Fri, 11 Jan 2008 19:32:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi schrieb:
> | If my suspicion is true, my suggestion for Zaurus-2.6.inc is
> 
> It isn't, the culprit is:
> 
> zaurus-2.6.inc:include conf/machine/include/tune-xscale.inc

Thanks for the quick turnaround on this insightful comments.

I will then move above line out of zaurus-2.6.inc and into poodle.conf,
zaurus-clamshell.inc and tosa.conf and everything should be alright, or
did I forget an Xscale non-clamshell modell?



