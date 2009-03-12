Received: from [199.44.250.2] (helo=exchsrvr.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1LhmME-0002zn-G4
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 15:58:02 +0100
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Thu, 12 Mar 2009 11:02:06 -0400
Message-ID: <EC5EE493B6046F45A2DDEC4A828DE52E03B6B838@EXCHSRVR.syntech.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: minimo: task do_configure failed
thread-index: AcmjI4Is1a8lQ0RWSX6Rtlej9z5/IQ==
From: "Mark Butsch" <mbutsch@syntech-fuelmaster.com>
To: <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: minimo: task do_configure failed
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
X-List-Received-Date: Thu, 12 Mar 2009 14:58:03 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

=20

I am starting to work with OE again and am having trouble building
minimo. I had had this working a year ago, but now it fails in
do_configure:

=20

=20

...

checking whether the host c compiler (gcc
-isystem/home/ad/mbutsch/4G/tmp/4g/sta

ging/i686-linux/usr/include -fexpensive-optimizations
-fomit-frame-pointer -fren

ame-registers -O2 -march=3Di486
-L/home/ad/mbutsch/4G/tmp/4g/staging/i686-linux/us

r/lib
-Wl,-rpath-link,/home/ad/mbutsch/4G/tmp/4g/staging/i686-linux/usr/lib
-Wl,

-O1 ) works... configure: error: installation or configuration problem:
host com

piler gcc cannot create executables.

...

=20

I can build other recipes so it must be a problem in how the compiler is
being specified to the minimo recipe.

=20

Not sure where to go from here.

=20

Mark


