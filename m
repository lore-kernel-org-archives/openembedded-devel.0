Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1J59D6-0002y8-1a
	for openembedded-devel@openembedded.org; Thu, 20 Dec 2007 01:24:24 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1J58kF-00052I-R9
	for openembedded-devel@openembedded.org; Wed, 19 Dec 2007 23:54:35 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 19 Dec 2007 23:54:35 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Dec 2007 23:54:35 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 20 Dec 2007 00:27:42 +0100
Message-ID: <fkc9de$365$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
Sender: news <news@ger.gmane.org>
Subject: RFC: drop quilt version 0.39
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
X-List-Received-Date: Thu, 20 Dec 2007 00:24:24 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

driven by bug 1960, I have been doing some work on quilt in OE,
refactoring, cleaning up and adding version 0.46.  In the process I also
dropped version version 0.39.  Is there anybody that needs this
particular version or can I commit to drop it?  I grepped through OE and
found no reference to it.  If you want it kept, speak up now.

Regards

Rolf


http://oz.leggewie.org/wip/quilt.old/
http://oz.leggewie.org/wip/quilt.new/
http://oz.leggewie.org/wip/quilt.mtndiff



