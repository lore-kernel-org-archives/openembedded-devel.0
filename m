Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N8FaU-0004dO-Pg
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 16:58:31 +0100
Received: (qmail 4599 invoked by uid 1003); 11 Nov 2009 15:57:07 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 11 Nov 2009 15:57:07 -0000
Message-ID: <4AFADED2.8010708@balister.org>
Date: Wed, 11 Nov 2009 10:57:06 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Summary of Toolchain/SDK session
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
X-List-Received-Date: Wed, 11 Nov 2009 15:58:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Toolchain generation is currently a fragile process. Richard's staging 
changes should help resolve these issues.

There are several classes of developers:

1) Create recipes for existing software.
2) Modifying kernel config within OE.
3) People creating new software to run on machine that can not be tested 
on desktop.

Marco and Ken briefly presented their Eclipse based projects to help 
developers. Marco's is targeted at hiding OE from developers, Ken's 
provides help for people writing recipes. Ken has promised to write more 
on the eclipse plugin issues.

http://community.buglabs.net/kgilmer/posts/110-BitBake-Commander-6-8-Installers-

For SW developers (3) there is an Anjuta plugin:

http://labs.o-hand.com/anjuta-poky-sdk-plugin/

and you can do remote development on a Beagle with Netbeans:

http://mechomaniac.com/BeagleboardDevelopmentWithNetbeans

There was also discussion on making it easier to install OE/bitbake.

Conclusions:

1) Toolchain generation should improve after staging layout changes.
2) People are working on Eclipse plugins, this should be encouraged.
3) Need better documentation to setup Eclipse and CDT with OE toolchains.
4) Need to add a page linking to projects that are useful for people 
using OE.

Philip



