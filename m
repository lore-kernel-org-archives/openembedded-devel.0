Received: from [130.149.7.33] (helo=mail.tu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <torsten.sadowski@tu-berlin.de>) id 1LZo6a-0000Pk-Ew
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Feb 2009 16:12:56 +0100
X-tubIT-Incoming-IP: 130.149.75.153
Received: from kapitaen.kup.tu-berlin.de ([130.149.75.153]
	helo=kapitaen.localnet)
	by mail.tu-berlin.de (exim-4.69/mailfrontend-b) with esmtpa 
	for <openembedded-devel@lists.openembedded.org>
	id 1LZo4S-00020N-Mx; Wed, 18 Feb 2009 16:10:45 +0100
From: Torsten Sadowski <torsten.sadowski@tu-berlin.de>
Organization: TU Berlin
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Feb 2009 16:10:26 +0100
User-Agent: KMail/1.10.3 (Linux/2.6.27-11-generic; KDE/4.1.3; i686; ; )
MIME-Version: 1.0
Message-Id: <200902181610.26763.torsten.sadowski@tu-berlin.de>
X-tubIT-Score: 0.0 ()
Subject: angstrom-2008.1 fails on Simpad because of missing devices
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
X-List-Received-Date: Wed, 18 Feb 2009 15:12:56 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I tried to build a new x11-image for the Simpad. Unluckily it doesn't finish 
to boot. Does anyone know a simple solution?

Cheers, Torsten

init started: BusyBox v1.13.2 (2009-02-18 13:49:55 CET)
Bad inittab entry at line 5
can't open /dev/si: No such file or directory
can't open /dev/~~: No such file or directory
can't open /dev/l0: No such file or directory
can't open /dev/l1: No such file or directory
can't open /dev/l2: No such file or directory
can't open /dev/l3: No such file or directory
can't open /dev/l4: No such file or directory
can't open /dev/l5: No such file or directory
can't open /dev/l6: No such file or directory
can't open /dev/z6: No such file or directory
can't open /dev/S: No such file or directory
process '/sbin/sulogin' (pid 769) exited. Scheduling for restart.
process '/sbin/getty ttySA0 115200 vt100' (pid 770) exited. Scheduling for 
restart.
can't open /dev/z6: No such file or directory
can't open /dev/S: No such file or directory
process '/sbin/sulogin' (pid 771) exited. Scheduling for restart.
process '/sbin/getty ttySA0 115200 vt100' (pid 772) exited. Scheduling for 
restart.
....continues ad infinitum


