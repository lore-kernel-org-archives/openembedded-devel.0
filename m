Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OnSjc-0001oa-Ae for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 10:50:40 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OnSjD-0006sW-MO for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 10:50:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 10:50:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 10:50:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 23 Aug 2010 10:45:52 +0200
Message-ID: <i4tcg0$qie$3@dough.gmane.org>
References: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>	<AANLkTinytMQ0=hav0GiqPV0S-Avo16-DDFDcEd6QWYhg@mail.gmail.com>	<AANLkTinvou+tVwQ683OqsTrRvHJV8HdBfTJOuPiBoK5q@mail.gmail.com>
	<20100820000226.GD26112@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <20100820000226.GD26112@denix.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE stable, testing, dev (was Re: What to do about the poor bitbake Quality Control?)
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
X-List-Received-Date: Mon, 23 Aug 2010 08:50:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-08-10 02:02, Denys Dmytriyenko wrote:
> On Wed, Aug 18, 2010 at 07:05:48PM +0200, Frans Meulenbroeks wrote:
>> 2010/8/18 Jason Kridner <jkridner@beagleboard.org>:
>>> On Wed, Aug 18, 2010 at 11:07 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
>>
>>>>
>>>> Getting started
>>>> (http://wiki.openembedded.net/index.php/Getting_started) points to a
>>>> tarball for bitbake 1.8.18.  Is this still the recommended
>>>> version/mechanism for new users?  I much prefer simply pulling bitbake
>>>> from git.
>>>
>>> Koen pointed me to
>>> http://gitorious.org/angstrom/angstrom-setup-scripts/blobs/master/oebb.sh
>>> for setting up my environment.  I also prefer pulling bitbake from
>>> git.  Koen seems to be pulling bitbake 1.10, instead of 1.8.18.
>>>
>> 1.10 is now officially released and is supposed to be better and faster.
>> I think we should change the wiki page to reflect using 1.10
> 
> 1.10 is Python 2.6 based (AFAIK)

works fine with 2.5 over here (8.04LTS)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMcjU/MkyGM64RGpERAhSbAJwLAY/K429qH8Rq9OuPoFxJWxRVbgCfVwby
iLU4YAHHZHzYX3r00sSmNMg=
=RqVd
-----END PGP SIGNATURE-----



