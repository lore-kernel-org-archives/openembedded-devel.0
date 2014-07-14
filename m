Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 00AAD6028A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 09:25:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jul 2014 02:25:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,657,1400050800"; d="scan'208";a="569429514"
Received: from snaufer-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.80])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2014 02:24:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 14 Jul 2014 10:24:52 +0100
Message-ID: <3072899.OS8yJTfGtp@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.2 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.2; x86_64; ; )
In-Reply-To: <alpine.LFD.2.11.1407130915280.31826@localhost>
References: <alpine.LFD.2.11.1407130915280.31826@localhost>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: overriding tasks with EXPORT_FUNCTIONS
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
X-List-Received-Date: Mon, 14 Jul 2014 09:25:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Sunday 13 July 2014 10:19:08 Robert P. J. Day wrote:
>   followup to last post -- all of the methods for "overriding" task
> definitions in the last post can be used without predeclaring that
> you're about to do that; you just go ahead and do it in either a class
> file or a recipe file. on the other hand, EXPORT_FUNCTIONS allows you
> to retain the base definition of a task (or non-task function, as i
> read it), then define a more general enhanced version.
> 
>   (side note: i don't see a single mention of "EXPORT_FUNCTIONS" in
> any of the numerous yocto docs -- i think this feature needs some
> explanation *somewhere*. :-)

Did you try the new BitBake manual?

http://www.yoctoproject.org/docs/current/bitbake-user-manual/bitbake-user-manual.html#flexible-inheritance-for-class-functions

Let me know if that doesn't answer your questions.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

