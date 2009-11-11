Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N8Hza-00088w-O1
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 19:32:34 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N8HyJ-00018S-TF
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 18:31:12 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d1b08f940911110941h3b145988s3afe5fe109b938b@mail.gmail.com>
References: <4AF963A3.1050906@balister.org>
	<20091110131554.GA25450@denix.org> <4AF996BE.2080904@balister.org>
	<20091111161608.GA3246@denix.org>
	<1257960636.25369.404.camel@lenovo.internal.reciva.com>
	<d1b08f940911110941h3b145988s3afe5fe109b938b@mail.gmail.com>
Date: Wed, 11 Nov 2009 18:31:05 +0000
Message-ID: <1257964265.25369.416.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mailing lists
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
X-List-Received-Date: Wed, 11 Nov 2009 18:32:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-11 at 18:41 +0100, Andrea Adami wrote:
> FWIW I experience since some days strange delays, probably caused by
> greylisting.
> I suspect all gmail users are affected.
> 
> On my server I use following whitelist_dsname table for greylist demon
> (policyd):
> bigfish.com  	# bigfish.com has smtp servers behind multiple ips
> google.com 	# Google for GMail 	^^^

Yeah, it does look as though gmail folks are getting greylisted rather
often.  I'll see if I can install a similar whitelist on ltg.

p.




