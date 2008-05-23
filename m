Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JzQdX-00061A-HJ
	for openembedded-devel@openembedded.org; Fri, 23 May 2008 08:20:20 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JzQaq-00043k-6V
	for openembedded-devel@openembedded.org; Fri, 23 May 2008 06:17:32 +0000
Received: from ip-62-143-23-251.hsi.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 23 May 2008 06:17:32 +0000
Received: from no2spam by ip-62-143-23-251.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 23 May 2008 06:17:32 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 23 May 2008 08:17:22 +0200
Message-ID: <g15nhi$uls$1@ger.gmane.org>
References: <70c9a9110805220710x6663f582lc5d6b75744960d08@mail.gmail.com>	<70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>	<g14do2$eur$1@ger.gmane.org>
	<1211500970.10806.14.camel@isis>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.hsi.ish.de
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
In-Reply-To: <1211500970.10806.14.camel@isis>
Sender: news <news@ger.gmane.org>
Subject: Re: GCC 4.3 fails to build glibc(-intermediate)
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
X-List-Received-Date: Fri, 23 May 2008 06:20:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> in this changeset the preferred gcc version has been changed from 
> 4.2.3+csl-arm-2008q1-126 to 4.2.1+csl-arm-2007q3-53

yet, this is the one introducing the breakage.
860bccc90a045f54a0fd143d4759959d43643350 breaks, its ancestor
6f13b55b6143b51806ac9213c2d9af80e5be34bd builds still fine.



