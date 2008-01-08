Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <zecke@selfish.org>) id 1JCFWq-0003eC-RS
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 15:34:08 +0100
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=abughraib.localdomain) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JCFQ5-000152-Vj
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 15:27:10 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 8 Jan 2008 15:27:09 +0100
User-Agent: KMail/1.9.6 (enterprise 0.20071204.744707)
References: <47836C9B.3000407@gmx.net>
In-Reply-To: <47836C9B.3000407@gmx.net>
MIME-Version: 1.0
Message-Id: <200801081527.09859.zecke@selfish.org>
Subject: Re: RFC: add osso version of libtool and libatk
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
X-List-Received-Date: Tue, 08 Jan 2008 14:34:08 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 08 January 2008 13:29:15 Robert Schuster wrote:
> Hi,
> on IRC it was suggested to put this on the mailing list.

Hey,
I don't like adding vendor hacked versions of standard software at all. I see 
the requirement you are facing but adding a Nokia hacked version is not the 
right way to do it.

What are the differences you see? Can you extract the patch that is doing 
that? Is that patch a good idea and can be applied to our version of libtool?


kind regards
	z.


PS: I care more for libtool than atk+ (did they break API/ABI compability on 
it?) 


