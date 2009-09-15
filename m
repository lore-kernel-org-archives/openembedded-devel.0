Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MnTAg-0007CX-6d
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 10:13:57 +0200
Received: from [81.170.68.179] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MnTAC-0001A7-5w
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 09:13:24 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4AADA377.6010005@symas.com>
References: <4AADA377.6010005@symas.com>
Date: Tue, 15 Sep 2009 09:13:22 +0100
Message-Id: <1253002402.4490.1105.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 81.170.68.179
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: python-wpactrl
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
X-List-Received-Date: Tue, 15 Sep 2009 08:13:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-09-13 at 18:59 -0700, Howard Chu wrote:
> Here's a recipe file for the python-wpactrl module, which connects to 
> wpa_supplicant's control interface. It works for me...

Thanks for the patch.

Your bb file is named "python-wpactrl_1.0", which would suggest that
this is for version 1.0 of the package.  But the SRC_URI seems to point
to some random-looking svn revision.  Can you clarify what the
versioning situation is with that?

The patch looks fine to me otherwise.

p.




