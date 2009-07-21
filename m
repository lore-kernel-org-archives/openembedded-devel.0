Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MTJr3-0000pg-6G
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 20:14:21 +0200
Received: from 79-79-174-216.dynamic.dsl.as9105.com ([79.79.174.216]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MTJdP-0003Q1-My
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 19:00:16 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A65EF53.1080508@atmel.com>
References: <4A657D58.4070404@atmel.com>
	<1248173048.28930.59.camel@mill.internal.reciva.com>
	<4A65EF53.1080508@atmel.com>
Date: Tue, 21 Jul 2009 19:00:14 +0100
Message-Id: <1248199214.16040.450.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [RFC] hal-0.5.12 requires blkid >= 1.43
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
X-List-Received-Date: Tue, 21 Jul 2009 18:14:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-07-21 at 18:39 +0200, Ulf Samuelsson wrote:
> Looks like "gpe-image" should be updated to use "util-linux-ng"
> instead of my proposed patch.

I don't think this is a gpe-image issue as such; it sounds more like a
case of wrong dependencies on the hal package.

p.




