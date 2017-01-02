Return-Path: <prvs=01751883be=mike.looijmans@topicproducts.com>
X-Greylist: delayed 1113 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Jan 2017 08:37:14 UTC
Received: from mx12-14.smtp.antispamcloud.com (mx12-14.smtp.antispamcloud.com
	[46.165.232.184])
	by mail.openembedded.org (Postfix) with ESMTP id 51117605BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 08:37:14 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1cNxpE-0007cI-VI for openembedded-devel@lists.openembedded.org;
	Mon, 02 Jan 2017 09:18:41 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 Jan 2017 09:18:35 +0100
To: <openembedded-devel@lists.openembedded.org>
References: <15daa04b-92db-cc3f-f0f9-14ac92764641@topic.nl>
	<CALbNGRTvDGuegSZPiV1E7WteGqjdYQkjfdHtB-dU0B=PT8xzxg@mail.gmail.com>
	<2fe8322b-11d9-8e04-09ed-77c78cda59b1@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <45e5bbb8-6e17-d030-cf2c-f54e2c2e30ba@topic.nl>
Date: Mon, 2 Jan 2017 09:18:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <2fe8322b-11d9-8e04-09ed-77c78cda59b1@gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.14)
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNJNy
	fAtzNcQaY16WG8aJmVdvbigrrkTr49qoeP/l2xtwxbyHK+mQf/AhU8EdGN3y42bjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAAdpU0oUDqng6Dyy2mQeofiRZ6bDagNV+isswM9A9WkuZ1el35jO+WJBgrWGjAavfuifnL+9wg
	oTj4ygNPw1XfN1IUJ2+rCMPpQhII5VkEVC//8GRISD+lYCwA5l6/Q4nfg8y63jKKBrO1BroJmvb9
	eUfeSxHoryR0VpaMOdjZtRaRVYKU9W9tbmVXJBqdHHDml2fQHaY9hVoT9jGvxqBU4l5OTHLiyLVU
	tMfloK+xuF/fUy6xfZdyLRnwP1q5wC1e/tSnyqajZaK8dQ0opDJmuuoTXqzhUy5RQKuGT/+BppTN
	UHLGlF9+0lBb/Of/XUMf2YI5PogHEGUWoL6eStEYApwKXoD4iJBsNfB/QPOzo3NC59y3EFXUwBcT
	DQ0nlghOTckC4oN5XN7BzTWQhrf/s85ue82Of6DOWXDur+kZQrtbjQufD6LSY+mCDBRQSXg12O7e
	xZs3WniBPxy5Jg8b6QDuUevekYUa3+GyU0mcIF0=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
X-Recommended-Action: accept
Subject: Re: morty branch XFCE no longer builds, missing libwnck3
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
X-List-Received-Date: Mon, 02 Jan 2017 08:37:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFThere's no trace of any attempt to bring back 'libwnck3' in the mo=
rty branch,=20
am I the only one in the world using morty to build an XCFE image?


On 21-12-16 02:33, akuster808 wrote:
>
>
> On 12/20/2016 03:53 AM, Andreas M=C3=BCller wrote:
>> On Tue, Dec 20, 2016 at 10:54 AM, Mike Looijmans
>> <mike.looijmans@topic.nl> wrote:
>>> With current "morty" branches of OE-core and meta-openembedded, a build=
 of
>>> an xfce desktop image fails:
> There is a patch pending merge to Morty sitting in my morty-next
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakuste=
r/morty-next&id=3D4cb131f10885a84489cbcd3750a45f64f0547cda
>
>
> I will send a pull request.
>
> - armin
>>>
>>> NOTE: Resolving any missing task queue dependencies
>>> ERROR: Nothing PROVIDES 'libwnck3' (but
>>> /.../meta-oe/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-=
plugin_0.0.2.bb
>>>
>>> DEPENDS on or otherwise requires it). Close matches:
>>>    libwnck
>>> NOTE: Runtime target 'xfce4-hotcorner-plugin' is unbuildable, removing.=
..
>>> Missing or unbuildable dependency chain was: ['xfce4-hotcorner-plugin',
>>> 'libwnck3']
>>> NOTE: Runtime target 'packagegroup-xfce-extended' is unbuildable,
>>> removing...
>>> Missing or unbuildable dependency chain was: ['packagegroup-xfce-extend=
ed',
>>> 'xfce4-hotcorner-plugin', 'libwnck3']
>>> NOTE: Runtime target 'desktop-image' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['desktop-image',
>>> 'packagegroup-xfce-extended', 'xfce4-hotcorner-plugin', 'libwnck3']
>>>
>>>
>>>
>>>
>>> Kind regards,
>>>
>>> Mike Looijmans
>>> System Expert
>>>
>>> TOPIC Products
>>> Materiaalweg 4, NL-5681 RJ Best
>>> Postbus 440, NL-5680 AK Best
>>> Telefoon: +31 (0) 499 33 69 79
>>> E-mail: mike.looijmans@topicproducts.com
>>> Website: www.topicproducts.com
>>>
>>> Please consider the environment before printing this e-mail
>>>
>>>
>> So we need in morty at least
>>
>> commit 5b0060bbbacf405405e292e8a8e5db9589f63325
>> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> Date:   Tue Nov 1 17:28:21 2016 +0200
>>
>>      libwnck3: add a recipe
>>
>>      It is no longer needed in oe-core.
>>
>>      Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com=
>
>>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>>
>> and maybe (don't know the status of gnome.bbclass in morty) - but
>> should not do any harm
>>
>> commit 3be9eea720ba70fd3a9e4744401fd268e31731f8
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date:   Mon Dec 5 18:36:21 2016 -0800
>>
>>      libwnck3: Add missing dependency on gnome-common-native
>>
>>      Fixes configure errors
>>      ../libwnck-3.20.1/configure: line 13391: syntax error near
>> unexpected token `maximum'
>>      ../libwnck-3.20.1/configure: line 13391: `GNOME_COMPILE_WARNINGS(ma=
ximum)'
>>
>>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






