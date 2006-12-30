Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H0mNl-0002Yx-8R
	for openembedded-devel@openembedded.org; Sat, 30 Dec 2006 23:08:49 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBUM7wox011674 for <openembedded-devel@openembedded.org>;
	Sat, 30 Dec 2006 23:07:58 +0100
Message-ID: <4596E33D.306@dominion.kabel.utwente.nl>
Date: Sat, 30 Dec 2006 23:07:57 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20061230051641.GA30225@hezmatt.org>	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
In-Reply-To: <20061230214326.GE15188@hezmatt.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: A question of workflow
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
X-List-Received-Date: Sat, 30 Dec 2006 22:08:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matthew Palmer schreef:
> On Sat, Dec 30, 2006 at 07:19:29PM +0000, Richard Purdie wrote:

>> It does mean you shouldn't be committing changes locally via monotone.
>> If you do this you will have to pull and then merge every time. That
>> isn't a problem in itself but if you do get direct commit access, we
>> will not be happy adding hundreds of extra merges to the main
>> repository.
> 
> WTF?  Why are you using a distributed revision control system, if I'm not
> supposed to be committing locally?  If everything I do is supposed to be
> bundled up into a patch and sent to the bugzilla, how am I meant to maintain
> my own tree of fixes while I wait for them all to be applied to dev?  Quilt? 
> That might make sense if I'm stuck interacting with SVN, but with a DRCS in
> the mix I expect *it* to be able to take on that role.

Do what virtually every DSCM does to support that: make a branch
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFluM9MkyGM64RGpERApWCAJ4vGC91DRHlu2CiBN+Zjl+u0YQx3gCgrdfF
kcLE9jQGwMRuafhSB8gUs3o=
=svf1
-----END PGP SIGNATURE-----


