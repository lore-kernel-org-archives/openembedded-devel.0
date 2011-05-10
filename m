Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QJjse-0003PA-JJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 12:09:28 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QJjkm-00079w-Bp
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 12:01:20 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110510100020.GA10493@mx.loc>
References: <4DC8F3A2.2090005@nedap.com>  <20110510100020.GA10493@mx.loc>
Date: Tue, 10 May 2011 11:06:44 +0100
Message-ID: <1305022004.8000.149.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: x86_64
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
X-List-Received-Date: Tue, 10 May 2011 10:09:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 12:00 +0200, Bernhard Reutner-Fischer wrote:
> On Tue, May 10, 2011 at 10:13:22AM +0200, Jaap de Jong wrote:
> >Hi All,
> >
> >is there any support for 64 bit intel/amd machines?
> >And if so, how to build for them?
> 
> Can we settle on a name please for i want to add a qemu machine for
> testing x86_64?
> 
> x8664
> amd64
> ...
> 
> Opinions?

"x86_64" seems to be what's currently used as the architecture name.  If
you want a value for ${MACHINE} then I guess something like
"x86_64-generic" would do.  I don't think there's any prohibition
against underscores in machine names.

p.




