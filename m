Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NcarY-0000Ge-T9 for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 09:45:31 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NcapC-0005cz-Uc for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 09:43:02 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 09:43:02 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 09:43:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 03 Feb 2010 09:42:43 +0100
Message-ID: <hkbcu2$h8r$1@ger.gmane.org>
References: <1265103507.19185.8.camel@balakrishnan-desktop>	<201002021059.52148.holger+oe@freyther.de>
	<1265148573.29062.10.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100114 Shredder/3.0.2pre
In-Reply-To: <1265148573.29062.10.camel@mattotaupa>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] regulus: Adding pxa270 based machine
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
X-List-Received-Date: Wed, 03 Feb 2010 08:45:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-02-10 23:09, Paul Menzel wrote:
> Am Dienstag, den 02.02.2010, 10:59 +0100 schrieb Holger Hans Peter
> Freyther:
>> On Tuesday 02 February 2010 10:38:27 balakrishnan wrote:
>>> Dear OE,
>>>        I have mailed four patches to OE dev list on last month regarding
>>> "pxa270 based machine" inclusion in OE(stable/2009). Can I have status
>>> of my patches?
> 
> […]
> 
>> The other weird part is that I have not seen your patches on patchwork.
> 
> That is indeed strange. I did also not find them.
> 
>         $ ./pwclient search -w balakris
>         Patches submitted by bala krishnan
>         <balakrishnan@e-consystems.com>:
>         ID    State        Name
>         --    -----        ----
> 
> I there a log file for Patchwork with error messages, why a message was
> not parsed?

When debugging that a bit earlier it turned out that gmail (which we use
as the dummy patchwork subscriber) was tagging things as spam. I didn't
look into a solution since this rarely happens.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLaTcDMkyGM64RGpERAqMJAJ0REmE/TR7Xh4awqUrDeUQSEfPaPwCeJPPJ
KrLqxWK1/s4+HqjIuIt9/qs=
=Kwkh
-----END PGP SIGNATURE-----



