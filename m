Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NTilt-0003Z0-WC for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 22:23:01 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NTijo-0005Br-Uz
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 22:20:48 +0100
Received: from p5b3b1d48.dip.t-dialin.net ([91.59.29.72])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 22:20:48 +0100
Received: from no2spam by p5b3b1d48.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 22:20:48 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 09 Jan 2010 22:20:20 +0100
Message-ID: <hiarul$ifi$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b1d48.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Are we starting udev too early in the boot process?
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
X-List-Received-Date: Sat, 09 Jan 2010 21:23:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

could it be that we are starting udev too early in the boot process?

http://bugs.openembedded.org/show_bug.cgi?id=5090
http://bugs.openembedded.org/show_bug.cgi?id=5246

Above two bug reports whose effects I can confirm would suggest that to
me.  But I'm not sure about the side-effects of starting udev later than
where it currently is at.  Anybody care to comment?

Regards

Rolf



