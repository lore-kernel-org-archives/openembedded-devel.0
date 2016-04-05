Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 3836 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Apr 2016 07:21:53 UTC
Received: from mx5-08.smtp.antispamcloud.com (mx5-08.smtp.antispamcloud.com
	[95.211.112.150])
	by mail.openembedded.org (Postfix) with ESMTP id D14EF6612D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 07:21:53 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx5.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1anKJE-0005Vj-U4; Tue, 05 Apr 2016 08:17:55 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 5 Apr 2016 08:17:51 +0200
To: <openembedded-devel@lists.openembedded.org>
References: <1459585331-22707-1-git-send-email-mike.looijmans@topic.nl>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <5703588F.1040406@topic.nl>
Date: Tue, 5 Apr 2016 08:17:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459585331-22707-1-git-send-email-mike.looijmans@topic.nl>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw3m8KyO/e3OFX2RUwx7xEEvBqm3RvM5N1UuDkdL5rJuDWYSHbx/2iEXlZ3vyVN/fF+gz
	Km9y7Whe8ULQ9t62Rc0ndW15SE/IKFJSR8Pb5cRhi5CFlBWMzDxw9krIeNGT2oSk+gz4DAuusc6y
	v33zM0busJnLSmcWPVqOBCEQ19U3DzOnXJggVGRE3zIGf4LFXQ5Bt/nD3xJz5faizVYAIvLEFXZ7
	gGAKs3NkUfWGVYzFnPcDV53YhOQ64y2vB2zkPriLFZJhYijeIOrG82fwxtkmr/gVltfWXMP075/K
	IiMH7Nv1J1aXtTWxIqPMqwU0hKQ1hiD4XLIl3hFpBYLN3tjDqcigOvSxdRnthmhn8Zn6n0JyRJam
	4Zxd1zDZJ4yM93fAlnXcMNvM65HAmqfLr2HQ6ht8WQhzIJdr84M1s6SxqpVpyfrUJD9R71PfeNN/
	qHP3ta1S7C0Uc3j3G+pVQ4n57na55L6Xn0EqG66RVFKOX/yKPNjqauYxqQMi5Q9ps7gkh9aqTuHt
	APW4T72M7XznVUBvn+ESTotms9+2yFRDy9YeA5u+SOVXiksmZSqGnLHbOxi8Uh+g9RNSShv22wwh
	EWyJzIkwSFAW0Pw8uiKebvzU++86bmAzdVZ1m/9034SVHZvr2DTXw/EXASfOQg6gRLBIyHFjsWZy
	mUK4TYbagd5cqVso720r7ULAXMtTA30+hzAnLdltOt7x6PhHgwQxL7hrJSk60SF3F6RYOYr2
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJXhXyDRoOQM5J3kcUr0HrMvJUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.0033986033797)
X-Recommended-Action: accept
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
X-List-Received-Date: Tue, 05 Apr 2016 07:21:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFJust a reminder that currently "waf" is broken and still won't wor=
k on mipsel=20
platforms without this bugfix.


On 02-04-16 10:22, Mike Looijmans wrote:
> Apparently something was wrong in the patch "waf-cross-answers:
> Add cross-answers-mipsel.txt". and it created a dead symlink.
> Solve it by just copying the cross-answers-mips.txt instead of
> linking it.
>
> Fixes: 0898fb01ccea229cb0c64796b62f20a7c596ac0b
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>   .../waf-cross-answers/cross-answers-mipsel.txt     | 40 +++++++++++++++=
++++++-
>   1 file changed, 39 insertions(+), 1 deletion(-)
>   mode change 120000 =3D> 100644 meta-networking/files/waf-cross-answers/=
cross-answers-mipsel.txt
>
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipsel=
.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> deleted file mode 120000
> index 59b4337..0000000
> --- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> +++ /dev/null
> @@ -1 +0,0 @@
> -cross-answers-mips.txt
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipsel=
.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> new file mode 100644
> index 0000000..18bfa02
> --- /dev/null
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> @@ -0,0 +1,39 @@
> +Checking uname sysname type: "Linux"
> +Checking uname version type: "# Wed May 20 10:34:39 UTC 2015"
> +Checking simple C program: "hello world"
> +rpath library support: OK
> +-Wl,--version-script support: OK
> +Checking getconf LFS_CFLAGS: NO
> +Checking correct behavior of strtoll: NO
> +Checking for working strptime: OK
> +Checking for C99 vsnprintf: "1"
> +Checking for HAVE_SHARED_MMAP: OK
> +Checking for HAVE_MREMAP: OK
> +Checking for HAVE_SECURE_MKSTEMP: OK
> +Checking for HAVE_IFACE_GETIFADDRS: NO
> +Checking for HAVE_IFACE_IFCONF: NO
> +Checking for HAVE_IFACE_IFREQ: NO
> +Checking for large file support without additional flags: NO
> +Checking for -D_FILE_OFFSET_BITS=3D64: OK
> +Checking for HAVE_INCOHERENT_MMAP: NO
> +Checking value of NSIG: "128"
> +Checking value of _NSIG: "128"
> +Checking value of SIGRTMAX: "127"
> +Checking value of SIGRTMIN: "34"
> +Checking whether the WRFILE -keytab is supported: OK
> +Checking for kernel change notify support: OK
> +Checking for Linux kernel oplocks: OK
> +Checking for kernel share modes: OK
> +Checking whether POSIX capabilities are available: OK
> +Checking if can we convert from CP850 to UCS-2LE: OK
> +Checking if can we convert from UTF-8 to UCS-2LE: OK
> +vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
> +Checking whether we can use Linux thread-specific credentials: OK
> +Checking whether fcntl locking is available: OK
> +Checking for the maximum value of the 'time_t' type: NO
> +Checking whether the realpath function allows a NULL argument: OK
> +Checking for ftruncate extend: OK
> +getcwd takes a NULL argument: OK
> +Checking for small off_t: NO
> +Checking whether blkcnt_t is 32 bit: NO
> +Checking whether blkcnt_t is 64 bit: OK
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






