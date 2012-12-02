Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tf4gu-0002CS-Ai
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Dec 2012 09:14:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB258XdI014575
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 1 Dec 2012 21:08:33 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sat, 1 Dec 2012 21:08:32 -0800
Message-ID: <50BAE251.9050702@windriver.com>
Date: Sat, 1 Dec 2012 23:08:33 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1354354717-1024-1-git-send-email-cazfi74@gmail.com>
	<3372743.V6Z4Mr4vuB@helios>
	<CAF6bG8fwWSuemoc1kKJVHKUt8KJ5F4WR_WskTyoPJw26C3Qf+w@mail.gmail.com>
In-Reply-To: <CAF6bG8fwWSuemoc1kKJVHKUt8KJ5F4WR_WskTyoPJw26C3Qf+w@mail.gmail.com>
Subject: Re: [PATCH] fakeroot: update to upstream version 1.18.4
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
X-List-Received-Date: Sun, 02 Dec 2012 08:14:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/12 4:12 PM, Marko Lindqvist wrote:
> On 1 December 2012 14:14, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> On Saturday 01 December 2012 11:38:37 Marko Lindqvist wrote:
>>> License is now GPLv3
>>>
>>> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
>>> ---
>>
>> Just out of interest, are you (or is anyone else for that matter) using
>> fakeroot in preference to pseudo which we already build as part of the normal
>> build process?
>
>   I'm not at the moment. Later I may bring to OpenEmbedded environment
> some scripts that use fakeroot, but even then adjusting the scripts is
> an option.

If there is anything that fakeroot is capable of doing that pseudo does not, or 
another reason why you want to use fakeroot instead, please let us know.

pseudo was developed originally to deal with a number of stability, enhancement 
and other requirements after using fakeroot, fakechroot and related tooling.

(Note, if you are using RPM, fakechroot likely won't work because it doesn't 
support going in and out of chroot across processes.)

>
>   - ML
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



