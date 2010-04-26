Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1O6LnA-0004EF-Ko
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 12:43:57 +0200
Received: by bwz20 with SMTP id 20so1742745bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 03:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=wj7OgGaZ2tQUcPwJ0NLCMhax9UnwBP1DGuI8tqDPLJc=;
	b=SMR77Oho3AE/+S2Gig9RiMTxjzL8kkMZlniR9F5tp3WHLnfm91Sby/FjZ4uCuL8EhO
	LItzkWlv01Ev0ia7gvZkKE1IpFj2TMvFNQR8M0LLaP0rM6WzMOq4KK9brqsZE7jCNQVw
	OTRCKdYW9Dnm1XNFmPmuJTdQqNg5vvidTIF4E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=uF4SX5OHXLxhk04xGcvmdC4BZTe9c2aUxiby1PUwC+3mO7XZ5S4ZF6Ei0eEOSMaSFQ
	IrZ0a5kr2WD9QI8oY8BCINBe+PJdjZX9ayUo4+oDpljFGrEobjGAVyU4oj983hrlnpiJ
	MFkQD4M9mdrakeV1vmidRxds6nqOH0zR3j6HQ=
MIME-Version: 1.0
Received: by 10.204.15.5 with SMTP id i5mr2437167bka.182.1272278417501; Mon, 
	26 Apr 2010 03:40:17 -0700 (PDT)
Received: by 10.204.84.13 with HTTP; Mon, 26 Apr 2010 03:40:17 -0700 (PDT)
Date: Mon, 26 Apr 2010 12:40:17 +0200
Message-ID: <q2vade1bdc1004260340j4881a020t22a79b4e1279ade3@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: dm365 and OE
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
X-List-Received-Date: Mon, 26 Apr 2010 10:43:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm a little bit confused about the good direction for developing for dm365.
Arago overlay seems nice, it works, but uses also arago-oe-dev, that is a
git tree separated from OE (kept merged sometimes), and Code Sourcery
toolchain.
In OE instead I see many codecs inside recipes/ti directory, but I don't
know their status.
Anyone can point me to the right direction?

arago + cs
OE + cs
OE + its builtin toolchain

Than for any help,
Recalcati

