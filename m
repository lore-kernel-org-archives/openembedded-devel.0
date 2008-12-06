Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1L8yNj-0001Gg-C6
	for openembedded-devel@openembedded.org; Sat, 06 Dec 2008 15:43:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mB6Edhcc009027;
	Sat, 6 Dec 2008 14:39:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08960-02; Sat,  6 Dec 2008 14:39:39 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mB6Edaho009021
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 6 Dec 2008 14:39:36 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev@lists.berlios.de
Date: Sat, 06 Dec 2008 14:39:36 +0000
Message-Id: <1228574376.5375.6.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Bitbake release
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
X-List-Received-Date: Sat, 06 Dec 2008 14:43:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

As people have probably noticed I just synced up a number of useful
changes from Poky into bitbake and brought things pretty much back into
sync.

The current plan is to let this stabilise for 1 week and the providing
no major bugs were introduced, make a new release (finally!).

Could people therefore upgrade to latest bitbake-1.8 from svn and report
any problems please. 

For reference, we will probably make OE.dev depend on the new bitbake
version pretty rapidly allowing some cleanups and optimisation unless
there are any strong objections.

Cheers,

Richard

-- 
Richard Purdie
Intel Open Source Technology Centre



