Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JSADt-0000Vb-7l
	for openembedded-devel@openembedded.org; Thu, 21 Feb 2008 13:08:50 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JSADi-0005JH-0r
	for openembedded-devel@openembedded.org; Thu, 21 Feb 2008 12:08:10 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 21 Feb 2008 12:08:10 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 21 Feb 2008 12:08:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 21 Feb 2008 13:07:59 +0100
Message-ID: <fpjpiv$7l9$1@ger.gmane.org>
References: <fb8538570802200452r5d4360f2ld6330218f4c5c0b6@mail.gmail.com>	<20080220213121.69007f37@widy.localdomain>	<1203591205.6860.103.camel@hammer.suse.cz>
	<20080221131810.2f58c40e@widy.localdomain>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <20080221131810.2f58c40e@widy.localdomain>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Angstrom-devel] Best place to send new/updated bb files?
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
X-List-Received-Date: Thu, 21 Feb 2008 12:08:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I have just added the bb and patch keywords to the keyword list
http://bugs.openembedded.org/editkeywords.cgi

keywords are essentially tags and can help us with the multi-dimension
problems we have.  But then again, unlike meta-bugs they don't have
email notification.  They are a tool for aiding bugzilla search.  AFAIK,
it is possible to restrict power to change those tags to certain groups
of bugzilla users which is something we might want to use (if we had a
triaged keyword, for example.  Thinking about it, I'll add that keyword,
too, for experimenting with it)



