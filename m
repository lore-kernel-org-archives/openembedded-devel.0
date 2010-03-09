Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Np6Pv-0002Vp-8Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 21:52:40 +0100
Received: from 88-108-113-12.dynamic.dsl.as9105.com ([88.108.113.12]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Np6N5-00043r-VW
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 20:49:44 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100306193907.GA5881@xora-build.xora.org.uk>
References: <20100306193907.GA5881@xora-build.xora.org.uk>
Date: Tue, 09 Mar 2010 20:49:42 +0000
Message-ID: <1268167782.5437.2039.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Possible gtk+-native de-breakage
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
X-List-Received-Date: Tue, 09 Mar 2010 20:52:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-03-06 at 19:39 +0000, Graeme Gregory wrote:
> Hi, I knocked this up while doing some enterprise java installs this after
> noon and Im too brain fried to deal with it and wont have time in next few
> days.
> 
> So can people checkout the attached patch/improve it.

Thanks.  I checked this patch in, apart from the deletion of the
existing gdk-pixbuf-csource-native and that RRECOMMENDS_
${PN}_libc-uclibc line that we discussed on irc.  If that really is
necessary then I would like to understand why before adding it.

p.




