Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JZ2C7-0007zB-HU
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 11:59:00 +0100
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JZ2AE-0006NY-FK
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 11:56:58 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2008 11:56:55 +0100
User-Agent: KMail/1.9.9
References: <200803110807.11368.zecke@selfish.org>
	<20080311101433.77a09fd2@cimmeria> <fr5neg$l26$1@ger.gmane.org>
In-Reply-To: <fr5neg$l26$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200803111156.55481.zecke@selfish.org>
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Mar 2008 10:59:00 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 11 March 2008 11:38:07 Koen Kooi wrote:
> Graeme Gregory schreef:


> * track .dev: mtn propagate org.openembedded.dev org.openmoko.needmorebru

Non content conflict. ugh! What to do now?

And this has happened with the dreambox branch and this is why I can't 
encourage anyone to use branches with monotone. Even if there is some kind of 
management issue with whatever branch, the tool should not punish this by not 
being able to manage, it is a tool and it should do what it is meant ot be: 
Allow distributed development, and not being able to merge is defeating this 
purpose.


