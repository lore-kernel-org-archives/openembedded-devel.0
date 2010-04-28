Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O7ACr-0006Zr-MN for openembedded-devel@lists.openembedded.org;
	Wed, 28 Apr 2010 18:33:51 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O7A9E-0000rj-J3 for openembedded-devel@lists.openembedded.org;
	Wed, 28 Apr 2010 18:30:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Apr 2010 18:30:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Apr 2010 18:30:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 28 Apr 2010 18:25:08 +0200
Message-ID: <hr9nh4$alr$2@dough.gmane.org>
References: <hqpfou$igp$1@dough.gmane.org>	<1272296194-17980-1-git-send-email-ospite@studenti.unina.it>	<hr4f9u$48g$1@dough.gmane.org>
	<20100428181420.38065efb.ospite@studenti.unina.it>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
In-Reply-To: <20100428181420.38065efb.ospite@studenti.unina.it>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] image.bbclass: create /etc/device_table from IMAGE_DEVICE_TABLES
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
X-List-Received-Date: Wed, 28 Apr 2010 16:33:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Done, thanks for the patch!

On 28-04-10 18:14, Antonio Ospite wrote:
> On Mon, 26 Apr 2010 18:34:06 +0200
> Koen Kooi <k.kooi@student.utwente.nl> wrote:
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 26-04-10 17:36, Antonio Ospite wrote:
>>> Right now when the 'devices' script from initscripts is called the
>>> layout specified in IMAGE_DEVICES_TABLES is lost.
>>>
>>> With this change the default behaviour when no IMAGE_DEVICE_TABLES is
>>> specified is to always use files/device_table-minimal.txt
>>>
>>> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
>>
>> Acked-By: Koen Kooi <koen@openembedded.org>
> 
> Koen, would you push this if there are no objections?
> 
> Thanks,
>    Antonio
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL2GFjMkyGM64RGpERAjdBAJ9Y24F2iqPUNBTL96xErdnX8Y1T/QCdEE+8
EZ1fuzMzbZVU/OrMFvhvGRE=
=uXiV
-----END PGP SIGNATURE-----



