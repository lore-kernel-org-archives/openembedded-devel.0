Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PeopT-000757-NS for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 14:09:04 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Peoou-0002AY-56 for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 14:08:28 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 14:08:28 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 14:08:28 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 17 Jan 2011 14:08:16 +0100
Message-ID: <ih1f00$lhs$1@dough.gmane.org>
References: <1295220721.13967.13.camel@mattotaupa>	<ih0tpc$ra$2@dough.gmane.org>
	<1295264891.4844.57.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1295264891.4844.57.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/3] libomxil-bellagio: cosmetics: unify recipes
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
X-List-Received-Date: Mon, 17 Jan 2011 13:09:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-01-11 12:48, Paul Menzel wrote:
> Am Montag, den 17.01.2011, 09:14 +0100 schrieb Koen Kooi:
>> On 17-01-11 00:32, Paul Menzel wrote:
>>> Date: Sun, 16 Jan 2011 23:34:08 +0100
>>>
>>> Just reorder the lines to be consistent throughout all recipes and to adhere to the style guide [1].
>>>
>>> [1] http://wiki.openembedded.org/index.php/Styleguide
>>>
>>> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
>>> ---
>>>  recipes/openmax/libomxil-bellagio_0.9.0.bb |    6 ++----
>>>  recipes/openmax/libomxil-bellagio_0.9.1.bb |   10 ++++------
>>
>>
>> FWIW, the above two aren't used and can get deleted, I suspect they
>> don't even build against our recent ffmpeg
> 
> Is it alright to send a f
ollow-up patch after this patch series has been
> committed?

surr

> 
>>>  recipes/openmax/libomxil-bellagio_0.9.2.bb |   10 ++++------
> 
> Just for my interest, what is the reason to use 0.9.2 instead of
> 0.9.2.1?

none, I just misread :) 0.9.2 can go as well.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNND8/MkyGM64RGpERApd6AJ9DR9W5xf8JmOFojgIRHoMijdZNCgCcDRRa
9NuIBOL4QaBwqn3jhGQV5xM=
=AXCH
-----END PGP SIGNATURE-----



