Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jtobias@viaas.com>) id 1OZoUN-0003Wg-4E
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 19:14:19 +0200
Received: by gya6 with SMTP id 6so1477013gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 10:14:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.150.219.3 with SMTP id r3mr1776169ybg.99.1279300451309; Fri, 
	16 Jul 2010 10:14:11 -0700 (PDT)
Received: by 10.42.1.213 with HTTP; Fri, 16 Jul 2010 10:14:11 -0700 (PDT)
Date: Fri, 16 Jul 2010 10:14:11 -0700
Message-ID: <AANLkTikz0uYCp5hmrW1tT2AoQE0iwzfHFd33O0Y9zSF1@mail.gmail.com>
From: John Tobias <jtobias@viaas.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: jtobias@viaas.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Udev not creating mtdblock**
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
X-List-Received-Date: Fri, 16 Jul 2010 17:14:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

The udev is not working correctly on my beagleboard, it doesn't create
a device node for mtdblock and loop. Is there any quick fix on these
problem?.

Thanks,
John


