Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NhIUX-0005jy-Az
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 09:09:12 +0100
Received: from [89.204.153.0] (helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NhIRx-0007WC-4N by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 09:06:32 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NhIRu-0001PQ-T4
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 09:06:26 +0100
Date: Tue, 16 Feb 2010 09:06:26 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100216080626.GA3918@excalibur.local>
References: <ec7df6a60911180142j65980c0bnaf494f4c76fbe980@mail.gmail.com>
	<1258537737.25369.684.camel@lenovo.internal.reciva.com>
	<4B03C4DB.2020105@gmail.com>
	<1258539773.26517.90.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1258539773.26517.90.camel@mill.internal.reciva.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Proposed patch for usb-gadget
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
X-List-Received-Date: Tue, 16 Feb 2010 08:09:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2009-11-18 at 10:22, Phil Blundell wrote:
> On Wed, 2009-11-18 at 10:56 +0100, Tasslehoff wrote:
> > The only reason I did this was because setup_usb() doesn't use the 
> > argument at all, but uses $MODULE_OPTIONS directly.
> 
> Okay, that makes sense.  I checked this patch in.

I was just going through patchwork and this one was still left open. Cheking
HEAD it seems not to be applied. Phil, did go got disturbed and forgot about
this one?

regards
Stefan Schmidt


