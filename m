Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KWsKr-0003TY-Gp
	for openembedded-devel@openembedded.org; Sat, 23 Aug 2008 14:35:17 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KWsJb-0003DR-5a
	for openembedded-devel@openembedded.org; Sat, 23 Aug 2008 12:33:59 +0000
Received: from ip-62-143-12-162.hsi.ish.de ([62.143.12.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 23 Aug 2008 12:33:59 +0000
Received: from no2spam by ip-62-143-12-162.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 23 Aug 2008 12:33:59 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 23 Aug 2008 14:33:52 +0200
Message-ID: <g8p03g$eih$1@ger.gmane.org>
References: <g8nfi3$viv$1@ger.gmane.org> <20080823070011.GA9448@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-12-162.hsi.ish.de
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
In-Reply-To: <20080823070011.GA9448@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: bitbake world
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
X-List-Received-Date: Sat, 23 Aug 2008 12:35:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> I see packages like packages/meta/meta-toolchain.bb being dropped that does not sound right to me. May be some of these recipes can be fixed for dependency issues instead of dropping them.

They were dropped locally so that the bitbake process at least 
continues.  The idea is not to drop them from OE but to look for why 
they produce unresolvable dependencies that bitbake cannot resolve. 
Sorry if that was unclear.



