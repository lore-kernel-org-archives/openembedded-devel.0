Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1J5IHN-0004nr-Dr
	for openembedded-devel@openembedded.org; Thu, 20 Dec 2007 11:05:25 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1J5ICJ-0004sz-M5
	for openembedded-devel@openembedded.org; Thu, 20 Dec 2007 10:00:11 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 20 Dec 2007 10:00:11 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 20 Dec 2007 10:00:11 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 20 Dec 2007 10:59:48 +0100
Message-ID: <fkdeel$p9o$1@ger.gmane.org>
References: <fkc9de$365$1@ger.gmane.org> <476A26BB.1010602@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <476A26BB.1010602@student.utwente.nl>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: drop quilt version 0.39
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
X-List-Received-Date: Thu, 20 Dec 2007 10:05:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi schrieb:
>> driven by bug 1960, I have been doing some work on quilt in OE,

> What are your good reasons to drop it? I see no point in removing stuff
> just to boost someones commit stats under the moniker "clean up"

Koen,

for the last time (I hope), please get help for your attitude problem.
OE does not need your misdirected accusations.

I asked for reasons *not* to drop it.  But since you - as always - are
determined to make other people's life more difficult than it really
needs to be, here is my answer as to why I think it should be dropped.

* had you bothered to look at the referenced bug you would have realized
  that it was not really me proposing to drop it initially.
* why keep old stuff (AKA cruft) longer than necessary?  Just so koen
  can bully fellow contributors?
* patches that apply fine to 0.45 and 0.46 don't apply cleanly to 0.39.
  This somehow gets into the way of how I reworked it.

IMHO that suffices to drop it unless there is good reason to keep it.
If there are, please state them.  And as you all know, OE is versioned
so if anybody were to want it back anytime in the future mtn would
gladly spew out the last known 0.39 version, I am sure.

Regards

Rolf



