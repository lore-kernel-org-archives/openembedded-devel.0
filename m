Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L53bI-0002De-Kj
	for openembedded-devel@openembedded.org; Tue, 25 Nov 2008 20:29:32 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L53YQ-0004QK-1n
	for openembedded-devel@openembedded.org; Tue, 25 Nov 2008 19:26:34 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2008 19:26:34 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2008 19:26:34 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 25 Nov 2008 20:26:24 +0100
Message-ID: <gghjh1$dg1$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081116 Shredder/3.0b1pre
Sender: news <news@ger.gmane.org>
Subject: [RFC] LICENSE fields and packages
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
X-List-Received-Date: Tue, 25 Nov 2008 19:29:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Jason Kridner pointed out that we don't actually put the license in the 
resulting packages, making it hard for finding the license if you only 
have a bunch or packages.

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=e35d1ffad1553f259b084578992f15d10f590f98

Now the RFC part:

Allow URLs in the LICENSE field for lesser know licenses and/or 
click-through licenses.

Related to that: a class that would take a text file and generate a 
preinsts that shows the textfile and prompts to accept it (or not) would 
be awesome as well.

Back to the point: what do you think of allowing URLs in the LICENSE field?

regards,

Koen



