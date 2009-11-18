Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NArNP-0002Ww-DM
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 21:43:46 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NArLz-0005yz-QW
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 20:42:16 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
References: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
Date: Wed, 18 Nov 2009 20:42:04 +0000
Message-ID: <1258576924.25369.687.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Wed, 18 Nov 2009 20:43:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-18 at 18:11 -0200, Otavio Salvador wrote:
> From my POV the best alternative is, before we start changing a lot of
> stuff in dev we do a merge of stable/2009 into dev to allow easy
> merging from outside "forks" made by users.

I don't quite understand what you mean by merging stable/2009 into dev.
Isn't it the case that all the changesets in stable/2009 were
cherry-picked from .dev in the first place, and hence are already there?

Can you give a bit more detail on what exactly you are proposing?

p.




