Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pn79B-0003Yk-Ja for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 11:19:41 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pn789-0006is-DW for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 11:18:37 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 11:18:37 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 11:18:37 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 09 Feb 2011 11:18:19 +0100
Message-ID: <iitplc$ago$1@dough.gmane.org>
References: <4D519C83.9060502@mentor.com>	<09D9BE2AC4AA764DABAA8C91E48D819E011A79A329@DEMCHP99E35MSX.ww902.siemens.net>
	<20110209095644.GE28019@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110209095644.GE28019@excalibur.local>
X-Enigmail-Version: 1.0.1
Subject: Re: 2011.03 release testing, starts soon!
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
X-List-Received-Date: Wed, 09 Feb 2011 10:19:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-02-11 10:56, Stefan Schmidt wrote:

>> 2. Do not delete the release branch after 2011.03 will be released (just like
>>    it was done for 2010.12), but let it live and allow developpers committing
>>    bug-fixes (backporting choosen things?) reported back by OE users (some would
>>    would be happy to contribute this way)
> 
> That was already discussed. We make a tag with the release rev from which can be
> branched again _if_ people are stepping up to support this branch on a mid or
> long term base.
> 
> The branch Tom is using until the release is pretty useless froma history point
> of view (all changes must be in master as well). When he thinks the release is
> good enough the tag gets added and the old branch deleted. For the last release
> nobody cared to support it afterwards with bugfixes so no release branch was
> created.
> 
> I'm thinking about this for the upcoming release. If all works well we will base
> a product on it which I would like to support directly from such a release
> branch.
> 
> The hard part is how people could decide on pooling resources on this. Defining
> goals for such a branch and stuff. E.g. only take serious fixes? What about
> package updates? Security fixes? changes on the toolchain or classes?
> 
> This is up to the group who wants to support such a branch. Anyone else
> interested in doing this for 2011-03?

I discussed this with Philip and Graeme and the idea is to retire
angstrom-2008.1.conf into that branch. I still have customers (you
indirectly :)) using that, so having it in that branch would be very neat.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNUmnrMkyGM64RGpERAuT/AJ9mytn+0MD+p0r5wIHO9ZGZ+faHWwCfaok8
s2oPs47xZ2Ud4um/cqA8G4U=
=JpX4
-----END PGP SIGNATURE-----



