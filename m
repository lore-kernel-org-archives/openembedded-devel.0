Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id C48DC6A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 08:48:46 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1XZyXe-0000Bq-4w for openembedded-devel@lists.openembedded.org;
	Fri, 03 Oct 2014 10:48:46 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Oct 2014 10:48:46 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Oct 2014 10:48:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 03 Oct 2014 10:48:36 +0200
Message-ID: <m0lnt4$s5f$1@ger.gmane.org>
References: <CADHREMC7m2Pwdhvq3tytSiwahaPF=Vf_q5dNio27PAw-meGFTQ@mail.gmail.com>
	<CALbNGRS1JF1NwQq=JKUKDJhA5H49Ga-EYC-zwFZSNC4ABdY-Ww@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <CALbNGRS1JF1NwQq=JKUKDJhA5H49Ga-EYC-zwFZSNC4ABdY-Ww@mail.gmail.com>
Subject: Re: gphoto2 & libgphoto2 for the Intel Edison
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Oct 2014 08:48:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andreas Müller schreef op 02-10-14 09:25:
> On Wed, Oct 1, 2014 at 11:27 PM, James Bober <tartarus37@gmail.com>
> wrote:
>> Dear Sir, I am attempting to incorporate gphoto2 and libgphoto2 on my
>> newly-acquired Intel Edison. I discovered an appropriate package for
>> libgphoto2 here:
>> 
>> https://github.com/openembedded/meta-oe/tree/master/meta-oe/recipes-graphics/gphoto2
>>
>>
>> 
but nothing for the command line client, gphoto2.
>> 
>> I am rather new at working with the Edison, so any help and insights
>> would be much appreciated.

'gphoto' should be in the libgphoto2-bin or libgphoto2-utils package

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFULmLkMkyGM64RGpERAsRrAJ9iWkk3889lr1nruZWT9MS5OkqMSQCgrFto
8rDCqQXLpo3VbmvYdisXb98=
=OrDi
-----END PGP SIGNATURE-----


