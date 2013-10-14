Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 448206BF59
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 08:08:36 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VVdCd-0005rk-AM for openembedded-devel@lists.openembedded.org;
	Mon, 14 Oct 2013 10:08:35 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 10:08:35 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 10:08:35 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 14 Oct 2013 10:08:27 +0200
Message-ID: <l3g8pe$7or$1@ger.gmane.org>
References: <1381683834-9439-1-git-send-email-koen@dominion.thruhere.net>
	<20131013184228.GA24278@mail.zedat.fu-berlin.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
In-Reply-To: <20131013184228.GA24278@mail.zedat.fu-berlin.de>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-oe][PATCH] python-pip: add 1.3.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Oct 2013 08:08:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-10-13 20:42, Henning Heinold schreef:
> On Sun, Oct 13, 2013 at 07:03:54PM +0200, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>  meta-oe/recipes-devtools/python/python-pip_1.3.1.bb | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
>>
>> diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
>> new file mode 100644
>> index 0000000..7ab3bd8
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
>> @@ -0,0 +1,14 @@
>> +DESCRIPTION = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Hi,
> 
> isn't pip
> 
> A tool for installing and managing Python packages.
> 
> instead of a webserver?

Yes, I copied python-tornado.bb to use as a template :)


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSW6Z7MkyGM64RGpERAthLAJ9kPj0mQx3vDOwUx93DfJNRe9QJZgCgnjGd
SlZZIPANNN/FsAROMkzzATk=
=PE/D
-----END PGP SIGNATURE-----


