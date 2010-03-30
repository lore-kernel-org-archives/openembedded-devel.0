Received: from smtp-out26.alice.it ([85.33.2.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NwiZG-0001Fv-3X
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 23:01:46 +0200
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 30 Mar 2010 22:58:29 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 30 Mar 2010 22:57:55 +0200
Received: from [192.168.1.116] ([79.21.202.115]) by FBCMCL01B03.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 30 Mar 2010 22:57:55 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BB1EBEC.8050109@balister.org>
References: <4BB1EBEC.8050109@balister.org>
Date: Tue, 30 Mar 2010 22:57:54 +0200
Message-ID: <1269982674.2390.3.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 30 Mar 2010 20:57:55.0393 (UTC)
	FILETIME=[AB9F0310:01CAD04B]
X-SA-Exim-Connect-IP: 85.33.2.26
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Boost version
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
X-List-Received-Date: Tue, 30 Mar 2010 21:01:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-03-30 at 08:17 -0400, Philip Balister wrote:
> I'd like to remove the DEFAULT_PREFERENCE = "-1" from the boost recipes 
> so we are using the latest boost.
> 
> Currently, I am checking the packages that use boost I care about, such 
> as gnuradio.
> 
> Does anyone else care what version of boost is the default?
I care,I prefer the last ones (1.4x) for wesnoth 1.6x
> Also, the boost-1.41 recipe is based of the cmake branch of boost. How 
> well maintained is this? It has been two months since boost-1.42 was 
> released and there is not corresponding cmake version.
Seem not very maintained...
Maybe look at http://gitorious.org/boost/cmake
it's their git repo.
(SRC_URI->download page->readme)

Denis



