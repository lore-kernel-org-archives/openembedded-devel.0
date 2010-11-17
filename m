Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PIfEA-0005tq-TD for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 11:27:03 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PIfD3-0003py-OD for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 11:25:49 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 11:25:49 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 11:25:49 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 17 Nov 2010 11:25:38 +0100
Message-ID: <ic0aj2$hqc$1@dough.gmane.org>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>	<ic06a8$uft$1@dough.gmane.org>
	<4CE3A6DE.2070203@xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <4CE3A6DE.2070203@xora.org.uk>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Wed, 17 Nov 2010 10:27:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-11-10 10:56, Graeme Gregory wrote:
> On 17/11/2010 09:12, Koen Kooi wrote:
>> On 16-11-10 19:20, Khem Raj wrote:
>>> Hello All,
>>
>>> In order to get to the 2010.12 release, I would like to request to
>>> stop pushing any changes to master until release. Please keep your
>>> changes in you local tree ready for when the window
>>> opens again after the release.
>>
>> At OEDEM we agreed that the release would pick a tested branch tag to
>> avoid such a draconic freeze.
>>
> I must say I am puzzled why the freeze when git supports branches. In
> the past we have just picked a point branched then cherry picked
> anything interesting that went into org.openemedded.dev until release date.

At OEDEM we decided that the release would be a tag, not branch of .dev.
To make this release easy and unobtrusive the release team would pick a
tag of the tested stuff that they thought is best. So the december
release might actually use a tag from september if that proves to be the
most "stable".

I would think our normal commit policy would cover "dangerous" commits
already, so I object to this draconion freeze proposal.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM462iMkyGM64RGpERAvkmAJ4glGYefhsTMST+UGbZFHI6pjS2qACgrS9g
AvU3Xy0Y1105HoW1/vLGU2I=
=EVng
-----END PGP SIGNATURE-----



