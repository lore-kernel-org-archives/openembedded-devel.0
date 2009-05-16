Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M5KDU-0003kp-7W
	for openembedded-devel@openembedded.org; Sat, 16 May 2009 15:46:20 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M5K6a-0006GP-9Q
	for openembedded-devel@openembedded.org; Sat, 16 May 2009 13:39:12 +0000
Received: from p5b3b17f2.dip.t-dialin.net ([91.59.23.242])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 16 May 2009 13:39:12 +0000
Received: from no2spam by p5b3b17f2.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 16 May 2009 13:39:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 16 May 2009 15:38:57 +0200
Message-ID: <gumflk$t6s$1@ger.gmane.org>
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>
	<gulv2v$l9r$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b17f2.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <gulv2v$l9r$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: what not to do in a recipe (was: Kernel modules)
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
X-List-Received-Date: Sat, 16 May 2009 13:46:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> And it can't be said enough:
> 
> NEVER use rdepends to drag in kernelmodules, use rrecommends instead

Thank you for pointing this out.  I was unaware of it and thought it 
would be a good idea to document such common mistakes in the wiki.

http://wiki.openembedded.net/index.php/Common_mistakes_in_a_recipe

Please add any other FMM (frequently made mistake).  To keep the list 
readable, let's focus on mistakes that lead to serious problems.



