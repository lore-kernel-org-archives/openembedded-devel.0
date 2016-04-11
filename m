Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 38107 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Apr 2016 00:09:03 UTC
Received: from mx36-34.antispamcloud.com (mx36-34.antispamcloud.com
	[209.126.121.14])
	by mail.openembedded.org (Postfix) with ESMTP id D910565CBB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 00:09:03 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx36.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1apbyS-0007OX-HF; Mon, 11 Apr 2016 15:33:56 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 Apr 2016 15:33:48 +0200
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1459585331-22707-1-git-send-email-mike.looijmans@topic.nl>
	<5703588F.1040406@topic.nl> <20160406171431.GB5060@mentor.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <570BA7BB.5090504@topic.nl>
Date: Mon, 11 Apr 2016 15:33:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160406171431.GB5060@mentor.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw3N1K80kK+Nu2574dD+yqLIf33z1YmNDgVssdjMoPQctKLX6m1Q83wxmkmp9ZDxeJR+O
	XFB+eAwsqUxyYmOuHE6gXhaAqQU2X/7w/twqlH6dGZ1bzocku18Cdr1jeJFWW6Rddxv2/kwQLRfG
	IOz0+ZnusJnLSmcWPVqOBCEQ19U3DzOnXJggVGRE3zIGf4LFXSHrYInT0Y/HVKB06twPZ/TLmluk
	7Tg6XBalzEp5QSaqnPcDV53YhOQ64y2vB2zkPriLFZJhYijeIOrG82fwxtkmr/gVltfWXMP075/K
	IiMH7Nv1J1aXtTWxIqPMqwU0hKQ1hiD4XLIl3hFpBYLN3tjDqcigOvSxdRnthmhn8Zn6n0JyRJam
	4Zxd1zDZJ4yM93fAlnXcMNvM65HAmqfLr2HQ6ht8WQhzIJdr84M1s6SxqpVpyfrUJD9R71PfeNN/
	qHP3ta1S7C0Uc3j3G+pVQ4n57na55L6Xn0EqG66RVFKOX/yKPNjqauYxqQMi5Q9ps7gkh9aqTuHt
	APW4T72M7XznVUBvn+ESTotms9+2yFRDy9YeA5u+SOVXiksmZSqGnDLhSmITG0DD80aFg93OrWiZ
	3JKVmi72ocgY5kMQSjs79ZXP6qCtgkU7fCdKIYkYHTFdidvNWQYgeli0BCCCQoD44XjkDg7yD5Yq
	U8AhVOOA3I0uRPQFdjbF+lS47xZ1ybiLFZJhYijeIOrG82fwxtljj63SmMafRxqspZYEdEJK
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 88.159.208.100
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00466450151827)
X-Recommended-Action: accept
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] waf-cross-answers: Fix faulty link cross-answers-mipsel.txt
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Apr 2016 00:09:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 06-04-16 19:14, Joe MacDonald wrote:
> Hi Mike,
>
> [Re: [PATCH] waf-cross-answers: Fix faulty link cross-answers-mipsel.txt]=
 On 16.04.05 (Tue 08:17) Mike Looijmans wrote:
>
>> Just a reminder that currently "waf" is broken and still won't work on
>> mipsel platforms without this bugfix.
>
> I merged this for you and pushed it a few minutes ago.  I don't have any
> MIPS hardware to test this on but I'm trusting that since you're
> reporting it's a build failure that validating for the Edgerouter is a
> valid test case.  Is that true?

Don't know that particular box, but if it failed to build (because it's mip=
sel=20
and reports a missing file) before this patch, then yes, that's okay as a t=
est.

M.


>
>>
>>
>> On 02-04-16 10:22, Mike Looijmans wrote:
>>> Apparently something was wrong in the patch "waf-cross-answers:
>>> Add cross-answers-mipsel.txt". and it created a dead symlink.
>>> Solve it by just copying the cross-answers-mips.txt instead of
>>> linking it.
>>>
>>> Fixes: 0898fb01ccea229cb0c64796b62f20a7c596ac0b
>>>
>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>> ---
>>>   .../waf-cross-answers/cross-answers-mipsel.txt     | 40 +++++++++++++=
++++++++-
>>>   1 file changed, 39 insertions(+), 1 deletion(-)
>>>   mode change 120000 =3D> 100644 meta-networking/files/waf-cross-answer=
s/cross-answers-mipsel.txt
>>>
>>> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips=
el.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
>>> deleted file mode 120000
>>> index 59b4337..0000000
>>> --- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
>>> +++ /dev/null
>>> @@ -1 +0,0 @@
>>> -cross-answers-mips.txt
>>> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips=
el.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
>>> new file mode 100644
>>> index 0000000..18bfa02
>>> --- /dev/null
>>> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
>>> @@ -0,0 +1,39 @@
>>> +Checking uname sysname type: "Linux"
>>> +Checking uname version type: "# Wed May 20 10:34:39 UTC 2015"
>>> +Checking simple C program: "hello world"
>>> +rpath library support: OK
>>> +-Wl,--version-script support: OK
>>> +Checking getconf LFS_CFLAGS: NO
>>> +Checking correct behavior of strtoll: NO
>>> +Checking for working strptime: OK
>>> +Checking for C99 vsnprintf: "1"
>>> +Checking for HAVE_SHARED_MMAP: OK
>>> +Checking for HAVE_MREMAP: OK
>>> +Checking for HAVE_SECURE_MKSTEMP: OK
>>> +Checking for HAVE_IFACE_GETIFADDRS: NO
>>> +Checking for HAVE_IFACE_IFCONF: NO
>>> +Checking for HAVE_IFACE_IFREQ: NO
>>> +Checking for large file support without additional flags: NO
>>> +Checking for -D_FILE_OFFSET_BITS=3D64: OK
>>> +Checking for HAVE_INCOHERENT_MMAP: NO
>>> +Checking value of NSIG: "128"
>>> +Checking value of _NSIG: "128"
>>> +Checking value of SIGRTMAX: "127"
>>> +Checking value of SIGRTMIN: "34"
>>> +Checking whether the WRFILE -keytab is supported: OK
>>> +Checking for kernel change notify support: OK
>>> +Checking for Linux kernel oplocks: OK
>>> +Checking for kernel share modes: OK
>>> +Checking whether POSIX capabilities are available: OK
>>> +Checking if can we convert from CP850 to UCS-2LE: OK
>>> +Checking if can we convert from UTF-8 to UCS-2LE: OK
>>> +vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
>>> +Checking whether we can use Linux thread-specific credentials: OK
>>> +Checking whether fcntl locking is available: OK
>>> +Checking for the maximum value of the 'time_t' type: NO
>>> +Checking whether the realpath function allows a NULL argument: OK
>>> +Checking for ftruncate extend: OK
>>> +getcwd takes a NULL argument: OK
>>> +Checking for small off_t: NO
>>> +Checking whether blkcnt_t is 32 bit: NO
>>> +Checking whether blkcnt_t is 64 bit: OK
>>>
>>
>>
>>
>> Kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>> TOPIC Embedded Products
>> Eindhovenseweg 32-C, NL-5683 KH Best
>> Postbus 440, NL-5680 AK Best
>> Telefoon: +31 (0) 499 33 69 79
>> E-mail: mike.looijmans@topicproducts.com
>> Website: www.topicproducts.com
>>
>> Please consider the environment before printing this e-mail
>>
>>
>>
>>
>>
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






