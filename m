Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PyBjL-0004lM-M4 for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 00:26:48 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PyBhh-0003X7-LD for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 00:25:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 00:25:05 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 00:25:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 12 Mar 2011 00:23:18 +0100
Message-ID: <ileat6$gdk$2@dough.gmane.org>
References: <1299879658-10136-1-git-send-email-eric@eukrea.com>	<1299879658-10136-3-git-send-email-eric@eukrea.com>	<4D7AA712.8080003@mentor.com>
	<4D7AAB85.8020102@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D7AAB85.8020102@eukrea.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 3/3] qt4: remove 4.7.1
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
X-List-Received-Date: Fri, 11 Mar 2011 23:26:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-03-11 00:08, Eric Bénard wrote:
> On 11/03/2011 23:49, Tom Rini wrote:
>> On 03/11/2011 02:40 PM, Eric Bénard wrote:
>>> now that 4.7.2 is prefered for shr& minimal
>>>
>>
>> Have the X11 images been tested to some degree now?
>>
> as angstrom-2010 and kaeilos have switched to qt 4.7.2 I assume that's
> the case.

Really?
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/conf/distro/include/angstrom-2010-preferred-versions.inc
shows 4.7.1 still.

I will accept patches to change that to 4.7.2, though :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNeq7mMkyGM64RGpERAjGHAJwK5Esabps2EO2Dah+a1JSXr4LrLQCfegHm
Xu8qcIaeL2WxGSOJ27i6Lhw=
=Qe7x
-----END PGP SIGNATURE-----



