Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OJiqm-0002dz-Pp for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 09:58:57 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OJimh-0003pJ-Vj for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 09:54:44 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 09:54:43 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 09:54:43 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 02 Jun 2010 09:54:34 +0200
Message-ID: <hu52nq$q5$1@dough.gmane.org>
References: <20100601195258.GF5446@jama>	<1275428876-1406-2-git-send-email-Martin.Jansa@gmail.com>	<AANLkTikc5u5SS7Nxlwc0RuaXrVlYl6-JMyC9Jto0S7gm@mail.gmail.com>
	<20100602053606.GH5446@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100512 Shredder/3.0.6pre
In-Reply-To: <20100602053606.GH5446@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] klibc: fix packaging without moving PACKAGES and FILES_ back to recipes
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
X-List-Received-Date: Wed, 02 Jun 2010 07:58:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-06-10 07:36, Martin Jansa wrote:
> On Wed, Jun 02, 2010 at 12:59:45AM +0200, Andrea Adami wrote:
>> Martin,
>>
>> building klibc_1.5 we have the same
>> NOTE: Not creating empty archive for (dmesg,sync,ls)
>>
>> and building 1.5.18
>> NOTE: Not creating empty archive for klibc-utils-insmod-1.5.18-r14.1.5
>>
>> If you prefer to warn the user that it's version lacks those packages, ok.
>> At first  I saw them as packaging quirks in this case.
>> Again, no strong opinion :)
> 
> Then it's 1:1 :), someone else with some opinion?
> 
> My point is that I see "Not creating empty archive" as harmless warning
> about me using version not providing some files which some other version
> does and this message I see quite often during builds..

I agree with Martin on the empty archive stuff.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMBg46MkyGM64RGpERAmRkAJ91di7/Ldejnf+ZnfYNFHI+0jnnLACgiXbL
sBCVkM8bXOvkvuJ9VYFXjNI=
=lBzP
-----END PGP SIGNATURE-----



