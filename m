Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1OlrfZ-0006l8-4P
	for Openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 01:03:42 +0200
Received: by pxi11 with SMTP id 11so438476pxi.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 16:03:20 -0700 (PDT)
Received: by 10.142.214.16 with SMTP id m16mr7706146wfg.5.1282172600610;
	Wed, 18 Aug 2010 16:03:20 -0700 (PDT)
Received: from [172.22.3.240] (ip65-44-204-2.z204-44-65.customer.algx.net
	[65.44.204.2])
	by mx.google.com with ESMTPS id t11sm889935wfc.16.2010.08.18.16.03.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Aug 2010 16:03:19 -0700 (PDT)
From: Sean Cross <sean@chumby.com>
Date: Wed, 18 Aug 2010 16:03:16 -0700
Message-Id: <04B05A09-EB4A-4EE3-9DC9-6843A7173EDD@chumby.com>
To: Openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Add chumby falconwing support
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
X-List-Received-Date: Wed, 18 Aug 2010 23:03:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

The following patches add support for chumby Falconwing-based boards, =
such as the chumby One.  This is distinct from the current "chumby" =
machine, which appears to be support for the Chumy Classic, =
Ironforge-based devices.=


