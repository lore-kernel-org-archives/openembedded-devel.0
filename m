Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JgMcK-0005tU-Sx
	for openembedded-devel@openembedded.org; Mon, 31 Mar 2008 18:12:16 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JgMcJ-0000xV-L3
	for openembedded-devel@openembedded.org; Mon, 31 Mar 2008 16:12:15 +0000
Received: from vestingbar.student.utwente.nl ([130.89.119.192])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 31 Mar 2008 16:12:15 +0000
Received: from koen by vestingbar.student.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 31 Mar 2008 16:12:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Mon, 31 Mar 2008 18:12:03 +0200
Message-ID: <fsr2gk$t6o$1@ger.gmane.org>
References: <200803310907.56781.e.robertson.svg@gmail.com>
	<c384c5ea0803310844l1e91faa0m86a699174afeabf7@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: vestingbar.student.utwente.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <c384c5ea0803310844l1e91faa0m86a699174afeabf7@mail.gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: Re: New OE user question
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Mar 2008 16:12:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
| On Mon, Mar 31, 2008 at 4:07 PM, E Robertson
<e.robertson.svg@gmail.com> wrote:
|> Hi All,
|>
|>  I'm brand new to OE and I've been following the documentation steps
along the
|>  way. I notice the documentation is either missing sections or not
clear and
|
| Good catch, our default example seems to be unmaintained.  Probably
| the "generic" distribution lacks good maintenance, at least for this
| configuration.
|
| DISTRO         = "generic-uclibc"
|
| The error which stops your build is:
|
|>  | Unable to determine version for kernel headers
|>  |       provided in
|
| Can someone suggest a saner distribution for this Samsung chip?
angstrom maybe?

It's an atmel chip, and atmel itself recommends angstrom:
http://www.linux4sam.org/twiki/bin/view/Linux4SAM/OpenEmbeddedAngstrom

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH8Q1TMkyGM64RGpERAtBvAJ0X+wxP9orzhur/qpq0eYVM0RhZOQCcDAqq
pyFWBMzD3HqLnXzt3/ZU17A=
=QAC4
-----END PGP SIGNATURE-----



