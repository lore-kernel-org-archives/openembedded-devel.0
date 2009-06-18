Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MHBQa-0003RJ-BK
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 08:48:52 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MHBGQ-0003PX-0W
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 06:38:22 +0000
Received: from p17194-ipngn801marunouchi.tokyo.ocn.ne.jp ([114.162.172.194])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 06:38:22 +0000
Received: from no2spam by p17194-ipngn801marunouchi.tokyo.ocn.ne.jp with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 06:38:22 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 18 Jun 2009 15:38:05 +0900
Message-ID: <4A39E0CD.3080101@nospam.arcornews.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p17194-ipngn801marunouchi.tokyo.ocn.ne.jp
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
Sender: news <news@ger.gmane.org>
Cc: mlauer@vanille-media.de
Subject: tinderbox moved
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
X-List-Received-Date: Thu, 18 Jun 2009 06:48:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

the next service moved from amethyst to melo: tinderbox.

There should be no disruptions in service.  The new installation is 
already live.  Both tinderbox.openembedded.net and 
tinderbox.openembedded.org should be accessible.  .net redirects to .org 
until mickey can set up a proper CNAME.

While I would have liked to carry over the old data, I decided against 
it for two reasons.  The old installation used the Postgres backend, 
while melo has access to a separate mysql database server.  Conversion 
may have well been possible, but logs are only kept for three months 
anyway.   Thus, I did not feel it was worth the effort.

The old data is still accessible.  I have set up 
http://oe-tinderbox-old.leggewie.org for now.  If it is important to 
anybody, we can set up a proper domain under openembedded.org or .net

Please let me know of any problems.

Regards

Rolf



