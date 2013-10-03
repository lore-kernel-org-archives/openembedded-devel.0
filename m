Return-Path: <frederic.paut@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4735660FCA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2013 08:04:32 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Oct 2013 01:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1024,1371106800"; 
	d="scan'208,217";a="302579057"
Received: from fpaut-mobl2.mp.intel.com (HELO [10.237.24.31]) ([10.237.24.31])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Oct 2013 01:04:32 -0700
Message-ID: <524D2511.3090509@linux.intel.com>
Date: Thu, 03 Oct 2013 10:04:33 +0200
From: Frederic PAUT <frederic.paut@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1380726101-29289-1-git-send-email-frederic.paut@linux.intel.com>
	<CAJTo0Lbr21atGMqp7YiFjSSaP0oCNwz7GATBEfR=Wm9EnmzQDQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lbr21atGMqp7YiFjSSaP0oCNwz7GATBEfR=Wm9EnmzQDQ@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] autobahn recipe (v0.5.14)
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
X-List-Received-Date: Thu, 03 Oct 2013 08:04:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/02/2013 06:01 PM, Burton, Ross wrote:
> On 2 October 2013 16:01, Frederic PAUT <frederic.paut@linux.intel.com> wrote:
>> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
> This should be a file inside the source tree (relative paths are
> resolved from $S), best practise is to checksum the license file and
> the license header of a source file (you can restrict the md5 to a
> subset of lines).
Yes, because I don't found a license file in the source tree... But I 
will checksum the license of a source file to a subset of lines.
>
>> +FILES_${PN}-${PV} = " \
> Just FILES_${PN} here, but inherit distutils handles this for you, so
> you can delete this.
Ok, I will delete this.
>
> Ross
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Thanks,

Frederic

  * English - detected
  * English
  * French

  * English
  * French

<javascript:void(0);>
auto-copied

