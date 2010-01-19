Received: from smtp7.myhsphere.biz ([204.10.105.69] helo=mail9.myhsphere.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <balakrishnan@e-consystems.com>) id 1NXAFV-0005LE-2k
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 10:19:48 +0100
Received: (qmail 29688 invoked by uid 399); 19 Jan 2010 09:17:27 -0000
Received: from abts-tn-dynamic-215.79.164.122.airtelbroadband.in (HELO
	?192.168.1.8?) (balakrishnan@e-consystems.com@122.164.79.215)
	by mail9.myhsphere.biz with ESMTPAM; 19 Jan 2010 09:17:27 -0000
X-Originating-IP: 122.164.79.215
X-Sender: balakrishnan@e-consystems.com
From: balakrishnan <balakrishnan@e-consystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2010 14:47:20 +0530
Message-Id: <1263892640.3516.3.camel@balakrishnan-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 204.10.105.69
X-SA-Exim-Mail-From: balakrishnan@e-consystems.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting a cursor
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
X-List-Received-Date: Tue, 19 Jan 2010 09:19:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> Anyone got an idea how to get a cursor as default?
> Googling, I have seen
that /usr/share/icons/xcursor-transparent/cursors
> all point at a transparent cursor abd that I can generate new cursors
> using xcursorgen.
> I guess I can also copy some cursors from a desktop, but If
> I want to have cursor on by default, is there a magic setting
>somewhere?

change -use_cursor option value from 'no' to 'yes'
from /etc/matchbox/session file.

With Regards
J.Balakrishnan

 





