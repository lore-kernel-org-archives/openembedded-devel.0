Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T6lhk-0002Lt-Df for openembedded-devel@lists.openembedded.org;
	Wed, 29 Aug 2012 19:05:24 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T6lVx-0001Pw-MY for openembedded-devel@lists.openembedded.org;
	Wed, 29 Aug 2012 18:53:13 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 18:53:13 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 18:53:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 29 Aug 2012 18:53:04 +0200
Message-ID: <k1lhde$fdj$1@ger.gmane.org>
References: <1346247150-17236-1-git-send-email-ross.burton@intel.com>
	<3DA568F2-7691-4344-904C-7DB6FFBF90B9@gmail.com>
	<CAJTo0LYGOrwT1BwB8gDmGwMr67v8Mhtci8MK_QdHm9AW7EeDFA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <CAJTo0LYGOrwT1BwB8gDmGwMr67v8Mhtci8MK_QdHm9AW7EeDFA@mail.gmail.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [PATCH] pimlico: remove Poky overrides
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
X-List-Received-Date: Wed, 29 Aug 2012 17:05:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 29-08-12 17:31, Burton, Ross schreef:
> On 29 August 2012 15:17, Khem Raj <raj.khem@gmail.com> wrote:
>> A bit explanation as to why it's done will be nice. Why comment out
>> instead delete Is this window menu patch needed somewhere else If not
>> it must go as well
> 
> Thinking about it, I'd like to retract this patch and leave the Poky 
> distro overrides in that file.  If someone wants dates/contacts/tasks on
> Poky then they'll get the extra integration, and it serves as an 
> example/reminder of the functionality it brings (makes the menu bar a 
> dropdown from the window title).

Either take the distro stuff out or take the recipes out. Meta-openembedded
is supposed to be a shining example of layer correctness.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQPkjwMkyGM64RGpERAsu9AJ92ZNXlSRYyHdWkXRbOdr/STaFdawCgo6+T
7n5Du6jUwDYmd0JvJs9o+7s=
=losa
-----END PGP SIGNATURE-----



