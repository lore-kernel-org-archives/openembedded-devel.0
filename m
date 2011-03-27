Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q3koh-0005Yv-Pa for openembedded-devel@lists.openembedded.org;
	Sun, 27 Mar 2011 09:55:19 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q3kmp-0005y9-01 for openembedded-devel@lists.openembedded.org;
	Sun, 27 Mar 2011 09:53:23 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Mar 2011 09:53:22 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Mar 2011 09:53:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 27 Mar 2011 09:53:07 +0200
Message-ID: <immqd3$7ic$1@dough.gmane.org>
References: <1301029351-32736-1-git-send-email-heroor@gmail.com>
	<AANLkTikovOEEzW4Ecrc81DEetcTJKY5duQ_gtQnhi+QS@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <AANLkTikovOEEzW4Ecrc81DEetcTJKY5duQ_gtQnhi+QS@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] TI XDCTools: Add version 3.20.08.88
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
X-List-Received-Date: Sun, 27 Mar 2011 07:55:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 27-03-11 07:34, Siddharth Heroor wrote:
> On Fri, Mar 25, 2011 at 10:32 AM, Siddharth Heroor <heroor@gmail.com> wrote:
>> From: Siddharth Heroor <heroor@ti.com>
>>
>>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> ---
>>  recipes/ti/ti-xdctools_3.20.08.88.bb |    6 ++++++
>>  1 files changed, 6 insertions(+), 0 deletions(-)
>>  create mode 100644 recipes/ti/ti-xdctools_3.20.08.88.bb
>>
>> diff --git a/recipes/ti/ti-xdctools_3.20.08.88.bb b/recipes/ti/ti-xdctools_3.20.08.88.bb
>> new file mode 100644
>> index 0000000..bf0cdcd
>> --- /dev/null
>> +++ b/recipes/ti/ti-xdctools_3.20.08.88.bb
>> @@ -0,0 +1,6 @@
>> +require ti-xdctools.inc
>> +
>> +PV = "3_20_08_88"
>> +
>> +SRC_URI[xdcbin.md5sum] = "068447e935adb54f0cacf0e294a281f9"
>> +SRC_URI[xdcbin.sha256sum] = "a4616fae3cc2a9f46b5b4377bb57af7f7932297cda210a6cbcc5f942256db196"
>> --

> Please consider this patch for inclusion in the 2011.03 maintenance branch.

It's already in the pull request:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/031389.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNjuzjMkyGM64RGpERAmDdAJ9TYLLJ+Yd6rAM0DpEOa96l4YurUwCbBmpw
ixNUv9v9tHe9XWRnp86TZfo=
=kREa
-----END PGP SIGNATURE-----



