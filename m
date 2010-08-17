Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OlHy3-0004B4-8j for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 10:56:25 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OlHxl-00073L-Ul for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 10:56:05 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 10:56:05 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 10:56:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 17 Aug 2010 10:55:56 +0200
Message-ID: <i4diqt$e6k$1@dough.gmane.org>
References: <AANLkTi=XK3Le8ERWqmMt2DEVX3K4n=ua0Zdyu6qEOUcw@mail.gmail.com>
	<47A90E34-ABBD-4D37-9F47-B1EF6BEFE198@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <47A90E34-ABBD-4D37-9F47-B1EF6BEFE198@vanille-media.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: rename files dirs
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
X-List-Received-Date: Tue, 17 Aug 2010 08:56:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-08-10 10:39, Dr. Michael Lauer wrote:
>> Currently lots of our patches reside in a directory called files.
>> Somewhere in the past koen explained me that that is not really proper
>> (and I agree with them).
> 
> I disagree with that. In fact I'd rather suggest the other way, which
> is: Put them all into files/ unless you have a compelling reason not to,
> i.e. the moment one patch does not apply any longer to all versions of
> the recipes; then it should be moved to PN-PV directory.

What's wrong with putting those patches in PN/ instead of files/? Having
them in files/ significantly threatens all efforts to clean up the
recipes/ structure :(
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMak6cMkyGM64RGpERAi7ZAKC3znJEhz9R+E+ogbSIk+CFNhscJwCeNzU5
bj8CdsrE7eEOUc9QyPoJ2JE=
=R/wu
-----END PGP SIGNATURE-----



