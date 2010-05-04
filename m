Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9Jd0-0001HA-2h for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 17:01:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9JZM-0007pi-Tg for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 16:57:56 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 16:57:56 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 16:57:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 04 May 2010 16:57:47 +0200
Message-ID: <hrpclb$dhp$1@dough.gmane.org>
References: <108741502.29960271272980979803.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
In-Reply-To: <108741502.29960271272980979803.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Unicap Imaging API
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
X-List-Received-Date: Tue, 04 May 2010 15:01:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04-05-10 15:49, John Buckley wrote:
> 
> 
> Hello, 
> 
> Does anyone have any experience getting the Unicap imaging API working on OpenEmbedded? 

OE has recipes for 'ucview' and 'unicap'. Angstrom should have binaries
from both in the arm feeds.

regards,

Koen

> 
> 
> 
> This API that was specifically written for cameras from The Imaging Source.com ( www.theimagingsource.com ) 
> 
> 
> 
> I just recently found out that the cameras are not UVC compliant and require the Unicap API to communicate with them. 
> 
> One of their cameras is listed on the UVC compliant hardware list!!!  The salesman convinced me it was UVC compliant and now the API developer is telling me it is not UVC compliant. 
> 
> 
> 
> I had developed a large application in GStreamer with a UVC compliant camera and I have made great progress.  I don't want to lose ground by heading down a dead end. 
> 
> 
> 
> John 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL4DXrMkyGM64RGpERAutUAKCkP4OAnjtNXYssPV64Gj8ycPD32gCeKW3f
tC6/ly7AhmcWQHrqLF8sOhE=
=kARb
-----END PGP SIGNATURE-----



