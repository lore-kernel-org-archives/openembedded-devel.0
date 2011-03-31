Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q5Ms6-0001Rt-Nt
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 20:45:30 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q5MqB-0003DH-V9 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 11:43:31 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 31 Mar 2011 11:41:53 -0700
Received: from [172.30.80.77] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 31 Mar 2011 11:43:30 -0700
Message-ID: <4D94CB49.60008@mentor.com>
Date: Thu, 31 Mar 2011 11:43:21 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <in21a8$jod$1@dough.gmane.org> <4D94AF48.1090500@mentor.com>
	<in2gmn$ucl$1@dough.gmane.org>
In-Reply-To: <in2gmn$ucl$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 31 Mar 2011 18:41:53.0474 (UTC)
	FILETIME=[4DED8220:01CBEFD3]
Subject: Re: [2011.03-maintenance] Pull request #9
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
X-List-Received-Date: Thu, 31 Mar 2011 18:45:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/31/2011 11:21 AM, Koen Kooi wrote:
> On 31-03-11 18:43, Tom Rini wrote:
>> On 03/31/2011 06:58 AM, Koen Kooi wrote:
>>> Tom,
> 
>>> Please pull the 5 commits from here:
> 
>>> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
>>> Branch: 2011.03-maintenance
> 
>>> Philip Balister (3):
>>>       autoconf: Fix paths for scripts installed on the target.
>>>       automake: Fix paths in scripts installed on target.
>>>       qmake2: Define env var for strip. Convert to use INC_PR.
> 
>>> Tom Rini (2):
>>>       In a large number of patches, remove unneeded '..' in paths.
>>>       tcl: Rework mips-tclstrtod.patch
> 
>>> You can view the branch online at
>>> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance
> 
>>> The ones from Philip fix the native toolchain and you know what your
>>> patches do :)
> 
>> Actually, I want to NAK my own patches here.  After pushing here (and
>> Mark Hatle pushing to oe-core) I ran into patchdir param which lets us
>> not have to do patches in do_configure (which is really kinda wrong).
>> Unfortunately I haven't had time yet to re-do my patches, but I'll try
>> and get to that today.
> 
> Can you pull in the 3 from Philip or do you want me to send a new request?

New request please (and I got the rework of my own bits done).

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNlMtJAAoJEI4NMjfc3nJxh18H/RaWfPtDJjbiAZbxMtE14HKl
Fg4FUWr/I7pnts+u4wFdlTexDLKcWhENjLXcP6Vl5l0yCHXtrTqOuBJo7MS2B4+b
b5D78k1VozOtBhtj+GBFcjXuCwnioKvkAlnad57alDCVsxcXzXzTNGY5ztzFx3LN
/IGlVDe/kOzxuc830tNZ67q2AsNcLK+UPeZPcS2et8ncbcG5mrTGsj+NcZso5SO6
WsBsc+xH7TyTZLfmUuTlAUhQ48YnwbvGknWxv7U2dt03zDzxuo3Rt5BETpjbtTCQ
YP/HsHlTamIgGE56R6irZos95b5Ez86iZ+t/bWSSx9gvkL38yFiEBgFMo0Sv750=
=lbWP
-----END PGP SIGNATURE-----


