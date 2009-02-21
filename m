Received: from [85.13.140.93] (helo=dd20204.kasserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1LavJ3-0005lk-Uk
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Feb 2009 18:06:26 +0100
Received: from [192.168.1.102] (77-21-130-108-dynip.superkabel.de
	[77.21.130.108])
	by dd20204.kasserver.com (Postfix) with ESMTP id 363D3181E883C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2009 18:03:52 +0100 (CET)
Message-ID: <49A033F4.4090807@opensimpad.org>
Date: Sat, 21 Feb 2009 18:03:48 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: tcl tk: tclConfig.sh/tkConfig.sh ${STAGING_BINDIR_CROSS} or ${STAGING_LIBDIR} ?
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
X-List-Received-Date: Sat, 21 Feb 2009 17:06:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
I am currently try to build hv3 [1] - a super fast and small browser 
(dillo2 killer ?).
I need to provide the PATH to  tclConfig.sh/tkConfig.sh which is 
currently ${STAGING_BINDIR_CROSS}. Is this the right PATH or should tcl 
tk place tclConfig.sh/tkConfig.sh to ${STAGING_LIBDIR} ?

Best regards
Bernhard Guillon

1http://tkhtml.tcl.tk/hv3.html


