Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JSCKn-0008Qd-Dr
	for openembedded-devel@openembedded.org; Thu, 21 Feb 2008 15:24:17 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JSCKc-0003RM-5d
	for openembedded-devel@openembedded.org; Thu, 21 Feb 2008 14:23:26 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 21 Feb 2008 14:23:26 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 21 Feb 2008 14:23:26 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 21 Feb 2008 15:23:17 +0100
Message-ID: <fpk1gk$57h$1@ger.gmane.org>
References: <E1JRbhB-0000nu-DN@linuxtogo.org>	<20080220015817.1e33f547@widy.localdomain>	<20080220020418.1e4dda5a@widy.localdomain>	<1203502545.6860.13.camel@hammer.suse.cz>	<20080220155339.67aed5d4@widy.localdomain>	<fphs3l$jcj$1@ger.gmane.org>	<20080220212639.6e24e7ab@widy.localdomain>	<fpjle1$p10$1@ger.gmane.org>	<20080221140439.2612fffe@widy.localdomain>	<fpjrg3$ef9$1@ger.gmane.org>
	<20080221151126.243a718f@widy.localdomain>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <20080221151126.243a718f@widy.localdomain>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: what is a fixed bug?
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
X-List-Received-Date: Thu, 21 Feb 2008 14:24:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> it cannot change immediately to something else.
> 
> Otherwise, I'm all for the changes you propose 

Great.  Sorry I missed that drift.

I am certainly more than willing to try and understand the Angstrom
position and accomodate them where possible (I think that should have
been clear from my previous responses where I indicated the benefit I
see for A*).  Angstrom plays an important role for OE, no doubt about that.

> - if they will work.

I'd propose to try the process out.  I think you will even like it.
Maybe I was also misunderstood in that I think we need to have two bugs
for everything now, absolutely not.  My proposition is to just close
bugs when a fix has been pushed to .dev.  Angstrom should then keep a
watch on things and if necessary clone a bug that still needs fixing in
.stable (when for some reason the push cannot be done immediately).
Take look at bug 3838 which I created for illustration purposes of how I
think this should be done.

Regards

Rolf



