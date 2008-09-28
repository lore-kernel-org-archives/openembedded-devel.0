Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KjlWS-0005Dn-7b
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Sep 2008 03:56:32 +0200
Received: from [92.117.146.220] (helo=[10.161.146.220])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KjlSh-0006xc-Ap
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Sep 2008 03:52:40 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Sep 2008 03:52:27 +0200
User-Agent: KMail/1.9.9
References: <20080925191451.GA17447@rhein.zuhause.netz>
	<200809260332.35358.zecke@selfish.org>
	<20080926193648.GA12460@rhein.zuhause.netz>
In-Reply-To: <20080926193648.GA12460@rhein.zuhause.netz>
MIME-Version: 1.0
Message-Id: <200809280352.28293.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.146.220
Subject: Re: Discussion about gettext.bbclass
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
X-List-Received-Date: Sun, 28 Sep 2008 01:56:32 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 26 September 2008 21:36:49 Henning Heinold wrote:
> Here is the patch now.
>
> Bye Henning

When do you want to do the renaming to nls.bbclass? Besides that I don't see 
anything wrong in your patch.

When you propose the nls.bbclass we should also cleanup the existing recipes 
putting virtual/libintl and virtual/libiconv into the DEPENDS.

z.


