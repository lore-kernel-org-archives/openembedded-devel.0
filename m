Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OLEjN-0004vh-0H for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 14:13:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OLEfA-0003du-RD for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 14:09:12 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 14:09:12 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 14:09:12 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 06 Jun 2010 14:09:02 +0200
Message-ID: <hug34u$hnh$1@dough.gmane.org>
References: <4C0992ED.6000102@gmail.com> <hue0a5$8e9$1@dough.gmane.org>
	<4C0ABE75.8000004@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100512 Shredder/3.0.6pre
In-Reply-To: <4C0ABE75.8000004@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4 upgrade to 4.7.0-beta1
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
X-List-Received-Date: Sun, 06 Jun 2010 12:13:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-06-10 23:15, Matthias Günther wrote:
> On 05.06.2010 19:08, Koen Kooi wrote:
>> On 05-06-10 01:57, Matthias Günther wrote:
>>> Hello.
>>
>>> I've been working with QML (Qt Quick) for some time now and therefore
>>> I've created recipes for Qt 4.7.0-tp and beta1 versions. The patches
>>> just disable the not cross compiling parts (e.g. some demos/examples).
>>
>> At work I need demos/browser to show off some html stuff, do you have an
>> idea what the effort would be to get it to build again for qt 4.7?
> 
> I'm not sure. To make it easy I just disabled the not important parts
> where compiling errors occured. But I will have a look into it.

Thanks, I think it's safe to add the recipes as they are and work on
these things after they are added.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMC4/dMkyGM64RGpERAvjuAJ97cgPjRbOp2ltmjCONAerBr74pQACggvfT
hbnEY6Qi5hWspsY82U8wW1I=
=Fa23
-----END PGP SIGNATURE-----



