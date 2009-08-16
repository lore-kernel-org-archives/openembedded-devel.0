Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Mcgix-0003nv-2a for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 16:28:43 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1McgSc-0002no-RE for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 14:11:50 +0000
Received: from p5b3b24ac.dip.t-dialin.net ([91.59.36.172])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 14:11:50 +0000
Received: from no2spam by p5b3b24ac.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 14:11:50 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 16 Aug 2009 16:11:36 +0200
Message-ID: <4A881398.4070709@nospam.arcornews.de>
References: <540809eb0908100042n74d61d41s6336bea61546dfb@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b24ac.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.22 (X11/20090804)
In-Reply-To: <540809eb0908100042n74d61d41s6336bea61546dfb@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] python-sip: update 4.7.9 -> 4.8.2
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
X-List-Received-Date: Sun, 16 Aug 2009 14:28:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

your commit 68233bb284d82040087b7d265ad3ad93c0cab475 broke "bitbake
python-pyqt" and possibly others.  See bug 5297.  Please fix or revert.

Regards

Rolf



