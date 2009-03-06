Received: from [199.44.250.2] (helo=exchsrvr.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1LfcVb-0000JW-Bx
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Mar 2009 17:02:47 +0100
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Fri, 6 Mar 2009 11:02:23 -0500
Message-ID: <EC5EE493B6046F45A2DDEC4A828DE52E039C64B2@EXCHSRVR.syntech.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: need help with do_rootfs "Cannot find package xserver-kdrive"
thread-index: AcmedO9ECGTH2yLrTRCiFSBb0kpxsg==
From: "Mark Butsch" <mbutsch@syntech-fuelmaster.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: need help with do_rootfs "Cannot find package xserver-kdrive"
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
X-List-Received-Date: Fri, 06 Mar 2009 16:02:47 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am just getting back to working with OE and am having trouble
generating my image. It worked fine when I last used it, about a year
ago. I know there have been many changes in OE in the at time.

Building my image fails in "task do_rootfs" with an error "Cannot find
package xserver-kdrive".

The recipe for kdrive (xserver-kdrive_1.3.0.0.bb) runs, but in the
..deploy/ipk directory there doesn't seem to be an .ipk file for
xserver-kdrive like there was before. I guess that is why it can't find
the package in do_rootfs.

Any suggestions on how to figure this out?

Mark


