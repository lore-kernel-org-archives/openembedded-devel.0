Received: from qmta07.westchester.pa.mail.comcast.net ([76.96.62.64])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pspreadborough@comcast.net>) id 1NcfsD-000233-Gv
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 15:06:33 +0100
Received: from omta15.westchester.pa.mail.comcast.net ([76.96.62.87])
	by qmta07.westchester.pa.mail.comcast.net with comcast
	id dQog1d0041swQuc57S31DB; Wed, 03 Feb 2010 14:03:01 +0000
Received: from sz0154.wc.mail.comcast.net ([76.96.58.220])
	by omta15.westchester.pa.mail.comcast.net with comcast
	id dS4A1d00C4l5d103bS4AZ6; Wed, 03 Feb 2010 14:04:10 +0000
Date: Wed, 3 Feb 2010 14:03:01 +0000 (UTC)
From: pspreadborough@comcast.net
To: openembedded-devel@lists.openembedded.org
Message-ID: <1497161523.3479291265205781088.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
MIME-Version: 1.0
X-Originating-IP: [76.24.64.15]
X-Mailer: Zimbra 5.0.19_GA_3172.RHEL5_64 (ZimbraWebClient - FF3.0
	(Linux)/5.0.19_GA_3177.RHEL5_64)
X-SA-Exim-Connect-IP: 76.96.62.64
X-SA-Exim-Mail-From: pspreadborough@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: EABI pain and frustration!
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
X-List-Received-Date: Wed, 03 Feb 2010 14:06:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


My 2.6.29 kernel is built with the CodeSourcery arm-2009q3-67-arm-none-linux-gnueabi 
compiler and has the EABI and OABI_COMPAT config options enabled. Using this kernel 
I can boot my SA1110 iPaq into a OABI ramfs with no problems, however if I build a 
"HelloWorld" executable with the same compiler and try and run it I get an "Illegal Instruction" 
error. I build the test program using static linking, select the correct machine type and tune 
options but to no avail, I always get the illegal instruction. 


Any help or suggestions would be greatly appreciated. 

Cheers, 

Pete 


