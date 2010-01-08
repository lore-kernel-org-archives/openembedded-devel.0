Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <jeesmann@gmx.de>) id 1NTMel-0002ZD-1x
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 22:46:10 +0100
Received: (qmail invoked by alias); 08 Jan 2010 21:37:20 -0000
Received: from p5DE7A996.dip.t-dialin.net (EHLO [192.168.2.100])
	[93.231.169.150]
	by mail.gmx.net (mp034) with SMTP; 08 Jan 2010 22:37:20 +0100
X-Authenticated: #55411201
X-Provags-ID: V01U2FsdGVkX1+R3Tt1r/aRVeQIBjbOti3sStXKq/r2Rx1Eqq+/PJ
	Hha5xyoMhnvfQn
From: Joerg Eesmann <jeesmann@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 08 Jan 2010 22:37:19 +0100
Message-Id: <1262986639.11887.8.camel@fred.uchi.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.71
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: jeesmann@gmx.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Remote Debugging
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
X-List-Received-Date: Fri, 08 Jan 2010 21:46:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi there,
I am trying to remote debug my Openmoko freerunner.
I already installed succesfully gdbserver, and can attach it to the
progem I am going to debug.
The question is, what to do on host side?
I bitbaked gdb-cross-sdk, I bitbaked my changed package (bluez4)
So I will install a debug version of the package, and attach to the
bluetoothd-demon.
On host side, I guessed I needed a gdb, that can handle ARM-processor,
therefore gdb-cross-sdk.
Now I should have everything... but a few questions left.
GDB ist only ipk-package, what to do with this?
Where do I find the arm-compiler bluetoothd on my host (I guess in work,
but will this be the strippded version or not, because also stripped
package has been made).
Am I on the right way? Is there any howto or something like that
availlable, where you could point me?

thank you for your help in advance,
best regards,
Joerg




