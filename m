Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MbyCZ-0001Hu-QV for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 16:56:19 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MbxwS-0004fu-DJ for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 14:39:40 +0000
Received: from p5b3b193c.dip.t-dialin.net ([91.59.25.60])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 14:39:40 +0000
Received: from no2spam by p5b3b193c.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 14:39:40 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 14 Aug 2009 16:39:24 +0200
Message-ID: <h63suv$dje$1@ger.gmane.org>
References: <4A84650F.1080902@linuxbj.com>	<200908140406.00714.holger+oe@freyther.de>
	<4A850430.6060809@linuxbj.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b193c.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.22 (X11/20090804)
In-Reply-To: <4A850430.6060809@linuxbj.com>
Sender: news <news@ger.gmane.org>
Subject: Re: patch for compcache recipe
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
X-List-Received-Date: Fri, 14 Aug 2009 14:56:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ming Chow 周明 wrote:
> BTW. I had experienced some checksum mismatch before. A few packages 
> which just work can not pass checksum matching. I guess it may be caused 
> by hosting or tarball changing without notice. For I am not very clear 
> how the global checksum.ini is maintained. I lazily set 
> OE_ALLOW_INSECURE_DOWNLOADS.

Take a look at
http://wiki.openembedded.net/index.php/Dealing_with_checksum_mismatch

Let us know about the packages failing the checksum test so we can fix
things.



