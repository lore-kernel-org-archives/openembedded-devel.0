Received: from [194.158.229.25] (helo=mail-ps.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dv@vollmann.ch>) id 1IVEFu-00057f-Ux
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 00:30:50 +0200
Received: from octo.vollmann.ch (212.98.43.140) by mail-ps.sunrise.ch (8.0.010)
	id 46CB8548003B0637 for openembedded-devel@openembedded.org;
	Wed, 12 Sep 2007 00:27:46 +0200
Received: from octo (localhost [127.0.0.1])
	by octo.vollmann.ch (8.11.2/8.11.2) with SMTP id l8BMUpn25780;
	Wed, 12 Sep 2007 00:30:51 +0200
Sender: dv@vollmann.ch
Message-ID: <46E7171B.7A0533BA@vollmann.ch>
Date: Wed, 12 Sep 2007 00:30:51 +0200
From: Detlef Vollmann <dv@vollmann.ch>
Organization: vollmann engineering gmbh
X-Mailer: Mozilla 3.04 (X11; U; Linux 2.4.21 i686)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: Cached MD5 sums
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
X-List-Received-Date: Tue, 11 Sep 2007 22:30:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

while trying to build a number of packages, I now got twice
errors about MD5 sums.  Even after a new download bitbake
still complained and insisted that some MD5 sum is required
of which I have no idea where it comes from (definitely
not from the accompanying .md5 file in DL_DIR, which
contained the correct MD5 sum).

So I assume that bitbake has in its cache some old MD5 sums
from broken downloads, but I have no idea how to delete those.

Any ideas?

  Detlef

-- 
Detlef Vollmann   vollmann engineering gmbh
Linux and C++ for Embedded Systems    http://www.vollmann.ch/


