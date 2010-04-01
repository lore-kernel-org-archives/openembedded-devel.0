Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jtobias@viaas.com>) id 1Nx8cu-000223-J3
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 02:51:38 +0200
Received: by gwj21 with SMTP id 21so448084gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 17:48:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.191.19 with HTTP; Wed, 31 Mar 2010 17:47:59 -0700 (PDT)
Date: Wed, 31 Mar 2010 17:47:59 -0700
Received: by 10.101.170.12 with SMTP id x12mr846882ano.236.1270082879841; Wed, 
	31 Mar 2010 17:47:59 -0700 (PDT)
Message-ID: <p2i66b2b2311003311747q17b48520vc3440b4427037d7a@mail.gmail.com>
From: John Tobias <jtobias@viaas.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: jtobias@viaas.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OPKG Architecture
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
X-List-Received-Date: Thu, 01 Apr 2010 00:51:40 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

I built angstrom for dm6446 and use the kernel 2.6.18 from montavista. Both
kernel and filesystem works well as I expected. But, I've got one problem, I
couldn't use the .pkg files because of the architecture differences. The
.pkg contain armv5te while uname -m returning armv5tejl.

Any idea?

Thanks,

John

