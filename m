Received: from [81.228.8.83] (helo=pne-smtpout1-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf@atmel.com>) id 1L8jYN-0006Hp-Fe
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Dec 2008 23:53:43 +0100
Received: from [10.175.196.247] (213.67.42.143) by
	pne-smtpout1-sn2.hy.skanova.net (7.3.129) (authenticated as
	0706224457)
	id 48A144C501DDC8CD for openembedded-devel@lists.openembedded.org;
	Fri, 5 Dec 2008 23:50:01 +0100
From: Ulf Samuelsson <ulf@atmel.com>
To: openembedded-devel@lists.openembedded.org
Organization: Atmel Nordic AB
Date: Fri, 05 Dec 2008 23:50:00 +0100
Message-Id: <1228517400.14826.12.camel@aeglos.sweden.atmel.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.2 
Subject: virtual/arm-angstrom-linux-gnueabi-gcc-2.95
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
X-List-Received-Date: Fri, 05 Dec 2008 22:53:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Trying to build the gpe-image using Angstrom.

OE Build Configuration:
BB_VERSION        = "1.8.11"
METADATA_BRANCH   = "org.openembedded.dev"
METADATA_REVISION = "980c8231abf78b7ff44dc46905d62666f64d002d"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "at91sam9263ek"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2008.1-test-20081205"
TARGET_FPU        = "soft"

NOTE: Resolving any missing task queue dependencies
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime
entity 'virtual/arm-angstrom-linux-gnueabi-gcc-2.95' but it wasn't found
in any PACKAGE or RPROVIDES variables
NOTE: Runtime target 'virtual/arm-angstrom-linux-gnueabi-gcc-2.95' is
unbuildable, removing...
Missing or unbuildable dependency chain was:
['virtual/arm-angstrom-linux-gnueabi-gcc-2.95']

Why is this?
Found one entry in the mailing list, but no explanation
 
-- 
Best Regards,
Ulf Samuelsson



