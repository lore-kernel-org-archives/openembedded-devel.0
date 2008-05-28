Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K1LWe-0002eO-S6
	for openembedded-devel@openembedded.org; Wed, 28 May 2008 15:17:09 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K1LTF-0005K5-6h
	for openembedded-devel@openembedded.org; Wed, 28 May 2008 13:13:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 28 May 2008 13:13:37 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 28 May 2008 13:13:37 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 28 May 2008 15:13:27 +0200
Message-ID: <g1jlpn$f7f$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052003)
Sender: news <news@ger.gmane.org>
Subject: BB_STAMP_POLICY
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
X-List-Received-Date: Wed, 28 May 2008 13:17:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

FYI:

11:37:33 Koen: is BB_STAMP_POLICY documented somewhere?
11:37:47 Richard Purdie: Not really
11:38:03 Richard Purdie: Takes the values "file" "whitelist" or "full"
11:38:35 Richard Purdie: "file" is the traditional behaviour with stamps 
just checked within a given recipe
11:38:46 Richard Purdie: "full" checks all the dependencies are consistent
11:39:12 Richard Purdie: "whitelist" allows some packages to be excluded 
from the stamp checking basically so packages staging can work



