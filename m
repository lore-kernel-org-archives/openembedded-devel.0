Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SkQh1-0004WF-9M
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jun 2012 04:12:19 +0200
Received: by pbbrq2 with SMTP id rq2so3735157pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 19:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=+Zl2pMW3rf66IoDNy5hS8ux2JhPK0ysdsPRJSC0Ob2Y=;
	b=buBD0Wq4VYC8Oll5xbSrjJv/QNAufEORRNN6Rd+DypZSmP4xrGY9lsC5czYwDwAedF
	vL8VLaK288Bj1ATPSEzdAjIcdz3JYyTe2ZbOyvaYpXH9/d/BU7jmkBQgQ1A+HgGeKq3A
	ATwHMdnzK20E/IK1R8iGnCFS9/HIlB2W2tOkD5IBoe8mj3XEtu35BH6NWKodyC4rr3NN
	VKhInLeK7XGWxt8TQzdCjVmGsRWGxWB7tKZz87vQ+QynYdhEg8VgXseML/iptFpenliz
	hUFdntl4k9ei8KsOE8m7rWynPVkgYkwn0IWob1/DCP4z4u3xYl0YFq9lpEVxFqEG+aLb
	2PPg==
Received: by 10.68.233.132 with SMTP id tw4mr717121pbc.61.1340935283144;
	Thu, 28 Jun 2012 19:01:23 -0700 (PDT)
Received: from [192.168.1.102] ([94.205.109.242])
	by mx.google.com with ESMTPS id hz10sm3834599pbc.32.2012.06.28.19.01.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 19:01:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAMKF1soU2SERBGQogpQb75YcEju0mYBtK0on=HMRn_Z2Mrp3jQ@mail.gmail.com>
Date: Fri, 29 Jun 2012 06:01:18 +0400
Message-Id: <2ABBABF5-255A-46DE-9455-69128710E79A@gmail.com>
References: <1340904942-41537-1-git-send-email-elvis.dowson@gmail.com>
	<CAMKF1soU2SERBGQogpQb75YcEju0mYBtK0on=HMRn_Z2Mrp3jQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1278)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xilinx] util-linux: rename file to util-linux_2.21.2.bbappend
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
X-List-Received-Date: Fri, 29 Jun 2012 02:12:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi Khem,

On Jun 29, 2012, at 4:13 AM, Khem Raj wrote:

> if this is a bbappend for meta-xilinx then this is not the right list
> for this patch
> Read http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/tree/README

I've resent the patch to the yocto discussion list.

Elvis


