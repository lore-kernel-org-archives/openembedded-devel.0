Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <jonsmirl@gmail.com>) id 1IHPZg-0007Fs-9o
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2007 21:46:08 +0200
Received: by wa-out-1112.google.com with SMTP id l24so1492103waf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2007 12:43:52 -0700 (PDT)
Received: by 10.115.32.1 with SMTP id k1mr4147205waj.1186256632439;
	Sat, 04 Aug 2007 12:43:52 -0700 (PDT)
Received: by 10.114.195.11 with HTTP; Sat, 4 Aug 2007 12:43:52 -0700 (PDT)
Message-ID: <9e4733910708041243oa0cf091x60a8f9f279ad2ba7@mail.gmail.com>
Date: Sat, 4 Aug 2007 15:43:52 -0400
From: "Jon Smirl" <jonsmirl@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: check sum failure http://gpe.linuxtogo.org/download/source/minimix-0.8.tar.bz2'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Aug 2007 19:46:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

NOTE: package minimix-0.8: started
NOTE: package minimix-0.8-r0: task do_fetch: started
NOTE: fetch http://gpe.linuxtogo.org/download/source/minimix-0.8.tar.bz2
--15:41:15--  http://gpe.linuxtogo.org/download/source/minimix-0.8.tar.bz2
           => `/extra/oe/sources/minimix-0.8.tar.bz2'
Resolving gpe.linuxtogo.org... 85.214.40.226
Connecting to gpe.linuxtogo.org|85.214.40.226|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 68,451 (67K) [application/x-bzip2]

100%[===================================================================================>]
68,451       128.62K/s

15:41:16 (128.51 KB/s) - `/extra/oe/sources/minimix-0.8.tar.bz2' saved
[68451/68451]

NOTE: The MD5Sums did not match. Wanted:
'0cfb89bf2596710543935e31ad1d5a17' and Got:
'24ec8a3fb25fd0e497a0c64270b47d00'
NOTE: Task failed: Checksum of
'http://gpe.linuxtogo.org/download/source/minimix-0.8.tar.bz2' failed
NOTE: package minimix-0.8-r0: task do_fetch: failed
ERROR: TaskFailed event exception, aborting
NOTE: package minimix-0.8: failed
ERROR: Build of
/extra/oe/org.openembedded.dev/packages/minimix/minimix_0.8.bb
do_fetch failed
ERROR: Task 272
(/extra/oe/org.openembedded.dev/packages/minimix/minimix_0.8.bb,
do_fetch) failed
NOTE: Tasks Summary: Attempted 2473 tasks of which 2473 didn't need to
be rerun and 1 failed.
ERROR: '/extra/oe/org.openembedded.dev/packages/minimix/minimix_0.8.bb' failed


-- 
Jon Smirl
jonsmirl@gmail.com


