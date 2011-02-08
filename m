Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PmonV-00023s-T1
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 15:44:06 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PmomR-0002Tb-0m from Tom_Rini@mentor.com ;
	Tue, 08 Feb 2011 06:42:59 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 8 Feb 2011 06:42:57 -0800
Received: from [172.30.80.130] ([172.30.80.130]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 8 Feb 2011 07:42:57 -0700
Message-ID: <4D51566B.9060603@mentor.com>
Date: Tue, 08 Feb 2011 07:42:51 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 08 Feb 2011 14:42:57.0834 (UTC)
	FILETIME=[7A2730A0:01CBC79E]
Subject: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Tue, 08 Feb 2011 14:44:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

As March is fast approaching I want to gather the list of DISTRO / 
MACHINE / BBPKGS targets that the various distributions would like to 
see at least compile tested (volunteers for HW testing welcome!). 
Today, I have the following setup to be built:

minimal / minimal-uclibc:
qemux86/ppc/arm/mips/mips64/sh4/mipsel, mpc8315e-rdb, p2020ds, p2020rdb 
+ 
nas-server-image/native-sdk-image/console-image/minimal-image/x11-image/meta-toolchain/qt4-x11-demo-image/qt4e-demo-image

angstrom-2008.1 / angstrom-2010.x:
hawkboard, mini2440, mini6410, beagleboard + console-image / 
qt4-x11-demo-image / qt4e-demo-image

slugos / ucslug:
nslu2be/le + slugos-image

I'm building all of these for 32bit Ubuntu 8.04, RHEL5 and will be 
adding Ubuntu 10.04 for the next run.  What more do people want added? 
I'm looking to fill this matrix out to something that runs "over the 
weekend" and I've still got plenty of room to spare (which is why I've 
bcc'd everyone in the MAINTAINERS file with a Distro by their name).

And of course if you wish to handle building what you care about 
yourself instead, that's great!  Please just take this as a gentle 
reminder that there's a release coming up so it's time to crank the 
builders up and make sure your stuff is working.

-- 
Tom Rini
Mentor Graphics Corporation


