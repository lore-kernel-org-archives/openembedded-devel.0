Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1OogNe-0008KN-LB
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 19:36:51 +0200
Received: by qyk4 with SMTP id 4so2159602qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 10:36:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.58.101 with SMTP id f37mr6911056qah.158.1282844171680;
	Thu, 26 Aug 2010 10:36:11 -0700 (PDT)
Received: by 10.229.11.11 with HTTP; Thu, 26 Aug 2010 10:36:11 -0700 (PDT)
Date: Thu, 26 Aug 2010 10:36:11 -0700
Message-ID: <AANLkTikCbjnRFr=E4t0MXcH8+Cap2KNWKyS2vZpp+Xdq@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: msundius@sundius.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: packages
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
X-List-Received-Date: Thu, 26 Aug 2010 17:36:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm trying to understand how package feeds work. From the documentation it
seems
that you can use a package feed to install prebuilt packages onto a running
taget.
but what I'd like to do is to have OE look to see if a pre built package
exists before it
goes and builds one. Sort of like a packaged staging, but distributed, so
anyone could
pick up the package it needs from a single server, rather than having to
build it first

