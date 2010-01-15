Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NVjxI-0001ZU-Rx for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 12:03:07 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NVjvA-0003DW-IV
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 12:00:52 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 12:00:52 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 12:00:52 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 15 Jan 2010 12:00:31 +0100
Message-ID: <hiphse$ulj$1@ger.gmane.org>
References: <>
	<1263455739-13595-1-git-send-email-camelguo@gmail.com>	<201001141014.53764.marcin@juszkiewicz.com.pl>	<op.u6imubdtmn1qzu@guohr-laptop-ubuntu>	<20100114195301.GA3529@gmail.com>	<op.u6jv0uycmn1qzu@guohr-laptop-ubuntu>
	<4B4FE54D.3070402@mwester.net>	<op.u6kherjdmn1qzu@guohr-laptop-ubuntu>	<1263549399.457.313.camel@lenovo.internal.reciva.com>
	<op.u6klcvzcmn1qzu@guohr-laptop-ubuntu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <op.u6klcvzcmn1qzu@guohr-laptop-ubuntu>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Support building all project in one directory
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
X-List-Received-Date: Fri, 15 Jan 2010 11:03:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-01-10 11:42, Guo Hongruan wrote:
> 在 Fri, 15 Jan 2010 17:56:39 +0800，Phil Blundell <philb@gnu.org> 写道:
> 
>> For the majority of DISTROs, there is only a single supported C library
>> anyway so there should be no ambiguity.  For example, if you build for
>> micro-uclibc, that means you are using uClibc.  If you build for micro,
>> that means you are using eglibc.
> 
> OE should provide a mechanism which should not restrict one certain libc
> type.
> 
> Even though every distro supports only one libc type

Angstrom supports glibc, uclibc and eglibc.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLUErPMkyGM64RGpERAt7EAKCx70to28K9IdhgjCmqyyL0N2ZIIQCfSJt8
ZcsK/7uJIjVbkKQWZTYjJCA=
=q9F7
-----END PGP SIGNATURE-----



