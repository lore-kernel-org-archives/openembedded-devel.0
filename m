Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MDRwV-0008W9-Nw
	for openembedded-devel@openembedded.org; Mon, 08 Jun 2009 01:38:23 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MDRnL-0001Xt-KH
	for openembedded-devel@openembedded.org; Sun, 07 Jun 2009 23:28:55 +0000
Received: from p3077-ipngn201marunouchi.tokyo.ocn.ne.jp ([114.177.118.77])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 07 Jun 2009 23:28:55 +0000
Received: from no2spam by p3077-ipngn201marunouchi.tokyo.ocn.ne.jp with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 07 Jun 2009 23:28:55 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 08 Jun 2009 08:28:41 +0900
Message-ID: <h0hifc$hf0$1@ger.gmane.org>
References: <20090607175542.GA26712@fh-wedel.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p3077-ipngn201marunouchi.tokyo.ocn.ne.jp
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <20090607175542.GA26712@fh-wedel.de>
Sender: news <news@ger.gmane.org>
Subject: Re: Still not solved: glibc-dbg and insane.bbclass
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
X-List-Received-Date: Sun, 07 Jun 2009 23:38:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Martin Dietze wrote:
>  just as my build broke again wiht this issue:
> glibc-package.bbclass defines PACKAGES which always contains
> glibc-dbg, however the build is without debug symbols for build
> time reasons. 

Sounds a lot like Ihttp://bugs.openembedded.net/show_bug.cgi?id=5149



