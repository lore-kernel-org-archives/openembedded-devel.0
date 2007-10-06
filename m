Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ie9tl-0008Dv-8K
	for openembedded-devel@openembedded.org; Sat, 06 Oct 2007 15:41:07 +0200
Received: from vpn006069.vpn.utwente.nl (vpn006069.vpn.utwente.nl
	[130.89.6.69])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l968JhHh029058 for <openembedded-devel@lists.openembedded.org>;
	Sat, 6 Oct 2007 10:19:43 +0200
Message-ID: <4707451B.4040107@student.utwente.nl>
Date: Sat, 06 Oct 2007 10:19:39 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <1191494488.2516.34.camel@toontown>
	<4704CC05.40206@klever.net>	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>	<1191502502.2516.39.camel@toontown>	<EB5E2840-5F10-45F9-8B97-9FCFDC7F5AAE@selfish.org>	<D61182AC8012EA4EBC531B3AF23BE10947F630@tranzeo-mail2.12stewart.tranzeo.com>	<4704F01B.70104@klever.net>
	<4705D99D.6070209@miromico.ch>
	<f96d234e0710050657lbbf7391tb2437588f9c93d31@mail.gmail.com>
In-Reply-To: <f96d234e0710050657lbbf7391tb2437588f9c93d31@mail.gmail.com>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: oe for two target boards at the same time
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
X-List-Received-Date: Sat, 06 Oct 2007 13:42:00 -0000
X-List-Received-Date: Sat, 06 Oct 2007 13:42:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Cliff Brake schreef:
> On 10/5/07, Alex <mailinglist@miromico.ch> wrote:
>> Hi all
>>
>> How do I setup my directory structure to use oe for two target boards.
>>
>> I have an AVR32 board and an AT91 board and would like to use oe for
>> both of them with at less dublicated software as possible.
> 
> As these are different architectures, I don't think you can use
> multimachine. 

Multimachine works fine for things like that, except that we are *still* waiting for an OK
to merge the avr32 stuff into .dev

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHB0UbMkyGM64RGpERAgalAJ4j+ouRvC4msp8DZImB06lYyqvJtgCbBBEe
gVcJQX+e3nHCHBA2dQ0xfOY=
=qvpO
-----END PGP SIGNATURE-----


