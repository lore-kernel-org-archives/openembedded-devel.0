Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1RXwBb-0001WQ-E8
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 15:39:59 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RXw52-0006qI-7J>; Tue, 06 Dec 2011 15:33:12 +0100
Received: from hydra.imp.fu-berlin.de ([160.45.117.149]
	helo=mail.imp.fu-berlin.de) by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RXw52-0000gg-5K>; Tue, 06 Dec 2011 15:33:12 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by mail.imp.fu-berlin.de with esmtps (Exim 4.72) id 1RXw4Y-0001I0-MD
	(envelope-from <heinold@mi.fu-berlin.de>)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 15:32:57 +0100
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1RXw4T-0006IJ-IR
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 15:32:37 +0100
Date: Tue, 6 Dec 2011 15:32:37 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111206143237.GA16350@mi.fu-berlin.de>
References: <20111205225044.DD3AB10338@opal>
MIME-Version: 1.0
In-Reply-To: <20111205225044.DD3AB10338@opal>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Remote-IP: 160.45.42.84
X-Spam_Score: -4.1
X-exim-Spam_Score_Int: -40
X-exim-Spam_Bar: ----
X-Spam_Report: * -1.0 ALL_TRUSTED Nachricht wurde nur über vertrauenswürdige Rechner
 *      weitergeleitet
 * -1.2 RP_MATCHES_RCVD Envelope sender domain matches handover relay domain
 * -1.9 BAYES_00 BODY: Spamwahrscheinlichkeit nach Bayes-Test: 0-1%
 *      [score: 0.0000]
X-Originating-IP: 160.45.117.149
Subject: Re: [oe-commits] Nitin A Kamble : libatomics-ops: patch source code for x32
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
X-List-Received-Date: Tue, 06 Dec 2011 14:39:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

libatomic_ops is now developed here and with this two changes

https://github.com/ivmai/libatomic_ops/commit/f977dca8aa6873891937442198cdbe5479ce52cd#src/atomic_ops/sysdeps/gcc/x86_64.h
https://github.com/ivmai/libatomic_ops/commit/53a14c1d6eede42614ac0f7cd335cb76faf6e145#src/atomic_ops/sysdeps/gcc/x86_64.h

the patch is only needed for older gcc's.

Bye Henning


