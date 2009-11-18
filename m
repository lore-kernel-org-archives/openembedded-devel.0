Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NAhi3-0003Xw-El
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 11:24:26 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NAhgg-0000fW-6u
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 10:22:58 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NAhge-0003Z2-OD
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 10:22:56 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B03C4DB.2020105@gmail.com>
References: <ec7df6a60911180142j65980c0bnaf494f4c76fbe980@mail.gmail.com>
	<1258537737.25369.684.camel@lenovo.internal.reciva.com>
	<4B03C4DB.2020105@gmail.com>
Date: Wed, 18 Nov 2009 10:22:53 +0000
Message-Id: <1258539773.26517.90.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
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
X-List-Received-Date: Wed, 18 Nov 2009 10:24:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-18 at 10:56 +0100, Tasslehoff wrote:
> The only reason I did this was because setup_usb() doesn't use the 
> argument at all, but uses $MODULE_OPTIONS directly.

Okay, that makes sense.  I checked this patch in.

thanks

p.




