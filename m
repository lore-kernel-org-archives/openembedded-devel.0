Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K69xB-0006gX-37
	for openembedded-devel@openembedded.org; Tue, 10 Jun 2008 21:56:25 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K69ru-000626-N7
	for openembedded-devel@openembedded.org; Tue, 10 Jun 2008 19:50:58 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 10 Jun 2008 19:50:58 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Jun 2008 19:50:58 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 10 Jun 2008 21:50:50 +0200
Message-ID: <g2mluq$ff6$1@ger.gmane.org>
References: <g2h415$pk1$1@ger.gmane.org> <484ED558.7070907@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008060303)
In-Reply-To: <484ED558.7070907@bolloretelecom.eu>
Sender: news <news@ger.gmane.org>
Subject: Re: pkg_postinst_* not working anymore -> broken packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 10 Jun 2008 19:56:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Jeremy Lainé wrote:
> Any chance of getting bitbake commit r1072 backed out soon (the one that
> broke the postins* scripts), because for now pinning to r1071 is pretty
> much the only sane way to get a sane build environment?

r1075 does that. Various package alsa have had a PR bump to fix 
downstream feeds.

regards,

Koen

>
> Cheers,
> Jeremy




