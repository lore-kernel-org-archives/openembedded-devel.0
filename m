Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 754366AC95
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2014 01:51:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43695997"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2014 09:47:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAK1onUn031133;
	Thu, 20 Nov 2014 09:50:49 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD03.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6;
	Thu, 20 Nov 2014 09:51:08 +0800
Date: Thu, 20 Nov 2014 09:51:03 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20141120095103.2f61ea12@Fedora>
In-Reply-To: <20141119205646.GL6216@mentor.com>
References: <1416382491-11239-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<20141119205646.GL6216@mentor.com>
Organization: FNST
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-selinux][PATCH] ustr: Change the SRC_URI to upstream and add a new patch
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
X-List-Received-Date: Thu, 20 Nov 2014 01:51:15 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 19 Nov 2014 15:56:47 -0500
Joe MacDonald <Joe_MacDonald@mentor.com> wrote:

> Thanks for the submission.  Just a couple of comments.
> 
> [[oe] [meta-selinux][PATCH] ustr: Change the SRC_URI to upstream and add a
> new patch] On 14.11.19 (Wed 15:34) Qian Lei wrote:
> 
> > Official upstream is still Ok, using it first.
> > Add a new patch which is applied in Fedora20
> 
> As these are two unrelated issues, I think two patches would've been
> appropriate with 1/2 being the one that updates the SRC_URI and 2/2
> being the c99 patch.
> 
> You should also provide an upstream-status for the C99 patch.  As you
> say it came from Fedora, odds are it is already submitted upstream, so
> 'pending' could be appropriate here, but I don't know.
> 
> Finally, meta-selinux patches should go to yocto@yoctoproject.org (cc'd
> here), not the openembedded-dev@ list.
> 
> I'm fine with making the changes I described above or you can send out a
> new version of the patch/patches if you like.  I won't do anything with
> it before tomorrow, either way, to give everyone time to have a look.
> 
> -J.

Thanks for your reply.It really help me a lot. I'll take your advice and send a
new version of patches to yocto soon.

Qian Lei

