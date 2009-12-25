Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NOEog-00054E-Bx for openembedded-devel@lists.openembedded.org;
	Fri, 25 Dec 2009 19:23:13 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NOEmq-0001vB-Ku
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Dec 2009 19:21:16 +0100
Received: from p5b3b3b8c.dip.t-dialin.net ([91.59.59.140])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2009 19:21:16 +0100
Received: from no2spam by p5b3b3b8c.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2009 19:21:16 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 25 Dec 2009 19:20:53 +0100
Message-ID: <hh2vq7$smd$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3b8c.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: new bugtracker policy - resolving as NOTOURBUG
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
X-List-Received-Date: Fri, 25 Dec 2009 18:23:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello and merry Christmas,

I added the NOTOURBUG resolution to our bugzilla installation.  Please
close bugs that are not in the OE metadata and thus out-of-scope as per
the new policy as RESOLVED NOTOURBUG.  I think it would also be curteous
to let the reporters know that we recently changed our policy to focus
on metadata-related bugs only.

Thank you to Mickey for the work done on the tracker recently.

Please continue to use tinderbox for automatic reporting of compile
failures.
http://wiki.openembedded.net/index.php/How_do_I_send_automatic_success_and_failure_reports

Regards

Rolf



