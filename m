Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1N3WGE-0006QZ-AF
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Oct 2009 15:46:01 +0100
Received: from w1261.wlan.rz.tu-bs.de ([134.169.204.245] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1N3WF6-0002jq-VC by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2009 15:44:51 +0100
Received: from stefan by excalibur with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1N3WF6-0001I6-AB
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Oct 2009 15:44:48 +0100
Date: Thu, 29 Oct 2009 15:44:48 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091029144448.GB3619@excalibur.local>
References: <1256813632.31481.14.camel@nvc0624>
MIME-Version: 1.0
In-Reply-To: <1256813632.31481.14.camel@nvc0624>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: recipe for xilinx jtag tool
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
X-List-Received-Date: Thu, 29 Oct 2009 14:46:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2009-10-29 at 11:53, Jaap de Jong wrote:
> 
> I've build my first openembedded recipe (please don't shoot!)
> What would be the way to publish it?

Commit it in your local git repo and then do a git format-patch -1 and then send
it to the list.

regards
Stefan Schmidt


