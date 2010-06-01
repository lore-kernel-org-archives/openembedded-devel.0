Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OJLIG-0000mD-9N for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 08:49:44 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OJLE0-0002dp-9Z for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 08:45:20 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 08:45:20 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 08:45:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 01 Jun 2010 08:45:11 +0200
Message-ID: <hu2a9n$bb5$1@dough.gmane.org>
References: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com>
	<AANLkTilCZJoRhGKzBokT9TuZwbh0mzyzsBQ2J3NsIpwJ@mail.gmail.com>
	<AANLkTinUqQ16GPijhEAJof0uwAfrokQroib56xX2IutT@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100512 Shredder/3.0.6pre
In-Reply-To: <AANLkTinUqQ16GPijhEAJof0uwAfrokQroib56xX2IutT@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gitver problems
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
X-List-Received-Date: Tue, 01 Jun 2010 06:49:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-06-10 00:21, Chris Larson wrote:
> On Mon, May 31, 2010 at 3:04 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> 
>> -vvvv provides a little more info ...
>>
>>
>> NOTE: Running task 729 of 733 (ID: 8,
>> /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
>> autotools-demo.bb,
>> do_package_stage)
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of
>> /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
>> autotools-demo.bb
>> do_package_stage failed
>> NOTE: package autotools-demo-1.0-2-ga58ca94-r0: task do_package_stage:
>> Started
>> ERROR: Task 8
>> (/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
>> autotools-demo.bb,
>> do_package_stage) failed with 256
>> ERROR: '/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
>> autotools-demo.bb'
>> failed
>> ERROR: Function staging_packager failed
>> NOTE: Task failed: ('function staging_packager failed',
>>
>> '/scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-2-ga58ca94-r0/temp/log.staging_packager.26542')
>> ERROR: Logfile of failure stored in:
>>
>> /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-2-ga58ca94-r0/temp/log.staging_packager.26542
>> Log data follows:
>> | *** Error: CONTROL/control is missing field Source
>> | The Source field contain the URL's or filenames of the source code
>> and any patches
>> | used to build this package.  Either gnu-style tarballs or Debian
>> source packages
>> | are acceptable.  Relative filenames may be used if they are
>> distributed in the same
>> | directory as the .ipk file.
>> |
>> | ipkg-build: Please fix the above errors and try again.
>> | ERROR: Function staging_packager failed
>> NOTE: package autotools-demo-1.0-2-ga58ca94-r0: task do_package_stage:
>> Failed
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of
>> /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
>> autotools-demo.bb
>> do_package_stage failed
>> ERROR: Task 8
>> (/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
>> autotools-demo.bb,
>> do_package_stage) failed with 256
>> ERROR: '/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
>> autotools-demo.bb'
>> failed
>> ERROR: '/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
>> autotools-demo.bb'
>> failed
>>
>> So we need a way to provide Source URL's for packaging ...
> 
> 
> Last time I looked at that part of the packaging classes and SRC_URI, they
> fell back to ${FILE} if SRC_URI was unset, which while not particularly
> useful, seems a reasonable way to do it.

If it's unset yet, not if it's empty. Doing SRC_URI = "" will trigger
such bugs.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMBKx3MkyGM64RGpERAjWLAKCsM0RCKkRWy1ONqsbaKrqqRFgbqgCcCDt8
OXAWpfhG1YeKsi7S5fyQwtg=
=2zoW
-----END PGP SIGNATURE-----



