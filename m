Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 937C9783F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:50:23 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id 63so10155681ywr.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 10:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+q4ZVJuBjpvrEqABsZ+mGVnkAQgIFBtT8ZY9wp8mn5Y=;
	b=EVbVRlg2ESlxhlIj8360h8/l+ZLi/Wnl1k5mezPIlPQr+vppjFLY2znaSnZP9vlO4d
	h1BbZMNP2UF3sgh6sSpQvhdPmWZegtIZ+dX9hT8dWBjjbygDqqpDcXuNda0jD5c2zD/4
	n9JeLyGsp6fZt59xZkqcJWBfsrrQJBKS/KGrlFmaNgACc3YQ99nce4Wvpd7bZo1tTSeK
	gBXqsMjQNn+i6g5iWubiSO/iakWGcxLAAI3cd5/2VWQ9xFCYGvVOFWl435l56fRrW93L
	l+1J5naNbJagPS8ybfagcyhg9dYr9E/pxmJq8Wolts5Ggds+1A4FI6qkIvY8/c2t2Ahv
	CqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+q4ZVJuBjpvrEqABsZ+mGVnkAQgIFBtT8ZY9wp8mn5Y=;
	b=I0f2AxUlANtOcT5iD2I20wSH/IbfX/mZg/Qh1aiAr/5WPiwoDOK00einn/1zVb/I8o
	P9Dd+zDJn7EWZ9T8IWhL53/27TZu7brQfylJ2+wZdP2XxuVzpmchSMpXKF1GA+jXm5LJ
	GSJdzN+jBZPjZoIfFH3Mw97Rto1BwSe7C1RGEATuYQgRrbRKe3yIu8KHWAJV2r7Dr2Se
	Ja1EEh7WUJnHZXGTqjlDGVZ7LWnaOeh7HT0cGiNJfUdJ5885E7giUrT3vD3qg7rK+WHS
	xrln5C1GfyYUI4qLLIrTI9qsndPty8IMYuC47fChzyL0qeJ5AlYT/rmqIJw7ogQbSjJz
	xp+Q==
X-Gm-Message-State: AKS2vOx19Obsbv5f5ykraxluWpX/cwZdnEv9dCU4kipXuJsQkM3/zgYI
	cYDBEyz9Jb6S+rxknNM5U2z4R9nDxg==
X-Received: by 10.13.200.135 with SMTP id k129mr5322768ywd.243.1497549024466; 
	Thu, 15 Jun 2017 10:50:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Thu, 15 Jun 2017 10:50:23 -0700 (PDT)
In-Reply-To: <ac7731a3-ff5c-b4c8-f8d9-1ee0d30e17a1@xevo.com>
References: <e0efb641-fd8b-a8ff-e952-7b32805cc45a@xevo.com>
	<2ef4f2a3-48e9-f3fa-a55e-01522507d86d@xevo.com>
	<CA+chaQeUWj=4zxG1gdk0pwg_U1GUdMmwr1F9DEL_7pT8S0UUQg@mail.gmail.com>
	<ac7731a3-ff5c-b4c8-f8d9-1ee0d30e17a1@xevo.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Jun 2017 19:50:23 +0200
Message-ID: <CA+chaQcnwYQwBXfxbdpEN8D9ZYzG=fOxX_MPNXt1_uzShSSrwg@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 00/14] new recipe: open-vm-tools recipe
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
X-List-Received-Date: Thu, 15 Jun 2017 17:50:24 -0000
Content-Type: text/plain; charset="UTF-8"

OK, I'll try to remember to fix it before merge.

I'm sorry about it, tweaking other people commits always strikes back :).

On Thu, Jun 15, 2017 at 7:40 PM, Martin Kelly <mkelly@xevo.com> wrote:

> On 06/15/2017 09:54 AM, Martin Jansa wrote:
>
>> It didn't make it to patchwork, because you've sent only the cover
>> letter. I've added it to master-next now.
>>
>> Next time please send also individual patches. So that it gets more
>> visibility for other people to comment and also that I can use patchwork
>> to pull it in.
>>
>> Regards,
>>
>>
> Small note: Looks like the initial commit (24b2ac) has a small typo that
> should ideally be fixed before it's merged into master:
>
> "open-vm-tools: add recipe from meat-foss-openswitch"
>
> "meat" --> "meta"
>
> On Thu, Jun 15, 2017 at 6:36 PM, Martin Kelly <mkelly@xevo.com
>> <mailto:mkelly@xevo.com>> wrote:
>>
>>     On 06/09/2017 03:22 PM, Martin Kelly wrote:
>>
>>         Hi all,
>>
>>         This patch series adds a new recipe for Open VM Tools to
>>         meta-oe. This
>>         recipe is invaluable for using Openembedded with VMWare, as
>>         without the
>>         tools, performance is very slow.
>>
>>         More information about Open VM Tools can be found here:
>>
>>         https://github.com/vmware/open-vm-tools
>>         <https://github.com/vmware/open-vm-tools>
>>
>>         Please note that, as mentioned in the first commit, this recipe is
>>         modified from the recipe originally found in the Open-Switch
>>         repository.
>>         The first patch is directly from that repository, and the
>> following
>>         patches are modifications to it.
>>
>>         Original recipe:
>>         https://github.com/open-switch/ops-build
>>         <https://github.com/open-switch/ops-build>
>>         yocto/openswitch/meta-foss-openswitch/recipes-extended/open-
>> vm-tools/open-vm-tools_10.0.5.bb
>>         <http://open-vm-tools_10.0.5.bb>
>>
>>         Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
>>
>>         Although the original recipe packaging was Apache-licensed, I
>>         received
>>         permission from the author (Diego Dompe) to relicense it under
>>         the MIT
>>         license for inclusion in meta-openembedded:
>>
>>         https://lists.openswitch.net/pipermail/ops-dev/2017-April/01
>> 4715.html
>>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/0
>> 14715.html>
>>         https://lists.openswitch.net/pipermail/ops-dev/2017-April/01
>> 4716.html
>>
>>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/0
>> 14716.html>
>>
>>         --
>>         The following changes since commit
>>         41cf832cc9abd6f2293a6d612463a34a53a9a52a:
>>
>>           Revert "rrdtool: add gettext-native dependency" (2017-06-05
>>         11:13:09
>>         +0200)
>>
>>         are available in the git repository at:
>>
>>           https://github.com/XevoInc/meta-openembedded
>>         <https://github.com/XevoInc/meta-openembedded>
>>
>>         for you to fetch changes up to
>>         402d1b3917195beb2ab7cac5dc94aaed8992b5a1:
>>
>>           open-vm-tools: style changes (2017-06-07 22:31:34 +0000)
>>
>>         ----------------------------------------------------------------
>>         Martin Kelly (14):
>>               add open-vm-tools recipe
>>               open-vm-tools: add missing pkgconfig dependency
>>               open-vm-tools: add missing glib-2.0-native dependency
>>               open-vm-tools: clarify and expand licensing
>>               open-vm-tools: base_contains --> bb.utils.contains
>>               open-vm-tools: update version to 10.1.5
>>               open-vm-tools: don't use mspack
>>               open-vm-tools: don't use dnet-config
>>               open-vm-tools: add #include to fix build break
>>               open-vm-tools: add missing X11 dependencies
>>               open-vm-tools: remove kernel module logic
>>               open-vm-tools: line up configure options
>>               open-vm-tools: support FUSE
>>               open-vm-tools: style changes
>>
>>          .../recipes-support/open-vm-tools/files/tools.conf |  2 +
>>          .../open-vm-tools/files/vmtoolsd.service           | 11 +++
>>          .../open-vm-tools/0001-Fix-kernel-detection.patch  | 35
>> +++++++++
>>          .../0002-configure.ac-don-t-use-dnet-config.patch  | 41
>> ++++++++++
>>          .../0003-add-include-sys-sysmacros.h.patch         | 33 ++++++++
>>          .../open-vm-tools/open-vm-tools_10.1.5.bb
>>         <http://open-vm-tools_10.1.5.bb>          | 90
>>         ++++++++++++++++++++++
>>          6 files changed, 212 insertions(+)
>>          create mode 100644
>>         meta-oe/recipes-support/open-vm-tools/files/tools.conf
>>          create mode 100644
>>         meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
>>          create mode 100644
>>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix
>> -kernel-detection.patch
>>
>>          create mode 100644
>>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-con
>> figure.ac-don-t-use-dnet-config.patch
>>
>>          create mode 100644
>>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add
>> -include-sys-sysmacros.h.patch
>>
>>          create mode 100644
>>         meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
>>         <http://open-vm-tools_10.1.5.bb>
>>         --
>>         2.1.4
>>
>>
>>     (ping)
>>
>>
>>

