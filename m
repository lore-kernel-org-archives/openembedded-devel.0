Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 4D2FA610F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 18:04:21 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id CB07AF8121D; Wed, 18 Sep 2013 12:04:22 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 272FDF811FB;
	Wed, 18 Sep 2013 12:04:22 -0600 (MDT)
Message-ID: <5239EB61.1090805@mlbassoc.com>
Date: Wed, 18 Sep 2013 12:05:21 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAKS01ok2XmnwqMz2i0radhW3UB87AXmMa3zW2nxZpGmmBeE60g@mail.gmail.com>
In-Reply-To: <CAKS01ok2XmnwqMz2i0radhW3UB87AXmMa3zW2nxZpGmmBeE60g@mail.gmail.com>
Subject: Re: help with building image.
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
X-List-Received-Date: Wed, 18 Sep 2013 18:04:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-09-18 08:12, Anup Kini wrote:
> Hi All,
>
> When i try to run build images in HOB, i end up with the following error.
>
> dpkg-scanpackages: info: Wrote 4631 entries to output Packages file.
> dpkg-scanpackages: info: Wrote 38 entries to output Packages file.
> dpkg-scanpackages: info: Wrote 14 entries to output Packages file.
> Reading package lists...
> W: Unable to read
> /home/akini/oe/openembedded-core/build/tmp-eglibc-eglibc/sysroots/x86_64-linux/etc/apt/sources.list.d/
> - DirectoryExists (2: No such file or directory)
> W: Unable to read
> /home/akini/oe/openembedded-core/build/tmp-eglibc-eglibc/sysroots/x86_64-linux/etc/apt/sources.list
> - RealFileExists (2: No such file or directory)
> Reading package lists...
> Building dependency tree...
> W: Unable to read
> /home/akini/oe/openembedded-core/build/tmp-eglibc-eglibc/sysroots/x86_64-linux/etc/apt/sources.list.d/
> - DirectoryExists (2: No such file or directory)
> W: Unable to read
> /home/akini/oe/openembedded-core/build/tmp-eglibc-eglibc/sysroots/x86_64-linux/etc/apt/sources.list
> - RealFileExists (2: No such file or directory)
> W: You may want to run apt-get update to correct these problems
> E: Unable to locate package libgcc1
> E: Unable to locate package busybox
> E: Unable to locate package libglapi-dev
> ...
>
>
> What am i missing here ?
>

Actually, it's what we are missing (from you) in order to be able to help!

Please provide some more details - what are your values for:
   OE-core version?
   Host machine?
   Build target (machine)?

Exactly what steps did you perform to try this?
What might one need to do to recreate your problem?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

