Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nzu7r-0001b8-N5 for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 17:58:40 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nzu4b-0008Ui-Cv for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 17:55:17 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 17:55:17 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 17:55:17 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 08 Apr 2010 17:55:02 +0200
Message-ID: <hpku8m$a4p$1@dough.gmane.org>
References: <20100403171724.b9df4c84.ospite@studenti.unina.it>	<201004032017.10514.marcin@juszkiewicz.com.pl>	<20100408161130.b0b6ed73.ospite@studenti.unina.it>	<hpkoet$h25$1@dough.gmane.org>
	<20100408162533.ae09c2c4.ospite@studenti.unina.it>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100329 Shredder/3.0.5pre
In-Reply-To: <20100408162533.ae09c2c4.ospite@studenti.unina.it>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gtk+-native-2.20.0-r8.0 fails in do_configure.
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
X-List-Received-Date: Thu, 08 Apr 2010 15:58:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-04-10 16:25, Antonio Ospite wrote:
> On Thu, 08 Apr 2010 16:15:57 +0200
> Koen Kooi <k.kooi@student.utwente.nl> wrote:
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 08-04-10 16:11, Antonio Ospite wrote:
>>
>>> versioned dependencies are possible in .bb files
>>
>> Actually, they aren't. DISTROs should take care of stuff like this in
>> the current OE design.
> 
> In what sense they are not possible?

You can add them, but the version will get ignored

> I can see some with
> git grep DEPENDS | grep '>=' 
> but that could be misleading me.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLvfxVMkyGM64RGpERAj+/AJwPJm/oYtGh35gpUBAeit29Z4gJKQCcDCRE
duxFuFKdJp8aYVQzjT6SROw=
=G/m/
-----END PGP SIGNATURE-----



