Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H9oL5-00005Z-6m
	for openembedded-devel@openembedded.org; Wed, 24 Jan 2007 21:03:23 +0100
Received: from [130.89.7.69] (vpn007069.vpn.utwente.nl [130.89.7.69])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l0OK3Dox016583 for <openembedded-devel@openembedded.org>;
	Wed, 24 Jan 2007 21:03:16 +0100
Message-ID: <45B7BB78.2000700@dominion.kabel.utwente.nl>
Date: Wed, 24 Jan 2007 21:03:04 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1H9l3p-0002C8-ES@linuxtogo.org>	<20070124190305.GA4747@stygia.hyboria>
	<45B7B614.2070504@dominion.kabel.utwente.nl>
In-Reply-To: <45B7B614.2070504@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev pulse-audio: inherit pkgconfig and stage headers
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
X-List-Received-Date: Wed, 24 Jan 2007 20:03:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Graeme Gregory schreef:
>> On Wed, Jan 24, 2007 at 05:33:21PM +0100, koen commit wrote:
>>> pulse-audio: inherit pkgconfig and stage headers
>>>
>> Because your not online, but pulseaudio just doesnt seem able
>> to supply esd.h or esound.pc which is required for esound apps.
> 
> ah, bummer :(

Thinking about it some more: Apps build against esound(-gpe), and OE installs pulseaudio
as the soundserver. That should solve most problems related with esound.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFt7t3MkyGM64RGpERAtnsAJ9vIEw3O+S6Syo5hjiaUXQmC66afgCgqf7q
qoOliCsTZYzApNayfdvFPxU=
=3USP
-----END PGP SIGNATURE-----


