Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1QEHJw-0005fw-Ve
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 10:39:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id A59261401C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 09:36:37 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 5YhslaQHpH3J
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 09:36:37 +0100 (BST)
Received: from xora-eee (188-220-38-49.zone11.bethere.co.uk [188.220.38.49])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 276C0A4A8D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 09:36:37 +0100 (BST)
Received: by xora-eee (Postfix, from userid 1000)
	id 7A8588072F; Mon, 25 Apr 2011 09:36:35 +0100 (BST)
Date: Mon, 25 Apr 2011 09:36:35 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110425083635.GA2794@xora-eee.xora.org.uk>
References: <1303650463701271500@rkmorris.us>
MIME-Version: 1.0
In-Reply-To: <1303650463701271500@rkmorris.us>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Build Warnings (Angstrom-2010.x)
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
X-List-Received-Date: Mon, 25 Apr 2011 08:39:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 24, 2011 at 08:07:43AM -0500, Russell Morris wrote:
> Hi,
> 
> I have noted that when I run builds for this distro I end up with a lot of warnings near the start (added below). Is this expected / normal, and what can I do to address these (as not only are they a bit confusing, I'm of course worried that the right items are being pulled in to the build)?
> 
Its just the blacklister removing software from the total set of software. We
do this to remove items that are incompatible with Angstrom to prevent people
building them by accident.

You can just leave it how it is, all is working perfect :-)

G



