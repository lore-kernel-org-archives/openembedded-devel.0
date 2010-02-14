Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NgmA6-00061a-EC
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 22:37:58 +0100
Received: from [85.210.8.8] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Ngm7N-0003LB-EM
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 21:35:09 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
Date: Sun, 14 Feb 2010 21:34:44 +0000
Message-ID: <1266183284.5437.37.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.8.8
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/8] hwclock.sh: some more !getopt_long fixes
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
X-List-Received-Date: Sun, 14 Feb 2010 21:37:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-02-10 at 21:12 +0100, Bernhard Reutner-Fischer wrote:
> busybox' hwclock can be built without support for getopt_long.
> Flags of the big hwclock are compatible with the busybox version.
> 
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

Thanks.  I checked this in.

p.




