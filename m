Received: from [194.109.24.32] (helo=smtp-vbr12.xs4all.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <udovdh@xs4all.nl>) id 1K45gO-0000SK-0y
	for openembedded-devel@openembedded.org; Thu, 05 Jun 2008 04:58:32 +0200
Received: from surfplank2.hierzo (pindarots.xs4all.nl [82.92.197.115])
	(authenticated bits=0)
	by smtp-vbr12.xs4all.nl (8.13.8/8.13.8) with ESMTP id m552rs93049627
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Jun 2008 04:53:55 +0200 (CEST)
	(envelope-from udovdh@xs4all.nl)
Message-ID: <48475542.6040008@xs4all.nl>
Date: Thu, 05 Jun 2008 04:53:54 +0200
From: Udo van den Heuvel <udovdh@xs4all.nl>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Enigmail-Version: 0.95.2
OpenPGP: id=8300CC02
X-Virus-Scanned: by XS4ALL Virus Scanner
Subject: QA errors after bitbake navit
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
X-List-Received-Date: Thu, 05 Jun 2008 02:58:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

I was building navit from cvs for angstrom 2007.12 (stable) and
encountered a number of QA errors whish I was told were fixable.

The errors look like:
.la contains reference to the workdir, staging,
/staging/arm-angstrom-linux-gnueabi/lib/libatk-1.0.la
evil hides inside the .la, staging,
/staging/arm-angstrom-linux-gnueabi/lib/libsupc++.la

The full error is at http://bugs.openembedded.net/show_bug.cgi?id=4348.

What needs to be done to fix? Can anybody help or look into this?

Kind regards.,
Udo


