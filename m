Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oe0rJ-00011s-L7 for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 09:15:22 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oe0r2-00055y-Cq for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 09:15:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 09:15:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 09:15:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 28 Jul 2010 09:10:28 +0200
Message-ID: <i2ol54$6j7$4@dough.gmane.org>
References: <AANLkTik+1EuG8Se996jFqVfQBXc3fFqoYPGzHh4hRsV2@mail.gmail.com>
	<1280222125.3763.6.camel@mattotaupa>	<alpine.DEB.2.00.1007270523480.16599@lynx>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA5018B57B5@deimsg40.de.net.world>
	<AANLkTino5uOku+4BeMp+3T3-X086eUhgtGXXQfX1xOwi@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <AANLkTino5uOku+4BeMp+3T3-X086eUhgtGXXQfX1xOwi@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake error on ncurses_5.4.bb C compiler cannot create executables
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
X-List-Received-Date: Wed, 28 Jul 2010 07:15:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-07-10 05:05, ranjith kannikara wrote:
> hi,
> Thanks for all the responses.
> I am using
>    bitbake 1.8.18
>    openembedded latest git pull form dev
>    os-ubuntu 10.04
> 
> I got the problem cleared by just commenting the line which has the flag
> "-fforward- ***" in the file ncurses5.4.inc <http://ncurses5.4.bb/>

I don't think you have the latest OE:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=181244a3a629b6dacd5f221f9e9380ba9a078bb0
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMT9fkMkyGM64RGpERAqd0AJ45CfYh85FO1oeSlRruRaF7GVThDwCdF4ff
d3Y5ncOBSV3zNk1yundacQQ=
=iz37
-----END PGP SIGNATURE-----



