Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JtOWi-00011H-8N
	for openembedded-devel@openembedded.org; Tue, 06 May 2008 16:52:21 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JtOWE-0001uL-T7
	for openembedded-devel@openembedded.org; Tue, 06 May 2008 14:51:50 +0000
Received: from ip-62-143-23-251.hsi.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 06 May 2008 14:51:50 +0000
Received: from no2spam by ip-62-143-23-251.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 06 May 2008 14:51:50 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 06 May 2008 16:51:40 +0200
Message-ID: <fvpr9t$4vh$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.hsi.ish.de
User-Agent: Thunderbird 2.0.0.12 (X11/20080227)
Sender: news <news@ger.gmane.org>
Subject: bp flag added to bug tracker (org.openembedded.stable)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 06 May 2008 14:52:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

it appears that org.openembedded.stable is not in addition to but a
replacement for org.oe.angstrom-2007.12-stable.  It also seems that the
policy so far of "two A* devs ACK any commit" has been thus replaced by
"two OE devs ACK any commit".  Correct so far?

I believe the BTS should help us out with flagging, granting and
documenting backport requests.  Which is why I have just added the bp
flag which can be applied to attachments in our BTS.  Anybody can
request the bp flag (which should trigger an email to oe-devel), but
only members of the OE group can grant it.  I am yet somewhat unfamiliar
with flags, but I guess we'll learn as we go.  My understanding is that
a grant can be given more than once.

IOW, very elegant solution that is tightly integrated with current
processes.

Regards

Rolf


PS: OE devs who are not yet a member of the OE group should please ping
mickey



