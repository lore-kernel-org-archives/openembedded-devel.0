Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PCzkU-0002aK-SV
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 20:08:55 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 0B7191D36171; Mon,  1 Nov 2010 20:08:03 +0100 (CET)
Date: Mon, 1 Nov 2010 20:08:03 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101101190803.GE15069@ibawizard.net>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikQvYRyaMspRo9Skt_jmfNjz2MuOT+ff4wv=a82@mail.gmail.com>
	<AANLkTi=zxQ1AxJ9chbFjLJzps1LB8RCyaNkJk5HApTZ=@mail.gmail.com>
	<20101101183327.GD15069@ibawizard.net>
	<AANLkTimN4Rq2bWZXjs84FUtxNgD_BAQy=5=4gXJqfPGe@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimN4Rq2bWZXjs84FUtxNgD_BAQy=5=4gXJqfPGe@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 19:08:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Frans Meulenbroeks <fransmeulenbroeks@gmail.com> [2010-11-01 19:49:19]:

> > No more columns please. I think, that I should receive a PhD just because I
> > can update that table :-) It's pure rocket science...
> 
> Put the table in a spreadsheet?
> I think google docs can be used to share access to a common sheet (but
> not fully sure).

That's the question :-) Maybe some mod to the tinderbox client and if the
builder is building testing-next and the build succeeded, then update
something, somehwere automatically? Or does it need to be done manually at
all?

INHERIT += "oestats-client-testing-next"
OESTATS_HOST_DISTRO = "Ubuntu 10.04" (auto using lsb_release?)
OESTATS_WHATEVER = "..."

-- ynezz


