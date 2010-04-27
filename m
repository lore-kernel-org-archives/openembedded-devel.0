Received: from mail-yw0-f197.google.com ([209.85.211.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jtobias@viaas.com>) id 1O6ZQs-0008HT-Dd
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 03:17:51 +0200
Received: by ywh35 with SMTP id 35so6044297ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 18:14:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.101.161.16 with SMTP id n16mr452049ano.130.1272330846154; Mon, 
	26 Apr 2010 18:14:06 -0700 (PDT)
Received: by 10.100.251.20 with HTTP; Mon, 26 Apr 2010 18:14:06 -0700 (PDT)
Date: Mon, 26 Apr 2010 18:14:06 -0700
Message-ID: <y2v66b2b2311004261814x5605fb74v995214bc80f30728@mail.gmail.com>
From: John Tobias <jtobias@viaas.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.197
X-SA-Exim-Mail-From: jtobias@viaas.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Writing UBL on blocks 2 - 5
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
X-List-Received-Date: Tue, 27 Apr 2010 01:17:51 -0000
Content-Type: text/plain; charset=UTF-8

Hi Guys,

1. The DVFlasher that I am using only works on the first UBL block. Is there
other utility that I can use to program the blocks 2 - 5?.

2. In Linux userspace, what utility did you use to check the CRC validity of
UBL data on blocks 1-5?.

3. Lastly, what utility did you use in linux userspace to re-program the
block 1-5 just incase they messed up?. I do believe, using mtdwrite is not
possible due to CRC incompatibility.

Thanks,

John

