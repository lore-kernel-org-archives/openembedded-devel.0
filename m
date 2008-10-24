Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1KtUB5-0008Bi-W9
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Oct 2008 23:26:40 +0200
Received: from p5b0372ca.dip.t-dialin.net ([91.3.114.202]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1KtUAT-0002fL-6X by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2008 23:26:03 +0200
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1KtUAk-0002Sf-2H for openembedded-devel@lists.openembedded.org;
	Fri, 24 Oct 2008 23:26:18 +0200
Date: Fri, 24 Oct 2008 23:26:18 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081024212618.GF4017@dodger.lab.datenfreihafen.org>
References: <20081022141057.GA8564@dodger.lab.datenfreihafen.org>
	<gdnj3q$ei6$2@ger.gmane.org>
	<20081023173830.GA14304@dodger.lab.datenfreihafen.org>
	<gdqdt1$3c2$1@ger.gmane.org>
	<20081023221850.GA7780@dodger.lab.datenfreihafen.org>
	<gdshd9$90u$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gdshd9$90u$1@ger.gmane.org>
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
X-List-Received-Date: Fri, 24 Oct 2008 21:26:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello

On Fri, 2008-10-24 at 15:08, Koen Kooi wrote:
> On 24-10-2008 00:18, Stefan Schmidt wrote:
>>
>> On Thu, 2008-10-23 at 19:56, Koen Kooi wrote:
>>> On 23-10-2008 19:38, Stefan Schmidt wrote:
>>>> Good point. The newest mainline tag I could find inside the repo was .22
>>> The easiest way is to look at the top-level kernel makefile, that has
>>> the exact version.
>>
>> That would indeed have been easier. :)
>>
>>>> http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=973295dbb4ab499c2c61972d0410ed8385d93447
>>> Looks good!
>>
>> So you are through with your review? Anybody else objections about me pushing
>> this in org.oe.dev?
>
> The PV was my only comment, the rest looks good enough to go in.

OK, thanks. I'm busy tomorrow so I'll put it in tomorrow evening or sunday.
Gives also one more day for last minute comments.

regards
Stefan Schmidt


