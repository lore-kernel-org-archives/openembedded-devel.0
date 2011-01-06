Received: from mx194.callplus.net.nz ([202.180.66.194]
	helo=mxi2.callplus.net.nz) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roystonvasey@slingshot.co.nz>) id 1PaweY-0006Ms-3X
	for Openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 21:41:46 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApwFADK3JU3LYgoS/2dsb2JhbACCKZNnjwK9dQ2FPwSQMA
Received: from smtp.connexionz.co.nz (HELO mikepad) ([203.98.10.18])
	by ismtp02.callplus.net.nz with ESMTP; 07 Jan 2011 09:40:13 +1300
From: "R U Local" <roystonvasey@slingshot.co.nz>
To: <Openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Jan 2011 09:40:11 +1300
Message-ID: <00a001cbade1$ea44dee0$bece9ca0$@slingshot.co.nz>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Acut4em3h8hh8lSiRTWhh8HpwuugOg==
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Mono recipe fails at do_install
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
X-List-Received-Date: Thu, 06 Jan 2011 20:41:46 -0000
Content-Language: en-nz
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear List, 
I'm working on the Overo branch and just done a git pull to rebuild my
platform. 
My previous head was 58feb7f form 2010-11-10. 
I'm getting an error in the Mono package build for task do_install. 
The mono-native and mono-mcs-intermediate parts build fine. 
There have been no changes to the mono source or the recipe during this
time. 

Has there been any changes to the way OE  is structured between these
commits that I should take a look at? 

Any help or suggestions would be appreciated. 

Cheers Mike. 

 

 

 


