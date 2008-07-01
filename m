Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KDkn0-0004tP-Ub
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jul 2008 20:41:19 +0200
Received: from 212-139-101-148.dynamic.dsl.as9105.com ([212.139.101.148]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KDkk1-0003Uc-98
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jul 2008 19:38:13 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <871w2djwme.fsf@neumann.lab.ossystems.com.br>
References: <877ic6srbf.fsf@neumann.lab.ossystems.com.br>
	<1214853946.21138.8.camel@lenovo.internal.reciva.com>
	<87zlp2elny.fsf@neumann.lab.ossystems.com.br>
	<1214858808.21138.20.camel@lenovo.internal.reciva.com>
	<87r6aeabjb.fsf@neumann.lab.ossystems.com.br>
	<1214861173.21138.24.camel@lenovo.internal.reciva.com>
	<87od5i8urj.fsf@neumann.lab.ossystems.com.br>
	<1214862651.21138.26.camel@lenovo.internal.reciva.com>
	<871w2djwme.fsf@neumann.lab.ossystems.com.br>
Date: Tue, 01 Jul 2008 19:38:27 +0100
Message-Id: <1214937507.21138.31.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: Re: Problem with i18n (input)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 01 Jul 2008 18:41:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-07-01 at 15:19 -0300, Otavio Salvador wrote:
> Phil Blundell <pb@reciva.com> writes:
> 
> > On Mon, 2008-06-30 at 18:42 -0300, Otavio Salvador wrote:
> >> I've tryed it on both, a regular Debian system and it does load the
> >> Compose file. At OE image, it does not.
> >
> > Is it even loading compose.dir on your OE image?
> 
> It's not.

Hum.  How about locale.dir, does it load that one?

p.




