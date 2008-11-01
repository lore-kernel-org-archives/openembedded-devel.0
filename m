Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KwHhh-0003bL-Ex
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Nov 2008 15:43:53 +0100
Received: from [92.117.139.190] (helo=tamarin.localnet)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KwH4J-0005RU-UI
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Nov 2008 15:03:12 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 1 Nov 2008 15:02:51 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.27-7-generic; KDE/4.1.2; i686; ; )
MIME-Version: 1.0
Message-Id: <200811011502.53124.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.139.190
Subject: [RFC] I would like to merge holger/enterprise into oe.dev
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
X-List-Received-Date: Sat, 01 Nov 2008 14:43:54 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey guys,

In the GStreamer world there are the terms like "Good", "Bad" and "Ugly" to 
qualify plugins. While "Good" and "Bad" only refer to the quality of the code, 
"Ugly" is referring to the abuse of technology.

Sometimes people find them in a situation that they do not want to 
distribute/provide "Ugly" plugins, e.g for political reasons (like Fedora and 
mp3), sometimes for other reasons...

In my holger/enterprise branch I have added an enterprise.conf which is 
masking (BBMASK) the ugly packages and is changing the bb to not depend on 
ugly packages in. I would like to merge this.

comments welcome
	z.



