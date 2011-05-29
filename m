Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QQmIh-0001en-Rr
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 22:09:27 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QQmFi-0008OH-IT
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 22:06:22 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <7b45d7328db0411ae61bd6db0fd2fabfc5dd2247.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
	<7b45d7328db0411ae61bd6db0fd2fabfc5dd2247.1306696348.git.Martin.Jansa@gmail.com>
Date: Sun, 29 May 2011 21:03:52 +0100
Message-ID: <1306699432.28663.0.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [meta-oe][PATCH 05/16] evtest: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 20:09:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-29 at 21:17 +0200, Martin Jansa wrote:
> +SRC_URI = "http://cgit.freedesktop.org/~whot/evtest/snapshot/evtest-${PV}.tar.bz2;name=archive"

Is "cgit." really the right vhost name to be using there?  Judging from
the rest of the URL I would guess it ought to be "people.".

p.




