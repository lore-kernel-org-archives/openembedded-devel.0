Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Kt8WN-0006U6-1V
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Oct 2008 00:19:11 +0200
Received: from p5b0375ab.dip.t-dialin.net ([91.3.117.171]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Kt8Vo-0001zI-BK by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2008 00:18:38 +0200
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1Kt8W2-0006Ir-6t for openembedded-devel@lists.openembedded.org;
	Fri, 24 Oct 2008 00:18:50 +0200
Date: Fri, 24 Oct 2008 00:18:50 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081023221850.GA7780@dodger.lab.datenfreihafen.org>
References: <20081022141057.GA8564@dodger.lab.datenfreihafen.org>
	<gdnj3q$ei6$2@ger.gmane.org>
	<20081023173830.GA14304@dodger.lab.datenfreihafen.org>
	<gdqdt1$3c2$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gdqdt1$3c2$1@ger.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: Some review for the stefan/xo-support branch
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
X-List-Received-Date: Thu, 23 Oct 2008 22:19:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2008-10-23 at 19:56, Koen Kooi wrote:
> On 23-10-2008 19:38, Stefan Schmidt wrote:
>>
>> Good point. The newest mainline tag I could find inside the repo was .22
>
> The easiest way is to look at the top-level kernel makefile, that has  
> the exact version.

That would indeed have been easier. :)

>> http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=973295dbb4ab499c2c61972d0410ed8385d93447
>
> Looks good!

So you are through with your review? Anybody else objections about me pushing
this in org.oe.dev?

>> One of the next steps is to test out how good mainline support is nowadays for
>> the XOs.
>
> Some sugar people are working on expanding the sugar support in OE, you  
> can track their work here:  
> https://www.develer.com/gitweb/pub?p=users/bernie/beagle-sugar.git;a=summary
>
> They plan to send us polished patches later on.

Great. With all the other people working on sugar in OE I'll keep my work around
the XO machine support. That way the pieces come together later.

regards
Stefan Schmidt


