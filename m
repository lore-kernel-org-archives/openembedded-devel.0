Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JFvx3-0002IN-Oa
	for openembedded-devel@openembedded.org; Fri, 18 Jan 2008 19:28:25 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JFvx3-0006u7-4l
	for openembedded-devel@openembedded.org; Fri, 18 Jan 2008 18:28:25 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 18 Jan 2008 18:28:25 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 18 Jan 2008 18:28:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 18 Jan 2008 19:28:14 +0100
Message-ID: <fmqr3t$l8g$1@ger.gmane.org>
References: <E1JF7vM-0000k1-Mc@linuxtogo.org>	<413710907.20080117131841@gmail.com>	<478F4876.9030405@student.utwente.nl>	<1012527691.20080117145250@gmail.com>
	<fmnp24$rob$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <fmnp24$rob$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] org.oe.dev apm: turn off wifi cards before suspend so they are fully reloaded upon resume. closes 3664.
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
X-List-Received-Date: Fri, 18 Jan 2008 18:28:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rolf Leggewie schrieb:
> http://oz.leggewie.org/wip/wifi-suspend.patch

committed with some more minor improvements (most notable being
RRECOMMENDS instead of RDEPENDS; thanks mickey) as
157be493d58806df1aa6f89ba3922778bf6d6302



