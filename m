Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MpkXv-0005pQ-Us
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Sep 2009 17:11:23 +0200
Received: from nrcc-l3-gateway.nrcc.noklab.com ([4.53.58.22]
	helo=[10.200.200.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MpkXL-00071I-8M
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Sep 2009 16:10:44 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090920185051.GB1288@denix.org>
References: <1253428380-27587-1-git-send-email-denis@denix.org>
	<19c1b8a90909200813u30642a87g38fc83cfb2b59d36@mail.gmail.com>
	<20090920185051.GB1288@denix.org>
Date: Mon, 21 Sep 2009 16:10:31 +0100
Message-Id: <1253545831.16477.0.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] package.bbclass: export subpackage	individual version, if different from main
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
X-List-Received-Date: Mon, 21 Sep 2009 15:11:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-09-20 at 14:50 -0400, Denys Dmytriyenko wrote:
> Does RPROVIDES specify versions?

No.  Versions are fairly meaningless for virtuals since the different
providers aren't guaranteed to have synchronised versioning schemes.

p.




