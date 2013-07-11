Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 29FB86ADB5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2013 13:24:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jul 2013 06:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1043,1363158000"; d="scan'208";a="368621547"
Received: from unknown (HELO helios.localnet) ([10.252.122.35])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2013 06:24:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher W Mayer <cmayer1@binghamton.edu>
Date: Thu, 11 Jul 2013 14:24:54 +0100
Message-ID: <8377881.Svh8SavfTG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CAOys6npcxfg0e_udHbXtt-V57eJaXRtgU+j3WA0Gp+xOHGS5mQ@mail.gmail.com>
References: <CAOys6npcxfg0e_udHbXtt-V57eJaXRtgU+j3WA0Gp+xOHGS5mQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Using Xen from Meta-Virtualization
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
X-List-Received-Date: Thu, 11 Jul 2013 13:24:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Christopher,

On Tuesday 09 July 2013 12:23:35 Christopher W Mayer wrote:
> Hi Everyone,
>     I am trying to use the Meta-Virtualization layer to build Xen dom0
> support into an Open Embedded build. I've built the xen-image-minimal
> target but when I try to boot it as dom0, I get this error
> 
> 
> *'elf_xen_note_check: ERROR: Will only load images built for the
> generic loader or Linux images')*
> 
> I used this
> link<http://xen.1045712.n5.nabble.com/Panic-on-CPU0-Unable-to-boot-with-Xen
> -4-1-on-Fedora-16-manual-grub2-config-after-compiling-Xen-from-e-td5571653.h
> tml>,followed Ian Campbell's instructions (the third post down) and found
> that
> the kernel being built is not Xen capable. Am I missing something simple
> here? Is this a problem with the layer or am I using it wrong? Any help is
> appreciated.

You may be better off asking this question on the meta-virtualization mailing 
list:

https://lists.yoctoproject.org/listinfo/meta-virtualization

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

