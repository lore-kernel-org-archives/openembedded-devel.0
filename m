Received: from [65.55.90.226] (helo=snt0-omc4-s23.snt0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kadir_inay@hotmail.com>) id 1My3HR-0004n1-DO
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 14:48:40 +0200
Received: from SNT116-W3 ([65.55.90.200]) by snt0-omc4-s23.snt0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 14 Oct 2009 05:47:41 -0700
Message-ID: <SNT116-W3D93DBBAA692902D8ECDDFAC60@phx.gbl>
X-Originating-IP: [78.161.146.217]
From: Kadir INAY <kadir_inay@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Oct 2009 12:47:41 +0000
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Oct 2009 12:47:41.0320 (UTC)
	FILETIME=[847B6880:01CA4CCC]
X-SA-Exim-Connect-IP: 65.55.90.226
X-SA-Exim-Mail-From: kadir_inay@hotmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: binutils-cross_2.18.50.0.7.bb do_compile failed
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
X-List-Received-Date: Wed, 14 Oct 2009 12:48:40 -0000
Content-Type: text/plain; charset="windows-1254"
Content-Transfer-Encoding: 8bit


Hi...

I am new OpenEmbedded. I am using Mini2440 with Arm9 processor.

 

I made necessary setting inside ../build/canf/local.conf and run edited script source-me.txt

 

My Linux OS is Debian Lenny 5.0 on VirtualBox. I setup all required packet. After

 

$bitbake qtopia-core-gui-image

 

continued for a long time and gave errors 
 

ERROR: Build of ....../mini2440/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb do_compile failed

 

My hours were wasted waiting. 


Can someone help..I will be very grateful.... 		 	   		  
_________________________________________________________________
Windows Live: Arkadaþlarýnýzýn çevrimiçi ortamda yaptýklarýnýzdan haberdar olmasýný saðlayýn.
http://www.microsoft.com/windows/windowslive/see-it-in-action/social-network-basics.aspx?ocid=PID23461::T:WLMTAGL:ON:WL:tr-tr:SI_SB_1:092010
From holger+oe@freyther.de Wed Oct 14 15:04:36 2009
Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1My3Wr-0002At-0R
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 15:04:36 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 59DCD1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 13:12:07 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Oct 2009 15:03:17 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <SNT116-W3D93DBBAA692902D8ECDDFAC60@phx.gbl>
In-Reply-To: <SNT116-W3D93DBBAA692902D8ECDDFAC60@phx.gbl>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="windows-1254"
Content-Transfer-Encoding: 7bit
Message-Id: <200910141503.17731.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe] binutils-cross_2.18.50.0.7.bb do_compile failed
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
X-List-Received-Date: Wed, 14 Oct 2009 13:04:36 -0000

On Wednesday 14 October 2009 14:47:41 Kadir INAY wrote:

> My hours were wasted waiting.

You just wasted bandwidth, storage and time of many people and servers sending 
this email. If you ask for help on a development mailinglist (instead of user) 
at least provide enough information to be actually help you.

So far you have told the world that compiling binutils 2.18.50.0.7 failed to 
build on your host. Bitbake/OE were so kind to create a log file for you, and 
it refers to the log file on the screen. Did you consider looking at the 
referred log file? If not be so kind to read and try to understand the log file, 
if you don't then ask a _specific_ question. Read DO NOT simply post the log 
file without having read it.


love
	z.


