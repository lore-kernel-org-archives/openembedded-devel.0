Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H0xH5-0007X1-Bs
	for openembedded-devel@openembedded.org; Sun, 31 Dec 2006 10:46:39 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBV9jiLr014825 for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Dec 2006 10:45:44 +0100
Message-ID: <459786C7.70000@dominion.kabel.utwente.nl>
Date: Sun, 31 Dec 2006 10:45:43 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20061230051641.GA30225@hezmatt.org>	<1167506369.5626.46.camel@localhost.localdomain>	<20061230214326.GE15188@hezmatt.org>	<4596E33D.306@dominion.kabel.utwente.nl>	<20061230235938.GC16490@hezmatt.org>
	<1167523571.5626.59.camel@localhost.localdomain>
In-Reply-To: <1167523571.5626.59.camel@localhost.localdomain>
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
X-List-Received-Date: Sun, 31 Dec 2006 09:46:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Sun, 2006-12-31 at 10:59 +1100, Matthew Palmer wrote:
>> Note also that Richard said that I shouldn't be doing *any* commits locally
>> -- no mention of branching or any other way to take advantage of the
>> benefits of a DRCS.  (Not having a go at you, Richard, just explaining my
>> thought processes.)
> 
> This is simply because we have no established way of receiving data
> through the SCM for merging into trunk without direct write access. As
> my other email says, I'd like to find a way of supporting that but its
> probably an education issue on both sides.

And the fact that we usually have to tweak 80% if the patches we receive. Attaching them
to the bugtracker makes it easy to search for, view and comment on patches, and most
importantly, view their status.
It doesn't matter which SCM we use with that workflow.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFl4bHMkyGM64RGpERAqP/AJ4p9m4FAbXgtVOiACLMQEKScGYqmwCgqC/4
9Oee1LelN+CNy3/fWLqDRn8=
=fv68
-----END PGP SIGNATURE-----


