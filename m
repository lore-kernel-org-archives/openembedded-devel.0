Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ni4I4-0001hw-HJ for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 12:11:31 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ni4FV-0003VF-RW for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 12:08:49 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 12:08:49 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 12:08:49 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 18 Feb 2010 12:08:28 +0100
Message-ID: <hlj73b$v9k$1@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>	<hk12nm$sdo$1@ger.gmane.org>
	<hlhc1p$t19$1@ger.gmane.org>	<ac9c93b11002171058o7f48b417yee87d06da09c7577@mail.gmail.com>	<hlhf2a$aei$1@ger.gmane.org>	<ac9c93b11002180118m1512bc71sa6eb91624e83263e@mail.gmail.com>	<hlj21d$fdf$1@ger.gmane.org>
	<ac9c93b11002180211p73d24d7dv4359a61dee5a6c4e@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100212 Shredder/3.0.2pre
In-Reply-To: <ac9c93b11002180211p73d24d7dv4359a61dee5a6c4e@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC] console-image.bb
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
X-List-Received-Date: Thu, 18 Feb 2010 11:11:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-02-10 11:11, Frans Meulenbroeks wrote:
> 2010/2/18 Koen Kooi <k.kooi@student.utwente.nl>:
> On 18-02-10 10:18, Frans Meulenbroeks wrote:
>>>> 2010/2/17 Koen Kooi <k.kooi@student.utwente.nl>:
>>>>
>>>>>>> FYI: I popped a question three weeks ago.
>>>>>>> Today Rolf asked me about the status in #oe.
>>>>>>> As you can see above 4 people (Rolf, Mickey, Phil and me were in
>>>>>>> favour of the proposal. In irc mckoan also backed the proposal.
>>>>>>> There was one person opposed to it: you.
>>>>>
>>>>> And funnily enough I'm the maintainer, so I get the final say.
>>>>
>>>> Still wondering what makes you the maintainer.
>>>>
>>>> git log does not mention any changes for this file by you (apart from
>>>> yesterdays revert):
>>>> See http://cgit.openembedded.org/cgit.cgi/openembedded/log/recipes/images/console-base-image.bb
> 
> Git doesn't track renames properly, using the parent of the
> packages->recipes commit:
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/log/packages/images/console-image.bb?id=fa6cd5a3b993f16c27de4ff82b42684516d433ba
> 
>> The parent is http://cgit.openembedded.org/cgit.cgi/openembedded/log/packages/images/console-base-image.bb
>> we're talking about console-base-image here.

No, we are not talking about console-base-image, read the subject of
this mail: "Re: [oe] {RFC] console-image.bb"

Try doing 'git log --follow recipes/images/console-image.bb' in your OE
checkout and see the ancestry of console-image for the past 3.5 years.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLfR+sMkyGM64RGpERAohgAKCd3wFWYQNGAUKQs3DNAGZuSpSqegCffcar
DIYf1a3TDpSf/Uh5KsEhrpc=
=uB87
-----END PGP SIGNATURE-----



