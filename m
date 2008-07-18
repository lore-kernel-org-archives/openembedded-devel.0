Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KJoID-0004Sx-IX
	for openembedded-devel@openembedded.org; Fri, 18 Jul 2008 13:38:33 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KJoHQ-0001av-PT
	for openembedded-devel@openembedded.org; Fri, 18 Jul 2008 11:37:44 +0000
Received: from ip-62-143-12-162.hsi.ish.de ([62.143.12.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 18 Jul 2008 11:37:44 +0000
Received: from no2spam by ip-62-143-12-162.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 18 Jul 2008 11:37:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 18 Jul 2008 13:37:21 +0200
Message-ID: <g5pv9g$sss$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-12-162.hsi.ish.de
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
Sender: news <news@ger.gmane.org>
Subject: bugs with open patches
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
X-List-Received-Date: Fri, 18 Jul 2008 11:38:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I'd like to raise awareness of the fact that we still have well over 150
bugs in the tracker with patches claiming to fix the issue at hand.

 http://bugs.openembedded.net/buglist.cgi?keywords=patch&resolution=---

All we need is someone to look at them and either apply or reject them.
 If you feel a patch needs more work to be included in .dev, just remove
the patch keyword and leave some short explanation as a comment.  My
cleanup routine should catch this and I'll continue with bug triage
before eventually setting the patch keyword once more.

Regards

Rolf



