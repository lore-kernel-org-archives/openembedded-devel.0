Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JDdmb-0004Ss-Tb
	for openembedded-devel@openembedded.org; Sat, 12 Jan 2008 11:40:11 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JDdmH-0000tn-83
	for openembedded-devel@openembedded.org; Sat, 12 Jan 2008 10:39:49 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 12 Jan 2008 10:39:49 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 12 Jan 2008 10:39:49 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 12 Jan 2008 11:39:33 +0100
Message-ID: <fma5d5$5k5$1@ger.gmane.org>
References: <47871C71.5020800@student.utwente.nl>	<fm79ef$hak$1@ger.gmane.org>	<47872B1A.9010400@student.utwente.nl>	<fm86uh$qa8$1@ger.gmane.org>	<fm8dm0$ikl$1@ger.gmane.org>	<4787C194.4060907@student.utwente.nl>
	<fm8g7r$r27$1@ger.gmane.org> <1200093760.6074.2.camel@HD>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <1200093760.6074.2.camel@HD>
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
X-List-Received-Date: Sat, 12 Jan 2008 10:40:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Thomas,

thank you for your suggestion.  Please correct me if I misunderstand you.

Thomas Kunze schrieb:
> I would also move the PACKAGE_ARCH stuff.

You suggest to move the PACKAGE_ARCH stuff out of the inc file and into
the individual config files?  For what benefit?  They are common for all
machines except for the collie, so I believe .inc is the best place for
that.

Regards

Rolf



