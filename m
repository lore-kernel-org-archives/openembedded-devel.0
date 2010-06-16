Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1OP1bl-0006Lr-LX
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 01:01:22 +0200
Received: by vws3 with SMTP id 3so303vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 15:56:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.72.32 with SMTP id k32mr283106qaj.167.1276728990348; Wed, 
	16 Jun 2010 15:56:30 -0700 (PDT)
Received: by 10.229.230.83 with HTTP; Wed, 16 Jun 2010 15:56:30 -0700 (PDT)
Date: Wed, 16 Jun 2010 15:56:30 -0700
Message-ID: <AANLkTim5TDiBGob1RspY3wjtkO9JkWeJiVkqlRz9YQL0@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: msundius@sundius.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: -dbg packages
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
X-List-Received-Date: Wed, 16 Jun 2010 23:01:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

How can I prevent all ${PN}-dbg packages from being added to my image?

does DISTRO_TYPE = "debug" force all debug symbols to be added to RDEPENDS?
I don't see anywhere where that is done, but I might be missing something.

our team has the DISTRO_TYPE = "debug" turned on because the release version
does not build, but the entire build too big to fit in our flash if all the
symbols are included.

thanks

Mike

