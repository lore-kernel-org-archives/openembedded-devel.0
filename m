Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JhOWs-0006aY-1d
	for openembedded-devel@openembedded.org; Thu, 03 Apr 2008 14:26:54 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JhOWq-0000Hf-Pj
	for openembedded-devel@openembedded.org; Thu, 03 Apr 2008 12:26:52 +0000
Received: from ip-62-143-23-251.1411n-cud12k-01.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 03 Apr 2008 12:26:52 +0000
Received: from no2spam by ip-62-143-23-251.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 03 Apr 2008 12:26:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 03 Apr 2008 14:26:44 +0200
Message-ID: <ft2ie3$ip6$1@ger.gmane.org>
References: <1206911981.4838.12.camel@dax.rpnet.com> <47F024DA.5020502@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.12 (X11/20080227)
In-Reply-To: <47F024DA.5020502@gmx.de>
Sender: news <news@ger.gmane.org>
Subject: Re: libgcc not being pulled into OABI images
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
X-List-Received-Date: Thu, 03 Apr 2008 12:26:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Thomas Kunze wrote:
> So I suggest something like:

Thomas,

thanks for your work on this.  Unfortunately, the issue remains the same
for me, even with that change.  I added the lines you suggested, cleaned
out tmp and compiled an altboot-console-image.  The boot process hangs
with "libgcc_so.1 must be installed for pthread_cancel to work"

Regards

Rolf



